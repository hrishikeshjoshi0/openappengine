package com.openappengine.model.contract

import org.springframework.dao.DataIntegrityViolationException

import com.openappengine.model.billing.BillingCycle
import com.openappengine.model.product.Product;
import com.openappengine.services.contract.ContractCreationException;

class ContractController {
	
	def contractService
	
	def sequenceGeneratorService
	
	def orderService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [contractInstanceList: Contract.list(params), contractInstanceTotal: Contract.count()]
    }
	
	def filter() {
		def criteria = Contract.createCriteria()
		
		def contracts = criteria.list {
			like("contractNumber", "${params.contractNumber}%")
		}
		
		if(contracts?.size() != 0) {
			flash.message = message(code: 'default.records_not_found.message')
		}
		
		[contractInstanceList: contracts, contractInstanceTotal: contracts.size()]
	}

    def create() {
		String contractNumber = sequenceGeneratorService.getNextSequenceNumber("Contract")
        def contractInstance= new Contract(params)
		contractInstance.contractNumber = contractNumber
		[contractInstance:contractInstance]
    }
	
	def addLineItem() {
		[lineItem : new ContractLineItem(params)]
		redirect(controller:"contractLineItem",action: "show")
	}
	
	def createOrder() {
		def c = BillingCycle.createCriteria()
		def results = c.list {
			like("status", "NEW")
			order("toDate", "desc")
		}
		[billingCycles:results]
	}
	
	def createAllOrders() {
		def bc = BillingCycle.findByName(params.billingCycleId)
		def fromDate = bc.fromDate
		def toDate = bc.toDate
		
		orderService.createAllOrdersForBillingCycle(bc)
		bc.status = 'INVOICED-WAITING_FOR_PAYMENTS'
		flash.message = message(code: 'default.created.success.message', args: [
			message(code: 'contract.label', default: 'Order Generated')])
		render(view: "orderSuccess")
	}

    def save() {
    	def contractInstance = bindContract(params)
		try {
			contractService.createService(contractInstance)
		} catch(ContractCreationException e) {
			flash.message = message(code: 'default.created.error.message', args: [
				message(code: 'contract.label', default: 'Contract')])
			render(view: "create", model: [contractInstance: contractInstance])
			return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'contract.label', default: 'Contract'), contractInstance.contractId])
        redirect(action: "show", id: contractInstance.contractId)
    }
	
	def Contract bindContract(params)  {
		def contractInstance = new Contract()
		
		def count = params.itemCount.toInteger()
		for (int i=0; i<count; i++) {
			def lineItem = new ContractLineItem()
			lineItem.contract = contractInstance
			Product product = Product.get(params["lineItems["+i+"].productId"])
			lineItem.product = product
			
			String fromDt = params["lineItems["+i+"].lineItemFromDate"]
			String toDt = params["lineItems["+i+"].lineItemToDate"]
			Date fromDate = Date.parse("MM/dd/yyyy", fromDt);
			Date toDate = Date.parse("MM/dd/yyyy", toDt);
			
			lineItem.fromDate = fromDate
			lineItem.toDate = toDate
			
			bindData(lineItem, params["lineItems["+i+"]"])
			contractInstance.lineItems[i] = lineItem
		}
			  
		contractInstance.properties = params
		return contractInstance
	}

    def show() {
        def contractInstance = Contract.get(params.id)
        if (!contractInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'contract.label', default: 'Contract'), params.id])
            redirect(action: "list")
            return
        }

        [contractInstance: contractInstance]
    }
	
	def terminate() {
		def contractInstance = Contract.get(params.id)
		if (!contractInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'contract.label', default: 'Contract'), params.id])
			redirect(action: "list")
			return
		}

		[contractInstance: contractInstance]
	}
	
	def terminateContract() {
		
		if (!params.id) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'contract.label', default: 'Contract'), params.id])
			redirect(action: "list")
			return
		}
		
		if(!params.toDate) {
			flash.message = message(code: 'contract.terminate.end_date_not_entered.message')
			redirect(action: "terminate",model:[contractInstance:contractInstance])
			return
		}
		
		def contractInstance = Contract.get(params.id)
		Date toDate = Date.parse("MM/dd/yyyy", params.toDate)
		
		contractService.terminateContract(contractInstance, toDate);
		
		flash.message = message(code: 'contract.terminated.message', args: [contractInstance.contractNumber, toDate])
		redirect(action: "list")
	}

    def edit() {
        def contractInstance = Contract.get(params.id)
        if (!contractInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contract.label', default: 'Contract'), params.id])
            redirect(action: "list")
            return
        }

        [contractInstance: contractInstance]
    }

    def update() {
        def contractInstance = Contract.get(params.id)
        if (!contractInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contract.label', default: 'Contract'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (contractInstance.version > version) {
                contractInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'contract.label', default: 'Contract')] as Object[],
                          "Another user has updated this Contract while you were editing")
                render(view: "edit", model: [contractInstance: contractInstance])
                return
            }
        }

        contractInstance.properties = params

        if (!contractInstance.save(flush: true)) {
            render(view: "edit", model: [contractInstance: contractInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'contract.label', default: 'Contract'), contractInstance.id])
        redirect(action: "show", id: contractInstance.id)
    }

    def delete() {
        def contractInstance = Contract.get(params.id)
        if (!contractInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'contract.label', default: 'Contract'), params.id])
            redirect(action: "list")
            return
        }

        try {
            contractInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'contract.label', default: 'Contract'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contract.label', default: 'Contract'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}

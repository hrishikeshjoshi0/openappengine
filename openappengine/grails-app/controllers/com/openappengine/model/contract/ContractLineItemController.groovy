package com.openappengine.model.contract

import org.apache.commons.lang.time.DateUtils;
import org.springframework.dao.DataIntegrityViolationException

import com.openappengine.model.product.Product;


class ContractLineItemController {

	def contractService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [contractLineItemInstanceList: ContractLineItem.list(params), contractLineItemInstanceTotal: ContractLineItem.count()]
    }

    def create() {
		def contractInstance = Contract.get(params.contract.contractId)
		Date endDate = contractService.getMostRecentOrdersEndDate(contractInstance)
		Date fromDate = endDate.plus(1)
		params.fromDate = fromDate
		params.toDate = Date.parse("yyyy-MM-dd", "9999-12-31")
        [contractLineItemInstance: new ContractLineItem(params)]
    }

    def save() {
		def contractInstance = Contract.get(params.contract.contractId)
        def contractLineItemInstance = new ContractLineItem(params)
		contractLineItemInstance.setContract(contractInstance)
		contractLineItemInstance.initLineItem()
		
        if (!contractLineItemInstance.save(flush: true)) {
            render(view: "create", model: [contractLineItemInstance: contractLineItemInstance])
            return
        }

		flash.message = message(code: 'default.created.message')
        redirect(controller:"contract",action: "show", id: params.contract.contractId)
    }

    def show() {
        def contractLineItemInstance = ContractLineItem.get(params.id)
        if (!contractLineItemInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'contractLineItem.label', default: 'ContractLineItem'), params.id])
            redirect(action: "list")
            return
        }

        [contractLineItemInstance: contractLineItemInstance]
    }
	
	def terminate() {
		def contractLineItemInstance = ContractLineItem.get(params.id)
		if (!contractLineItemInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'contractLineItem.label', default: 'ContractLineItem'), params.id])
			redirect(action: "list")
			return
		}

		[contractLineItemInstance: contractLineItemInstance]
	}
	
	def terminateContractLineItem() {
		
		if (!params.id) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'contractLineItem.label', default: 'Contract Line Item'), params.id])
			redirect(action: "list")
			return
		}
		
		if(!params.toDate) {
			flash.message = message(code: 'contractLineItem.terminate.end_date_not_entered.message')
			redirect(action: "terminate",model:[contractInstance:contractInstance])
			return
		}
		
		def contractLineItemInstance = ContractLineItem.get(params.id)
		
		contractService.terminateContractLineItem(contractLineItemInstance, params.toDate);
		
		flash.message = message(code: 'contractLineItem.terminated.message', args: [contractLineItemInstance.contract.contractNumber, params.toDate.toString()])
		redirect(controller:"contract",action: "list")
	}

    def edit() {
        def contractLineItemInstance = ContractLineItem.get(params.id)
        if (!contractLineItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contractLineItem.label', default: 'ContractLineItem'), params.id])
            redirect(action: "list")
            return
        }

        [contractLineItemInstance: contractLineItemInstance]
    }

    def update() {
        def contractLineItemInstance = ContractLineItem.get(params.id)
        if (!contractLineItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contractLineItem.label', default: 'ContractLineItem'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (contractLineItemInstance.version > version) {
                contractLineItemInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'contractLineItem.label', default: 'ContractLineItem')] as Object[],
                          "Another user has updated this ContractLineItem while you were editing")
                render(view: "edit", model: [contractLineItemInstance: contractLineItemInstance])
                return
            }
        }

        contractLineItemInstance.properties = params

        if (!contractLineItemInstance.save(flush: true)) {
            render(view: "edit", model: [contractLineItemInstance: contractLineItemInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'contractLineItem.label', default: 'ContractLineItem'), contractLineItemInstance.id])
        redirect(action: "show", id: contractLineItemInstance.id)
    }

    def delete() {
        def contractLineItemInstance = ContractLineItem.get(params.id)
        if (!contractLineItemInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'contractLineItem.label', default: 'ContractLineItem'), params.id])
            redirect(action: "list")
            return
        }

        try {
            contractLineItemInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'contractLineItem.label', default: 'ContractLineItem'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contractLineItem.label', default: 'ContractLineItem'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def ajaxGetProductPrice() {
		def product = Product.get(params.id)
		if(product) {
			BigDecimal price = product.getProductPrice(new Date())
			render price
		}
	}
}

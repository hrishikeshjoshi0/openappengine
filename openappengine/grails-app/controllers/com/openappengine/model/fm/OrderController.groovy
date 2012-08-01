package com.openappengine.model.fm

import grails.converters.JSON

import org.springframework.dao.DataIntegrityViolationException

import com.openappengine.master.OrderStatus;
import com.openappengine.model.product.Product
import com.openappengine.util.DateUtils;

class OrderController {
	
	def orderService
	
	def sequenceGeneratorService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		Date curDate = new Date()
		curDate = org.apache.commons.lang.time.DateUtils.addMonths(curDate,-1)
		params.fromDate = DateUtils.getFirstDayOfMonth(curDate)
		params.toDate = DateUtils.getLastDayOfMonth(curDate)
		params.status = "ALL"
        filter()
    }
	
	def filter() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def c  = OhOrderHeader.createCriteria()
		def orders = c.list {
			like("externalId", "${params.orderNumber}%")
			if(params.status != "ALL") {
				like("status", "${params.status}")
			}
			between("orderDate", params.fromDate, params.toDate)
		}
		
		if(orders?.size() == 0) {
			flash.message = message(code: 'default.records_not_found.message')
		}
		
		[ohOrderHeaderInstanceList: orders, ohOrderHeaderInstanceTotal: orders.size()]
	}

    def create() {
    	def ohOrderHeaderInstance= new OhOrderHeader(params)
		String orderNumber = sequenceGeneratorService.getNextSequenceNumber("Order")
		ohOrderHeaderInstance.externalId = orderNumber
		ohOrderHeaderInstance.orderName = orderNumber
		ohOrderHeaderInstance.entryDate = new Date()
		ohOrderHeaderInstance.orderType = "SO"
		ohOrderHeaderInstance.status = "NEW"
        [ohOrderHeaderInstance: ohOrderHeaderInstance]
    }
	
	def addLineItem() {
		def orderItem = new OiOrderItem(params)
		orderItem.quantity = new BigDecimal(1.0)
		[oiOrderItemInstance : orderItem]
		render ""
	}
	
    def invoiceOrder() {
        def ohOrderHeaderInstance = bindOrder(params)
		ohOrderHeaderInstance.entryDate = new Date()
		ohOrderHeaderInstance.status = "INVOICED"
        if (!ohOrderHeaderInstance.save(flush: true)) {
            render(view: "create", model: [ohOrderHeaderInstance: ohOrderHeaderInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'ohOrderHeader.label', default: 'OhOrderHeader'),
			ohOrderHeaderInstance.orderId
		])
		
		redirect(action: "show", id: ohOrderHeaderInstance.orderId)
    }
	
	def OhOrderHeader bindOrder(params)  {
		def orderHeaderInstance = new OhOrderHeader(params)
		orderHeaderInstance.partyNumber = orderHeaderInstance.billingAccountId 
		
		def count = params.itemCount.toInteger()
		
		for (int i=0; i<count; i++) {
			def lineItem = new OiOrderItem()
			lineItem.orderHeader = orderHeaderInstance
			Product product = Product.get(params["lineItems["+i+"].productId"])
			lineItem.product = product
			lineItem.orderItemSequenceId = (i+1);
			bindData(lineItem, params["lineItems["+i+"]"])
			orderHeaderInstance.orderItems[i] = lineItem
		}
			  
		orderHeaderInstance.properties = params
		return orderHeaderInstance
	}

    def show() {
        def ohOrderHeaderInstance = OhOrderHeader.get(params.id)
        if (!ohOrderHeaderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ohOrderHeader.label', default: 'OhOrderHeader'), params.id])
            redirect(action: "list")
            return
        }

        [ohOrderHeaderInstance: ohOrderHeaderInstance]
    }
	
	def orderStatusReport() {
		Date curDate = new Date()
		curDate = org.apache.commons.lang.time.DateUtils.addMonths(curDate,-1)
		params.fromDate = DateUtils.getFirstDayOfMonth(curDate)
		params.toDate = DateUtils.getLastDayOfMonth(curDate)
		params.status = "ALL"
		orderStatusReportFilter()
	}
	
	def orderStatusReportFilter() {
		def c  = OhOrderHeader.createCriteria()
		def orders = c.list {
			if(params.status != "ALL") {
				like("status", "${params.status}")
			} else {
				like("status", "%%")
			}
			between("orderDate", params.fromDate, params.toDate)
		}
		
		if(orders?.size() == 0) {
			flash.message = message(code: 'default.records_not_found.message')
		}
		
		[ohOrderHeaderInstanceList: orders, ohOrderHeaderInstanceTotal: orders.size()]
		
	}

    def edit() {
        def ohOrderHeaderInstance = OhOrderHeader.get(params.id)
        if (!ohOrderHeaderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ohOrderHeader.label', default: 'OhOrderHeader'), params.id])
            redirect(action: "list")
            return
        }

        [ohOrderHeaderInstance: ohOrderHeaderInstance]
    }

    def update() {
        def ohOrderHeaderInstance = OhOrderHeader.get(params.id)
        if (!ohOrderHeaderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ohOrderHeader.label', default: 'OhOrderHeader'), params.id])
            redirect(action: "list")
            return
        }

        ohOrderHeaderInstance.properties = params

        if (!ohOrderHeaderInstance.save(flush: true)) {
            render(view: "edit", model: [ohOrderHeaderInstance: ohOrderHeaderInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'ohOrderHeader.label', default: 'OhOrderHeader'), ohOrderHeaderInstance.id])
        redirect(action: "show", id: ohOrderHeaderInstance.id)
    }
	
	def cancel() {
		def ohOrderHeaderInstance = OhOrderHeader.get(params.id)
		if (!ohOrderHeaderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ohOrderHeader.label', default: 'OhOrderHeader'), params.id])
			redirect(action: "list")
			return
		}

		[ohOrderHeaderInstance: ohOrderHeaderInstance]
	}
	
	def cancelOrder() {
		def ohOrderHeaderInstance = OhOrderHeader.get(params.id)
		if (!ohOrderHeaderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ohOrderHeader.label', default: 'OhOrderHeader'), params.id])
			redirect(action: "list")
			return
		}

		ohOrderHeaderInstance.status = OrderStatus.CANCELLED

		if (!ohOrderHeaderInstance.save(flush: true)) {
			redirect(action: "list")
			return
		}

		flash.message = "Order #" + ohOrderHeaderInstance.externalId + " cancelled."
		redirect(action: "show", id: ohOrderHeaderInstance.orderId)
	}
	
	def complete() {
		def ohOrderHeaderInstance = OhOrderHeader.get(params.id)
		if (!ohOrderHeaderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ohOrderHeader.label', default: 'OhOrderHeader'), params.id])
			redirect(action: "list")
			return
		}

		[ohOrderHeaderInstance: ohOrderHeaderInstance]
	}
	
	def completeOrder() {
		def ohOrderHeaderInstance = OhOrderHeader.get(params.id)
		if (!ohOrderHeaderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ohOrderHeader.label', default: 'OhOrderHeader'), params.id])
			redirect(action: "list")
			return
		}

		ohOrderHeaderInstance.status = OrderStatus.CANCELLED

		if (!ohOrderHeaderInstance.save(flush: true)) {
			redirect(action: "list")
			return
		}

		flash.message = "Order #" + ohOrderHeaderInstance.externalId + " cancelled."
		redirect(action: "show", id: ohOrderHeaderInstance.orderId)
	}

    def delete() {
        def ohOrderHeaderInstance = OhOrderHeader.get(params.id)
        if (!ohOrderHeaderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ohOrderHeader.label', default: 'OhOrderHeader'), params.id])
            redirect(action: "list")
            return
        }

        try {
            ohOrderHeaderInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'ohOrderHeader.label', default: 'OhOrderHeader'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ohOrderHeader.label', default: 'OhOrderHeader'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}

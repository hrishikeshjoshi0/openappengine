package com.openappengine.model.batch

import org.apache.commons.lang.StringUtils
import org.springframework.dao.DataIntegrityViolationException

import com.openappengine.model.billing.BillingCycle
import com.openappengine.model.fm.OhOrderHeader

class BulkPaymentUploadController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [bulkPaymentUploadInstanceList: BulkPaymentUpload.list(params), bulkPaymentUploadInstanceTotal: BulkPaymentUpload.count()]
    }
	
	def uploadBulkPayments() {
		def bulkPaymentUploadInstance = BulkPaymentUpload.get(params.id)
		if (!bulkPaymentUploadInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'bulkPaymentUpload.label', default: 'BulkPaymentUpload'), params.id])
			redirect(action: "list")
			return
		}
		
		if(bulkPaymentUploadInstance.uploadItems) {
			bulkPaymentUploadInstance.uploadItems.eachWithIndex {item, i ->
				//
				if(!StringUtils.equals(item.status, 'PROCESSING_COMPLETE')) {
					//Get the billing cycle
					def bc = BillingCycle.findByName(item.billingCycleId)
					
					if(bc) {
						def order = OhOrderHeader.findByBillingCycleAndBillingAccountId(bc,item.partyExternalId)
						if(order) {
								
						}
					}
				}
			}
		}
	}

    def create() {
        [bulkPaymentUploadInstance: new BulkPaymentUpload(params)]
    }

    def save() {
        def bulkPaymentUploadInstance = new BulkPaymentUpload(params)
        if (!bulkPaymentUploadInstance.save(flush: true)) {
            render(view: "create", model: [bulkPaymentUploadInstance: bulkPaymentUploadInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'bulkPaymentUpload.label', default: 'BulkPaymentUpload'), bulkPaymentUploadInstance.id])
        redirect(action: "show", id: bulkPaymentUploadInstance.id)
    }

    def show() {
        def bulkPaymentUploadInstance = BulkPaymentUpload.get(params.id)
        if (!bulkPaymentUploadInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'bulkPaymentUpload.label', default: 'BulkPaymentUpload'), params.id])
            redirect(action: "list")
            return
        }

        [bulkPaymentUploadInstance: bulkPaymentUploadInstance]
    }

    def edit() {
        def bulkPaymentUploadInstance = BulkPaymentUpload.get(params.id)
        if (!bulkPaymentUploadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bulkPaymentUpload.label', default: 'BulkPaymentUpload'), params.id])
            redirect(action: "list")
            return
        }

        [bulkPaymentUploadInstance: bulkPaymentUploadInstance]
    }

    def update() {
        def bulkPaymentUploadInstance = BulkPaymentUpload.get(params.id)
        if (!bulkPaymentUploadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bulkPaymentUpload.label', default: 'BulkPaymentUpload'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (bulkPaymentUploadInstance.version > version) {
                bulkPaymentUploadInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'bulkPaymentUpload.label', default: 'BulkPaymentUpload')] as Object[],
                          "Another user has updated this BulkPaymentUpload while you were editing")
                render(view: "edit", model: [bulkPaymentUploadInstance: bulkPaymentUploadInstance])
                return
            }
        }

        bulkPaymentUploadInstance.properties = params

        if (!bulkPaymentUploadInstance.save(flush: true)) {
            render(view: "edit", model: [bulkPaymentUploadInstance: bulkPaymentUploadInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'bulkPaymentUpload.label', default: 'BulkPaymentUpload'), bulkPaymentUploadInstance.id])
        redirect(action: "show", id: bulkPaymentUploadInstance.id)
    }

    def delete() {
        def bulkPaymentUploadInstance = BulkPaymentUpload.get(params.id)
        if (!bulkPaymentUploadInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'bulkPaymentUpload.label', default: 'BulkPaymentUpload'), params.id])
            redirect(action: "list")
            return
        }

        try {
            bulkPaymentUploadInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'bulkPaymentUpload.label', default: 'BulkPaymentUpload'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'bulkPaymentUpload.label', default: 'BulkPaymentUpload'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}

package com.openappengine.model.fm

import org.springframework.dao.DataIntegrityViolationException
import com.openappengine.model.batch.BulkPaymentUpload
import com.openappengine.model.batch.BulkPaymentUploadItem
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.*

class PaymentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [fmPaymentInstanceList: FmPayment.list(params), fmPaymentInstanceTotal: FmPayment.count()]
    }
	
	def filter() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def c  = FmPayment.createCriteria()
		def payments = c.list {
			like("paymentNumber", "${params.paymentNumber}%")
			like("orderNumber", "${params.orderNumber}%")
			like("contractExternalId", "${params.contractExternalId}%")
		}
		
		if(payments?.size() != 0) {
			flash.message = message(code: 'default.records_not_found.message')
		}
		
		[fmPaymentInstanceList: payments, fmPaymentInstanceTotal: payments.size()]
	}

    def create() {
        [fmPaymentInstance: new FmPayment(params)]
    }

    def save() {
        def fmPaymentInstance = new FmPayment(params)
        if (!fmPaymentInstance.save(flush: true)) {
            render(view: "create", model: [fmPaymentInstance: fmPaymentInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'fmPayment.label', default: 'FmPayment'), fmPaymentInstance.id])
        redirect(action: "show", id: fmPaymentInstance.id)
    }

    def show() {
        def fmPaymentInstance = FmPayment.get(params.id)
        if (!fmPaymentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'fmPayment.label', default: 'FmPayment'), params.id])
            redirect(action: "list")
            return
        }

        [fmPaymentInstance: fmPaymentInstance]
    }

    def edit() {
        def fmPaymentInstance = FmPayment.get(params.id)
        if (!fmPaymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fmPayment.label', default: 'FmPayment'), params.id])
            redirect(action: "list")
            return
        }

        [fmPaymentInstance: fmPaymentInstance]
    }

    def update() {
        def fmPaymentInstance = FmPayment.get(params.id)
        if (!fmPaymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fmPayment.label', default: 'FmPayment'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (fmPaymentInstance.version > version) {
                fmPaymentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'fmPayment.label', default: 'FmPayment')] as Object[],
                          "Another user has updated this FmPayment while you were editing")
                render(view: "edit", model: [fmPaymentInstance: fmPaymentInstance])
                return
            }
        }

        fmPaymentInstance.properties = params

        if (!fmPaymentInstance.save(flush: true)) {
            render(view: "edit", model: [fmPaymentInstance: fmPaymentInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'fmPayment.label', default: 'FmPayment'), fmPaymentInstance.id])
        redirect(action: "show", id: fmPaymentInstance.id)
    }

    def delete() {
        def fmPaymentInstance = FmPayment.get(params.id)
        if (!fmPaymentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'fmPayment.label', default: 'FmPayment'), params.id])
            redirect(action: "list")
            return
        }

        try {
            fmPaymentInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'fmPayment.label', default: 'FmPayment'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'fmPayment.label', default: 'FmPayment'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def paymentUpload(){
		
	}
	
	def uploadRecords(){
		def a = 1000
		def bulkPaymentUploadInstance = new BulkPaymentUpload(params)
		bulkPaymentUploadInstance.bulkPaymentUploadId =  4
		bulkPaymentUploadInstance.status = 'NEW'
		bulkPaymentUploadInstance.uploadTimestamp = new Date()
		//bulkPaymentUploadInstance.uploadItems = BulkPaymentUploadItem.get(1)
		bulkPaymentUploadInstance.save(flush:true)
		
		List<JSON> payments = JSON.parse(params.data)
		payments.each {
		a = a+1
		def paymentItem = new BulkPaymentUploadItem()
		
		paymentItem.bulkPaymentUploadItemId = a
		if(it[0]=='null')
		{
			it[0]=0
		}
		paymentItem.partyExternalId = it[0]
		paymentItem.amount = it[1]
		paymentItem.bulkPaymentUpload = payment
		paymentItem.uploadTimestamp = new Date()
		paymentItem.status = 'NEW'
		paymentItem.billingCycleId = 'NEW'
		//payments.addToBulkPaymentUpload()
		//paymentItem.save(flush:true)
		}
		
		payment.save(flush:true)
	}
}

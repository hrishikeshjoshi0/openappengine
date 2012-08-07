package com.openappengine.model.billing

import org.springframework.dao.DataIntegrityViolationException

class BillingCycleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [billingCycleInstanceList: BillingCycle.list(params), billingCycleInstanceTotal: BillingCycle.count()]
    }

    def create() {
        [billingCycleInstance: new BillingCycle(params)]
    }

    def save() {
        def billingCycleInstance = new BillingCycle(params)
		
		def fromDate = billingCycleInstance.fromDate
		def cal = Calendar.getInstance()
		cal.setTime(fromDate)
		def month = cal.get(Calendar.MONTH)+1
		def year = cal.get(Calendar.YEAR)
		billingCycleInstance.name = year + "" + String.format("%02d", month);
		billingCycleInstance.status = 'NEW'
		
        if (!billingCycleInstance.save(flush: true)) {
            render(view: "create", model: [billingCycleInstance: billingCycleInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'billingCycle.label', default: 'BillingCycle'), billingCycleInstance.billingCycleId])
        redirect(action: "show", id: billingCycleInstance.billingCycleId)
    }

    def show() {
        def billingCycleInstance = BillingCycle.get(params.billingCycleId)
        if (!billingCycleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'billingCycle.label', default: 'BillingCycle'), params.billingCycleId])
            redirect(action: "list")
            return
        }

        [billingCycleInstance: billingCycleInstance]
    }

    def edit() {
        def billingCycleInstance = BillingCycle.get(params.billingCycleId)
        if (!billingCycleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'billingCycle.label', default: 'BillingCycle'), params.billingCycleId])
            redirect(action: "list")
            return
        }

        [billingCycleInstance: billingCycleInstance]
    }

    def update() {
        def billingCycleInstance = BillingCycle.get(params.billingCycleId)
        if (!billingCycleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'billingCycle.label', default: 'BillingCycle'), params.billingCycleId])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (billingCycleInstance.version > version) {
                billingCycleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'billingCycle.label', default: 'BillingCycle')] as Object[],
                          "Another user has updated this BillingCycle while you were editing")
                render(view: "edit", model: [billingCycleInstance: billingCycleInstance])
                return
            }
        }

        billingCycleInstance.properties = params

        if (!billingCycleInstance.save(flush: true)) {
            render(view: "edit", model: [billingCycleInstance: billingCycleInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'billingCycle.label', default: 'BillingCycle'), billingCycleInstance.billingCycleId])
        redirect(action: "show", id: billingCycleInstance.billingCycleId)
    }

    def delete() {
        def billingCycleInstance = BillingCycle.get(params.billingCycleId)
        if (!billingCycleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'billingCycle.label', default: 'BillingCycle'), params.billingCycleId])
            redirect(action: "list")
            return
        }

        try {
            billingCycleInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'billingCycle.label', default: 'BillingCycle'), params.billingCycleId])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'billingCycle.label', default: 'BillingCycle'), params.billingCycleId])
            redirect(action: "show", id: params.billingCycleId)
        }
    }
}

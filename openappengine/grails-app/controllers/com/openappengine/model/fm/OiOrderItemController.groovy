package com.openappengine.model.fm

import org.springframework.dao.DataIntegrityViolationException

class OiOrderItemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [oiOrderItemInstanceList: OiOrderItem.list(params), oiOrderItemInstanceTotal: OiOrderItem.count()]
    }

    def create() {
        [oiOrderItemInstance: new OiOrderItem(params)]
    }

    def save() {
        def oiOrderItemInstance = new OiOrderItem(params)
        if (!oiOrderItemInstance.save(flush: true)) {
            render(view: "create", model: [oiOrderItemInstance: oiOrderItemInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'oiOrderItem.label', default: 'OiOrderItem'), oiOrderItemInstance.id])
        redirect(action: "show", id: oiOrderItemInstance.id)
    }

    def show() {
        def oiOrderItemInstance = OiOrderItem.get(params.id)
        if (!oiOrderItemInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'oiOrderItem.label', default: 'OiOrderItem'), params.id])
            redirect(action: "list")
            return
        }

        [oiOrderItemInstance: oiOrderItemInstance]
    }

    def edit() {
        def oiOrderItemInstance = OiOrderItem.get(params.id)
        if (!oiOrderItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'oiOrderItem.label', default: 'OiOrderItem'), params.id])
            redirect(action: "list")
            return
        }

        [oiOrderItemInstance: oiOrderItemInstance]
    }

    def update() {
        def oiOrderItemInstance = OiOrderItem.get(params.id)
        if (!oiOrderItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'oiOrderItem.label', default: 'OiOrderItem'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (oiOrderItemInstance.version > version) {
                oiOrderItemInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'oiOrderItem.label', default: 'OiOrderItem')] as Object[],
                          "Another user has updated this OiOrderItem while you were editing")
                render(view: "edit", model: [oiOrderItemInstance: oiOrderItemInstance])
                return
            }
        }

        oiOrderItemInstance.properties = params

        if (!oiOrderItemInstance.save(flush: true)) {
            render(view: "edit", model: [oiOrderItemInstance: oiOrderItemInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'oiOrderItem.label', default: 'OiOrderItem'), oiOrderItemInstance.id])
        redirect(action: "show", id: oiOrderItemInstance.id)
    }

    def delete() {
        def oiOrderItemInstance = OiOrderItem.get(params.id)
        if (!oiOrderItemInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'oiOrderItem.label', default: 'OiOrderItem'), params.id])
            redirect(action: "list")
            return
        }

        try {
            oiOrderItemInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'oiOrderItem.label', default: 'OiOrderItem'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'oiOrderItem.label', default: 'OiOrderItem'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}

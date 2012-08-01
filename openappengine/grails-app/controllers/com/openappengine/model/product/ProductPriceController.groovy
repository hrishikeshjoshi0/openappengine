package com.openappengine.model.product

import org.springframework.dao.DataIntegrityViolationException

class ProductPriceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [prodProductPriceInstanceList: ProdProductPrice.list(params), prodProductPriceInstanceTotal: ProdProductPrice.count()]
    }

    def create() {
        [prodProductPriceInstance: new ProdProductPrice(params)]
    }

    def save() {
        def prodProductPriceInstance = new ProdProductPrice(params)
        if (!prodProductPriceInstance.save(flush: true)) {
            render(view: "create", model: [prodProductPriceInstance: prodProductPriceInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'prodProductPrice.label', default: 'ProdProductPrice'), prodProductPriceInstance.id])
        redirect(action: "show", id: prodProductPriceInstance.id)
    }

    def show() {
        def prodProductPriceInstance = ProdProductPrice.get(params.id)
        if (!prodProductPriceInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodProductPrice.label', default: 'ProdProductPrice'), params.id])
            redirect(action: "list")
            return
        }

        [prodProductPriceInstance: prodProductPriceInstance]
    }

    def edit() {
        def prodProductPriceInstance = ProdProductPrice.get(params.id)
        if (!prodProductPriceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodProductPrice.label', default: 'ProdProductPrice'), params.id])
            redirect(action: "list")
            return
        }

        [prodProductPriceInstance: prodProductPriceInstance]
    }

    def update() {
        def prodProductPriceInstance = ProdProductPrice.get(params.id)
        if (!prodProductPriceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodProductPrice.label', default: 'ProdProductPrice'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (prodProductPriceInstance.version > version) {
                prodProductPriceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'prodProductPrice.label', default: 'ProdProductPrice')] as Object[],
                          "Another user has updated this ProdProductPrice while you were editing")
                render(view: "edit", model: [prodProductPriceInstance: prodProductPriceInstance])
                return
            }
        }

        prodProductPriceInstance.properties = params

        if (!prodProductPriceInstance.save(flush: true)) {
            render(view: "edit", model: [prodProductPriceInstance: prodProductPriceInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'prodProductPrice.label', default: 'ProdProductPrice'), prodProductPriceInstance.id])
        redirect(action: "show", id: prodProductPriceInstance.id)
    }

    def delete() {
        def prodProductPriceInstance = ProdProductPrice.get(params.id)
        if (!prodProductPriceInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodProductPrice.label', default: 'ProdProductPrice'), params.id])
            redirect(action: "list")
            return
        }

        try {
            prodProductPriceInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'prodProductPrice.label', default: 'ProdProductPrice'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'prodProductPrice.label', default: 'ProdProductPrice'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}

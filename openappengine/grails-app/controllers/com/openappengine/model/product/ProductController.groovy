package com.openappengine.model.product

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class ProductController {
	
	def sequenceGeneratorService
	
	def orderService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [productInstanceList: Product.list(params), productInstanceTotal: Product.count()]
    }
	
	def filterProducts() {
		def criteria = Product.createCriteria()
		
		def products = criteria.list {
			if(params.productName) {
				like("pdProductName", "${params.productName}%")
			} else {
				like("pdProductName", "%%")
			}
		}
		
		List productsFilter = new ArrayList()
		
		products?.each {
			BigDecimal price  = it.getProductPrice(new Date())
			
			def min = params.priceMin.toBigDecimal()
			def max = params.priceMax.toBigDecimal()
			
			if(price >= min && price <= max) {
				productsFilter.add(it)
			}
		}
		
		def results = productsFilter?.collect {
				BigDecimal price  = it.getProductPrice(new Date())
				[
					"pdProductId" : it.pdProductId,
					"pdProductName" : it.pdProductName,
					"pdIntroductionDate" : it.pdIntroductionDate,
					"pdSalesDiscontinuationDate" : it.pdSalesDiscontinuationDate,
					"pdPrice" : price
				]
		}
		
		render results as JSON
	}
	
    def create() {
        [productInstance: new Product(params)]
    }
	
	def addPrice() {
		redirect(action: "show", id: params.id)
	}
	
	def terminateProduct() {
		 def productInstance = Product.get(params.id)
		 if (!productInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            return
         }
		 
		 def terminationDate = params.terminationDate
		 productInstance.update(flush:true)
		 
		 flash.message = message(code: 'default.product.terminated.message', 
			 	args: [message(code: 'product.label', default: 'Product'), productInstance.pdProductId])
		 redirect(action: "show", id: productInstance.pdProductId)
	}

    def save() {
        def productInstance = new Product(params)
		def endDate = Date.parse("yyyy-MM-dd", "9999-12-31")
		
		productInstance.pdCreatedDate = new Date()
		productInstance.pdSalesDiscontinuationDate= endDate
		productInstance.pdSupportDiscontinuationDate = endDate
		
		def prodPrice = new ProdProductPrice()
		prodPrice.ppFromDate = productInstance.pdIntroductionDate
		prodPrice.ppToDate = endDate
		prodPrice.ppPrice = params.initPrice.toBigDecimal()
		prodPrice.prodProduct = productInstance
		
		def prodProductPrices = new ArrayList<ProdProductPrice>()
		prodProductPrices.add(prodPrice)
		
		productInstance.prodProductPrices = prodProductPrices
		
        if (!productInstance.save(flush: true)) {
            render(view: "create", model: [productInstance: productInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'product.label', default: 'Product'), productInstance.pdProductId])
        redirect(action: "show", id: productInstance.pdProductId)
    }

    def show() {
        def productInstance = Product.get(params.id?.toInteger())
        if (!productInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
            return
        }
		render(view: "show", model: [productInstance: productInstance])
    }
	
	def viewDetailJSON() {
		def productInstance = Product.get(params.id?.toInteger())
		if (!productInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
			redirect(action: "list")
			return
		}
		
		BigDecimal price  = productInstance.getProductPrice(new Date())
		def jsonObj = [
			"pdProductId" : productInstance.pdProductId,
			"pdProductName" : productInstance.pdProductName,
			"pdIntroductionDate" : productInstance.pdIntroductionDate,
			"pdSalesDiscontinuationDate" : productInstance.pdSalesDiscontinuationDate,
			"pdPrice" : price
		]
		
		render jsonObj as JSON
	}
	
	def getProduct() {
		Integer productId = Integer.parseInt(params.id)
		def productInstance = Product.get(productId)
		render productInstance.pdProductName
	 }

    def edit() {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
            return
        }

        [productInstance: productInstance]
    }

    def update() {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (productInstance.version > version) {
                productInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'product.label', default: 'Product')] as Object[],
                          "Another user has updated this Product while you were editing")
                render(view: "edit", model: [productInstance: productInstance])
                return
            }
        }

        productInstance.properties = params

        if (!productInstance.save(flush: true)) {
            render(view: "edit", model: [productInstance: productInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'product.label', default: 'Product'), productInstance.pdProductId])
        redirect(action: "show", id: productInstance.pdProductId)
    }

    def delete() {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
            return
        }

        try {
            productInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def ajaxGetProductPrice() {
		def product = Product.get(params.id)
		
		BigDecimal price = new BigDecimal(0.0)
		BigDecimal taxPrice = new BigDecimal(0.0)
		def aspectDate = new Date()
		
		if(product) {
			price = product.getProductPrice(aspectDate)
			taxPrice = orderService.calculateTaxAmount(product, aspectDate)
		}
		
		def jsonObj = [
			"price" : price,
			"tax" : taxPrice
		]
		
		render jsonObj as JSON
	}
}

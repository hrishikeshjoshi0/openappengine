package com.openappengine.model.party

import grails.converters.JSON

import org.hibernate.criterion.MatchMode;
import org.springframework.dao.DataIntegrityViolationException

class PersonController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def sequenceGeneratorService
	
	def partyService
	
    def index() {
        redirect(action: "list", params: params)
    }
	
	def searchDialog() {
		
	}
	
	def searchDialogResults() {
		def criteria = Person.createCriteria()
		
		def persons = criteria.list {
			like("firstName", "${params.firstName}%")
			like("middleName", "${params.middleName}%")
			like("lastName", "${params.lastName}%")
			like("externalId", "${params.externalId}%")
		}
		
		if(persons?.size() == 0) {
			flash.message = message(code: 'default.records_not_found.message')
		}
		
		[personInstanceList: persons, personInstanceTotal: persons.size()]
	}

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		//max = 10
		//currentStep = 1
		//total
        [personInstanceList: Person.list(params), personInstanceTotal: Person.count()]
    }
	
	def filter() {
		def criteria = Person.createCriteria()
		
		def persons = criteria.list {
			like("firstName", "${params.firstName}%")
			like("middleName", "${params.middleName}%")
			like("lastName", "${params.lastName}%")
			like("externalId", "${params.externalId}%")
		}
		
		if(persons?.size() != 0) {
			flash.message = message(code: 'default.records_not_found.message')
		}
		
		[personInstanceList: persons, personInstanceTotal: persons.size()]
	}
	
	def listJSON = {
		def c = Person.criteria()
		def contacts = c.list {
			like("firstName", params.firstName,MatchMode.START)
		}
		
		def results = contacts?.collect {
			[
				person:[
				 "id" : it.partyId,	
				 "firstName" : it.firstName,
				 "lastName" : it.lastName,
				 "externalId" : it.externalId,
				 "status" : it.status
				]
			]
		}
		
		render results as JSON
	}

    def create() {
		String personId = sequenceGeneratorService.getNextSequenceNumber("Person")
		def p = new Person(params)
		p.externalId = personId
        [personInstance: p,addressInstance: new Address(params)]
    }
	
	def createAddress() {
		[addressInstance: new Address(params)]
		render(view: "create")
	}
	
	def addAddress() {
		def addressInstance = new Address(params)
	}

    def save() {
        def personInstance = new Person(params)
		personInstance.partyType = "PERSON"
		
		def addressInstance = new Address(params)
		personInstance.addAddress(addressInstance);
        		
		partyService.createPersonParty(personInstance)

		flash.message = message(code: 'default.created.message', args: [message(code: 'person.label', default: 'Person'), personInstance.partyId])
        redirect(action: "show", id: personInstance.partyId)
    }

    def show() {
		def personInstance = Person.get(params.id)
			
		if (!personInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])
			redirect(action: "list")
			return
		}
		[personInstance: personInstance]
    }

    def edit() {
        def personInstance = Person.get(params.id)
        if (!personInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])
            redirect(action: "list")
            return
        }

        [personInstance: personInstance]
    }

    def update() {
        def personInstance = Person.get(params.id)
        if (!personInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (personInstance.version > version) {
                personInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'person.label', default: 'Person')] as Object[],
                          "Another user has updated this Person while you were editing")
                render(view: "edit", model: [personInstance: personInstance])
                return
            }
        }

        personInstance.properties = params

        if (!personInstance.save(flush: true)) {
            render(view: "edit", model: [personInstance: personInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'person.label', default: 'Person'), personInstance.partyId])
        redirect(action: "show", id: personInstance.partyId)
    }

    def delete() {
        def personInstance = Person.get(params.id)
        if (!personInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])
            redirect(action: "list")
            return
        }

        try {
            personInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'person.label', default: 'Person'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'person.label', default: 'Person'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def listJSON() {
		def persons = Person.list (params)
		def totalRows = Person.count()

		def results = persons?.collect {
						cell: [
							it.externalId,
							it.firstName,
							it.lastName,
							it.description,
							it.status
						]
		}

		def jsonData = [results]
		render jsonData as JSON
	}
	
	def searchAJAX = {
		//Create XML response
		def persons = Person.findAllByFirstNameLike("${params.query}%")
		        
		render(contentType: "text/xml") {
			results() {
				persons.each { person ->
					result(){
						name(person.firstName + " " + person.lastName)
						//Optional id which will be available in onItemSelect
						id(person.externalId)	//TODO - Change to externalID.
					}
				}
			}
		}
	}

}

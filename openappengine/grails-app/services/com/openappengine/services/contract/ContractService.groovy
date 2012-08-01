package com.openappengine.services.contract

import java.util.Date

import org.springframework.transaction.annotation.Transactional

import com.openappengine.model.contract.Contract
import com.openappengine.model.contract.ContractLineItem
import com.openappengine.model.fm.OhOrderHeader;

class ContractService {

	@Transactional
    def createService(Contract contract) throws ContractCreationException {
		contract.active = true
		try {
			if(contract.lineItems != null) {
				for (ContractLineItem lineItem : contract.lineItems) {
					lineItem.initLineItem()
				}
			}
			contract.save(flush:true)
		} catch(Exception e) {
			throw new ContractCreationException("Exception encountered while creating Contract.")
		}
    }
	
	def Date getMostRecentOrdersEndDate(Contract contract) {
		def c = OhOrderHeader.createCriteria()
		def orders = c.list{
			eq("contractNumber",contract.contractNumber)
			order("orderDate", "desc")
		}
		
		if(!orders?.isEmpty()) {
			OhOrderHeader oh = orders.get(0)
			return oh.toDate
		}
		
		return null
	}
	
	@Transactional
	def terminateContractLineItem(ContractLineItem lineItem,Date terminateDate) {
		if(!lineItem) {
			throw new RuntimeException("Contract Line Item cannot be null")
		}
		
		def contract = lineItem.contract
		if(!contract) {
			throw new RuntimeException("No Contract found for Contract Line Item")
		}
		
		if(!lineItem.active) {
			log.warn("Contract already inactive.")
			return
		}
		
		def c = OhOrderHeader.createCriteria()
		def orders = c.list{
			eq("contractNumber",contract.contractNumber)
			order("orderDate", "desc")
		}
		
		if(!orders?.isEmpty()) {
			OhOrderHeader oh = orders.get(0)
			if(terminateDate.before(oh.toDate)) {
				log.warn("Order has been invoiced for the mentioned end date. Cannot terminate contract at this date.")
				terminateDate = oh.toDate
			}
		}
		
		lineItem.toDate = terminateDate
		
		if(terminateDate.before(new Date()) || terminateDate.equals(new Date())) {
			lineItem.active = false
		}
		
		lineItem.save(flush:true)
	}
	
	@Transactional
	def terminateContract(Contract contract, Date terminateDate) {
		if(!contract) {
			throw new RuntimeException("Contract cannot be null")	
		}
		
		if(!contract.active) {
			log.warn("Contract already inactive.")
			return
		}
		
		def c = OhOrderHeader.createCriteria()
		def orders = c.list{
			eq("contractNumber",contract.contractNumber)
			order("orderDate", "desc")
		}
		
		if(!orders?.isEmpty()) {
			OhOrderHeader oh = orders.get(0)
			if(terminateDate.before(oh.toDate)) {
				log.warn("Order has been invoiced for the mentioned end date. Cannot terminate contract at this date.")
				terminateDate = oh.toDate
			}
		}
		
		contract.toDate = terminateDate
		
		if(terminateDate.before(new Date()) || terminateDate.equals(new Date())) {
			contract.active = false
		}
		
		contract.save(flush:true)
	}
}

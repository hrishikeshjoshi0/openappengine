package com.openappengine.service.fm

import com.openappengine.model.billing.BillingCycle
import com.openappengine.model.contract.Contract
import com.openappengine.model.fm.FmPayment
import com.openappengine.model.fm.OhOrderHeader

class PaymentService {
	
	def sequenceGeneratorService
	
	def applyPayment(String billingCycleId,String partyExternalId,BigDecimal amount) {
		//Get the billing cycle
		def bc = BillingCycle.findByName(billingCycleId)
		
		if(bc) {
			def order = OhOrderHeader.findByBillingCycleAndBillingAccountId(bc,partyExternalId)
			
			//Update payment status
			def payment = FmPayment.findByBillingCycleIdAndBillingAccountId(billingCycleId,partyExternalId)
			if(payment) {
				if(amount >= order.grandTotal) {
					payment.status = 'PAYMENT_COMPLETE'
				} else {
					payment.status = 'PAYMENT_PARTIAL'
				}
				payment.amount = amount
				payment.save(flush:true)
			}
			
			//Update ar_amount in Contract
			def contract = Contract.findByPartyId(partyExternalId)
			contract.arAmount = contract.arAmount - amount
			contract.save()
			
			//Update Order status.
			def c = FmPayment.createCriteria()
			def sum = c.get {
				projections {
					sum("amount")
				}
				like("billingCycleId", billingCycleId)
				'in'("status", 'PAYMENT_COMPLETE','PAYMENT_PARTIAL')
			}
			
			if(order) {
				if(sum) {
					if(sum >= order.grandTotal) {
						order.status = 'ORDER_PAYMENT_COMPLETE'
					} else {
						order.status = 'ORDER_PAYMENT_PENDING'
					}
				} else {
				order.status = 'ORDER_PAYMENT_PENDING'
				}
				order.save()
			} else {
				//TODO
			}
		}
	}
	
    def createPendingPaymentForOrder(String contractExternalId, String orderNumber, String partyExternalId, BigDecimal amount) {
		Contract contract = Contract.findByContractNumber(contractExternalId)
		if(contract == null) {	
			throw new RuntimeException("Cannot create Pending Payment.")
		}
		
		FmPayment payment = new FmPayment()
		payment.amount = amount
		payment.billingAccountId = partyExternalId
		payment.contractExternalId = contractExternalId
		payment.orderNumber = orderNumber
		payment.partyExternalIdFrom = partyExternalId
		payment.status = FmPayment.PENDING
		payment.paymentNumber = sequenceGeneratorService.getNextSequenceNumber("Payment")
		
		payment.save()
    }
	
	def completePayment(String contractExternalId, String orderNumber, String partyExternalId, BigDecimal amount) {
		FmPayment p = FmPayment.findByPaymentNumber(paymentNumber)
		if(p == null) {
			throw new RuntimeException("No Pending Payment found.")
		}
		
		FmPayment payment = new FmPayment()
		payment.amount = amount
		payment.billingAccountId = partyExternalId
		payment.contractExternalId = contractExternalId
		payment.orderNumber = orderNumber
		payment.partyExternalIdFrom = partyExternalId
		payment.status = FmPayment.COMPLETE
		payment.paymentNumber = sequenceGeneratorService.getNextSequenceNumber("Payment")
		
		payment.save()
	}
}

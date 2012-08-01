package com.openappengine.service.fm

import com.openappengine.model.contract.Contract
import com.openappengine.model.fm.FmPayment

class PaymentService {
	
	def sequenceGeneratorService
	
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

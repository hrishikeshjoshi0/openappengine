package com.openappengine.services.order



import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.openappengine.model.billing.BillingCycle;
import com.openappengine.model.contract.Contract
import com.openappengine.model.contract.ContractLineItem;
import com.openappengine.model.fm.OhOrderHeader
import com.openappengine.model.fm.OiOrderItem
import com.openappengine.model.fm.PartyBillingAccount
import com.openappengine.model.fm.tax.FmTaxRate;
import com.openappengine.model.fm.tax.FmTaxType;
import com.openappengine.model.product.Product;
import com.openappengine.util.DateUtils;

class OrderService {
	
	def sequenceGeneratorService
	
	def paymentService
	
	@Transactional
	def createAllOrdersForBillingCycle(BillingCycle bc) {
		def c = Contract.createCriteria()
		def results = c.list {
			eq("active", Boolean.TRUE)
		}
		
		if(results != null && !results.isEmpty()) {
			for (Contract contract : results) {
				createOrderFromContract(contract.contractNumber, bc);
			}
		}
	}

    def createOrderFromContract(String contractNumber,BillingCycle bc) {
		if(contractNumber == null) {
			throw new IllegalArgumentException("Contract Number cannot be null.");
		}
		
		Contract contractInstance = Contract.findByContractNumber(contractNumber)
		if(contractInstance == null) {
			throw new IllegalArgumentException("No Instance of Contract found.");
		}
		
		//TODO - Refactor
		def c = OhOrderHeader.createCriteria()
		def results = c.list {
			like("contractNumber",contractNumber)
			order("toDate","desc")
		}
		
		if(results != null && !results.isEmpty()) {
			OhOrderHeader orderHeader = results.get(0)
			if(DateUtils.isDateBetweenTwoDatesInclusive(orderHeader.fromDate, orderHeader.toDate, bc.fromDate) 
				|| DateUtils.isDateBetweenTwoDatesInclusive(orderHeader.fromDate, orderHeader.toDate, bc.toDate)) {
				log.info "Order already exists."
				return
			}
		}
		
		OhOrderHeader order = new OhOrderHeader()
		order.billingAccountId =  contractInstance.partyId
		order.fromDate =  bc.fromDate
		order.toDate =  bc.toDate
		order.contractNumber = contractNumber
		order.entryDate = new Date()
		order.orderDate = new Date()
		order.externalId = ""
		order.orderType = "SO"
		order.status = "INVOICED_PENDING_PAYMENT"
		order.partyNumber = contractInstance.partyId
		order.prevBalance = contractInstance.arAmount
		
		String orderNumber = sequenceGeneratorService.getNextSequenceNumber("Order")
		order.externalId = orderNumber
		
		def date = new Date()
		def grandTotal = new BigDecimal(0.0)
		int i = 0
		
		List<ContractLineItem> lineItems = contractInstance.lineItems
		if(lineItems != null && !lineItems.isEmpty()) {
			for (ContractLineItem lineItem : lineItems) {
				if(lineItem.active) {
					OiOrderItem item = new OiOrderItem()
					item.orderHeader = order
					item.orderItemSequenceId = i
					item.product = lineItem.product
					item.quantity = lineItem.quantity
					item.priceModified = false
					
					item.unitPrice = lineItem.product.getProductPrice(bc.fromDate)
					item.taxPrice = calculateTaxAmount(lineItem.product,bc.fromDate)
					item.lineTotalPrice = item.unitPrice + item.taxPrice
					
					grandTotal += item.lineTotalPrice
					order.addOrderItem(item)
					
					i++
				}
			}
		}
		
		
		// Add STB Rent Product if flag isOnRent = 1
		/*if(contractInstance.isOnRent==true){
			OiOrderItem rentItem = new OiOrderItem()
			rentItem.orderHeader = order
			rentItem.orderItemSequenceId = i
			Product rentProduct = Product.get(3)
			rentItem.product = rentProduct
			rentItem.quantity = 1
			rentItem.priceModified = false
			
			rentItem.unitPrice = rentProduct.getProductPrice(bc.fromDate)*4
			rentItem.taxPrice = 0
			rentItem.lineTotalPrice = rentItem.unitPrice + rentItem.taxPrice
			
			grandTotal += rentItem.lineTotalPrice
			order.addOrderItem(rentItem)
			}
		*/
		
		//Contract AR Amount
		contractInstance.arAmount = contractInstance.arAmount + grandTotal
		
		order.grandTotal = grandTotal+order.prevBalance
		
		
		
		//BC
		order.billingCycle = bc
		order.save(flush:true)
		
		def partyBillingAcct = new PartyBillingAccount()
		partyBillingAcct.aspectDate = bc.fromDate
		partyBillingAcct.balanceAmount = order.grandTotal
		partyBillingAcct.billingCycleNumber = bc.name
		partyBillingAcct.partyExternalId = order.billingAccountId
		partyBillingAcct.save()
		
		//Create a Payment Pending for this Order.
		paymentService.createPendingPaymentForOrder(contractInstance.contractNumber, orderNumber, contractInstance.partyId, grandTotal)
    }
	
	//TODO
	def BigDecimal calculateTaxAmount(Product product,Date date) {
		BigDecimal total = new BigDecimal(0.0);
		
		if (product.productTaxes != null && !product.productTaxes.isEmpty()) {
			for (FmTaxType prodTax : product.productTaxes) {
				List<FmTaxRate> taxRates = prodTax.getTaxRates();
				if (taxRates != null && !taxRates.isEmpty()) {
					for (FmTaxRate taxRate : taxRates) {
						if(taxRate.fixedPrice) {
							if(DateUtils.isDateBetweenTwoDatesInclusive(taxRate.getFromDate(), taxRate.getToDate(), date)) {
								total += taxRate.getFixedTaxAmount();
							}
						}
						//TODO
					}
				}
			}
		}
		
		return total;
	}
}

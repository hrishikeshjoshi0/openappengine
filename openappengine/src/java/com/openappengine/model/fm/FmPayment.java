/**
 * 
 */
package com.openappengine.model.fm;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * @author hrishikesh.joshi
 *
 */
@Entity
@Table(name="FM_PAYMENT")
public class FmPayment implements Serializable {

	private static final long serialVersionUID = 1L;
	
	public static final String PENDING = "PENDING";
	public static final String INVALID = "INVALID";
	public static final String FAILED = "FAILED";
	public static final String COMPLETE = "COMPLETE";
	public static final String CANCELLED = "CANCELLED";
	
	@Id
	@GeneratedValue(strategy=GenerationType.TABLE, generator="seqGenerator")  
	@TableGenerator(name="seqGenerator", table="ad_table_sequences",pkColumnName="TS_SEQUENCE_NAME",valueColumnName="TS_SEQUENCE_VALUE",
	                allocationSize=1 // flush every 1 insert  
	)
	@Column(name="PT_PAYMENT_ID", unique=true, nullable=false)
	private int paymentId;
	
	@Column(name="PT_PAYMENT_NUMBER",nullable=false)
	private String paymentNumber;
	
	//Payment against Party External Id. (Mandatory)
	@Column(name="PT_PARTY_EXTERNAL_ID_FROM",nullable=false)
	private String partyExternalIdFrom;
	
	//Payment against Party External Id. (Mandatory)
	@Column(name="PT_PARTY_EXTERNAL_ID_TO")
	private String partyExternalIdTo;
	
	//Payment against Contract Number
	@Column(name="PT_CONTRACT_EXTERNAL_ID")
	private String contractExternalId;
	
	@Column(name="PT_PAYMENT_TYPE")
	private String paymentType;
	
	@Column(name="PT_PAYMENT_METHOD")
	private String paymentMethod;
	
	@Column(name="PT_AMOUNT",nullable=false)
	private BigDecimal amount;
	
	//Payment against Order Number
	@Column(name="PT_ORDER_NUMBER",nullable=false)
	private String orderNumber;
	
	@Column(name="PT_EFFECTIVE_DATE")
	@Temporal(TemporalType.TIMESTAMP)
	private Date effectiveDate;
	
	@Column(name="PT_STATUS_ID")
	private String status;
	
	@Column(name="PT_CURRENCY_UOM")
	private String currencyUom;
	
	@Column(name="PT_BILLING_ACCOUNT_ID")	
	private String billingAccountId;
	
	@Column(name="PT_TRANSACTION_ID")
	private String transactionId;

	public int getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}

	public String getPaymentNumber() {
		return paymentNumber;
	}

	public void setPaymentNumber(String paymentNumber) {
		this.paymentNumber = paymentNumber;
	}

	public String getPartyExternalIdFrom() {
		return partyExternalIdFrom;
	}

	public void setPartyExternalIdFrom(String partyExternalIdFrom) {
		this.partyExternalIdFrom = partyExternalIdFrom;
	}

	public String getPartyExternalIdTo() {
		return partyExternalIdTo;
	}

	public void setPartyExternalIdTo(String partyExternalIdTo) {
		this.partyExternalIdTo = partyExternalIdTo;
	}

	public String getContractExternalId() {
		return contractExternalId;
	}

	public void setContractExternalId(String contractExternalId) {
		this.contractExternalId = contractExternalId;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public Date getEffectiveDate() {
		return effectiveDate;
	}

	public void setEffectiveDate(Date effectiveDate) {
		this.effectiveDate = effectiveDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCurrencyUom() {
		return currencyUom;
	}

	public void setCurrencyUom(String currencyUom) {
		this.currencyUom = currencyUom;
	}

	public String getBillingAccountId() {
		return billingAccountId;
	}

	public void setBillingAccountId(String billingAccountId) {
		this.billingAccountId = billingAccountId;
	}

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}
}

/**
 * 
 */
package com.openappengine.model.fm;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * @author hrishikesh.joshi
 *
 */
@Entity
@Table(name="FM_ORDER_HEADER")
public class OhOrderHeader implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.TABLE, generator="seqGenerator")  
	@TableGenerator(name="seqGenerator", table="ad_table_sequences",pkColumnName="TS_SEQUENCE_NAME",valueColumnName="TS_SEQUENCE_VALUE",
	                allocationSize=1 // flush every 1 insert  
	)
	@Column(name="OH_ORDER_ID", unique=true, nullable=false)
	private int orderId;
	
	@Column(name="OH_ORDER_TYPE_ID")
	private String orderType;
	
	@Column(name="OH_ORDER_NAME")
	private String orderName;
	
	@Column(name="OH_CONTRACT_NUMBER",nullable=false)
	private String contractNumber;
	
	@Column(name="OH_PARTY_NUMBER",nullable=false)
	private String partyNumber;
	
	@Column(name="OH_EXTERNAL_ID")
	private String externalId;
	
	@Column(name="OH_ORDER_DATE")
	private Date orderDate;
	
	@Column(name="OH_PRIORITY")
	private char priority;
	
	@Column(name="OH_ENTRY_DATE")
	@Temporal(TemporalType.DATE)
	private Date entryDate;
	
	@Column(name="OH_STATUS_ID")
	private String status;
	
	@Column(name="OH_CURRENCY_UOM")
	private String currencyUom;
	
	@Column(name="OH_BILLING_ACCOUNT_ID")	
	private String billingAccountId;
	
	@Column(name="OH_PRODUCT_STORE_ID")
	private String productStoreId;
	
	@Column(name="OH_TRANSACTION_ID")
	private String transactionId;
	
	@Column(name="OH_GRAND_TOTAL")
	private BigDecimal grandTotal = new BigDecimal("0.0");
	
	@Column(name="OH_FROM_DATE")
	@Temporal(TemporalType.DATE)
	private Date fromDate;
	
	@Column(name="OH_TO_DATE")
	@Temporal(TemporalType.DATE)
	private Date toDate;
	
	@OneToMany(mappedBy="orderHeader",cascade=CascadeType.ALL)
	private List<OiOrderItem> orderItems = new ArrayList<OiOrderItem>();

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getExternalId() {
		return externalId;
	}

	public void setExternalId(String externalId) {
		this.externalId = externalId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public char getPriority() {
		return priority;
	}

	public void setPriority(char priority) {
		this.priority = priority;
	}

	public Date getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBillingAccountId() {
		return billingAccountId;
	}

	public void setBillingAccountId(String billingAccountId) {
		this.billingAccountId = billingAccountId;
	}

	public String getProductStoreId() {
		return productStoreId;
	}

	public void setProductStoreId(String productStoreId) {
		this.productStoreId = productStoreId;
	}

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

	public BigDecimal getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(BigDecimal grandTotal) {
		this.grandTotal = grandTotal;
	}

	public String getCurrencyUom() {
		return currencyUom;
	}

	public void setCurrencyUom(String currencyUom) {
		this.currencyUom = currencyUom;
	}

	public List<OiOrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<OiOrderItem> orderItems) {
		this.orderItems = orderItems;
	}
	
	public void addOrderItem(OiOrderItem item) {
		orderItems.add(item);
	}

	public String getContractNumber() {
		return contractNumber;
	}

	public void setContractNumber(String contractNumber) {
		this.contractNumber = contractNumber;
	}

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	public Date getToDate() {
		return toDate;
	}

	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}

	public String getPartyNumber() {
		return partyNumber;
	}

	public void setPartyNumber(String partyNumber) {
		this.partyNumber = partyNumber;
	}

	public BigDecimal getOrderItemTotalUnitPrice() {
		BigDecimal totalUnitPrice = new BigDecimal("0.0");
		if(orderItems != null && !orderItems.isEmpty()) {
			for (OiOrderItem orderItem : orderItems) {
				totalUnitPrice = totalUnitPrice.add(orderItem.getUnitPrice()!=null?orderItem.getUnitPrice():new BigDecimal("0.0"));
			}
		}
		return totalUnitPrice;
	}
	
	public BigDecimal getOrderItemTotalTaxPrice() {
		BigDecimal totalTaxPrice = new BigDecimal("0.0");
		if(orderItems != null && !orderItems.isEmpty()) {
			for (OiOrderItem orderItem : orderItems) {
				totalTaxPrice = totalTaxPrice.add(orderItem.getTaxPrice() !=null?orderItem.getTaxPrice():new BigDecimal("0.0"));
			}
		}
		return totalTaxPrice;
	}
}

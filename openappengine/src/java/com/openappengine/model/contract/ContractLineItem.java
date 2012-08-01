/**
 * 
 */
package com.openappengine.model.contract;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.openappengine.model.product.Product;

/**
 * @author hrishikesh.joshi
 *
 */
@Entity
@Table(name="cn_contract_line_item")
public class ContractLineItem implements Serializable {

	private static final long serialVersionUID = 1L;
	
	public static final String CONTRACT_LINE_ITEM_STATUS_ACTIVE = "ACTIVE";
	
	public static final String CONTRACT_LINE_ITEM_STATUS_SUSPENDED = "SUSPENDED";
	
	@Id
	@Column(name = "CI_LINE_ITEM_ID", unique = true, nullable = false)
	@GeneratedValue(strategy=GenerationType.TABLE, generator="seqGenerator")  
	@TableGenerator(name="seqGenerator", table="ad_table_sequences",pkColumnName="TS_SEQUENCE_NAME",valueColumnName="TS_SEQUENCE_VALUE",
	                allocationSize=1 // flush every 1 insert  
	)
	private int lineItemId;
	
	@ManyToOne
	@JoinColumn(name="CI_PRODUCT_ID", nullable=false)
	private Product product;
	
	@Column(name = "CI_QUANTITY")
	private BigDecimal quantity;
	
	@Column(name = "CI_SELECTED_AMOUNT")
	private BigDecimal selectedAmouunt;
	
	@Column(name = "CI_STATUS_ID")
	private String status;
	
	@ManyToOne
	@JoinColumn(name = "CN_CONTRACT_ID", nullable = false)
	private Contract contract;
	
	@Temporal(TemporalType.DATE)
	@Column(name="CI_FROM_DATE",nullable=false)
	private Date fromDate;
	
	@Temporal(TemporalType.DATE)
	@Column(name="CI_TO_DATE")
	private Date toDate;
	
	@Column(name="CI_IS_ACTIVE")
	private Boolean active = Boolean.TRUE; 

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public BigDecimal getQuantity() {
		return quantity;
	}

	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getSelectedAmouunt() {
		return selectedAmouunt;
	}

	public void setSelectedAmouunt(BigDecimal selectedAmouunt) {
		this.selectedAmouunt = selectedAmouunt;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Contract getContract() {
		return contract;
	}

	public void setContract(Contract contract) {
		this.contract = contract;
	}

	public int getLineItemId() {
		return lineItemId;
	}

	public void setLineItemId(int lineItemId) {
		this.lineItemId = lineItemId;
	}
	
	public void initLineItem() {
		this.setStatus(ContractLineItem.CONTRACT_LINE_ITEM_STATUS_ACTIVE);
	}
	
	public void suspendLineItem() {
		this.setStatus(ContractLineItem.CONTRACT_LINE_ITEM_STATUS_SUSPENDED);
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

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}
}

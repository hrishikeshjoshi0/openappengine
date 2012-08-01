/**
 * 
 */
package com.openappengine.model.contract;

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
 * @author hrishi
 *
 */
@Entity
@Table(name="cn_contract_header")
public class Contract {

	@Id
	@GeneratedValue(strategy=GenerationType.TABLE, generator="seqGenerator")  
	@TableGenerator(name="seqGenerator", table="ad_table_sequences",pkColumnName="TS_SEQUENCE_NAME",valueColumnName="TS_SEQUENCE_VALUE",
	                allocationSize=1 // flush every 1 insert  
	)
	@Column(name="CH_CONTRACT_ID",unique=true, nullable=false)
	private int contractId;
	
	@Column(name="CH_CONTRACT_NUMBER",unique=true, nullable=false)
	private String contractNumber;
	
	@Column(name="CH_PARTY_EXTERNAL_ID",nullable=false)
	private String partyId;
	
	@OneToMany(mappedBy="contract",cascade=CascadeType.ALL)
	private List<ContractLineItem> lineItems = new ArrayList<ContractLineItem>();
	
	@Temporal(TemporalType.DATE)
	@Column(name="CH_FROM_DATE",nullable=false)
	private Date fromDate;
	
	@Temporal(TemporalType.DATE)
	@Column(name="CH_TO_DATE")
	private Date toDate;
	
	@Column(name="CH_IS_ACTIVE")
	private Boolean active = Boolean.TRUE;
	
	@Column(name="CH_ORDER_RECURRENCE", nullable=false)
	private String orderRecurrence;
	
	@Column(name="CH_AR_AMOUNT")
	private BigDecimal arAmount = new BigDecimal(0.0); 

	public int getContractId() {
		return contractId;
	}

	public void setContractId(int contractId) {
		this.contractId = contractId;
	}

	public List<ContractLineItem> getLineItems() {
		return lineItems;
	}

	public void setLineItems(List<ContractLineItem> lineItems) {
		this.lineItems = lineItems;
	}
	
	public void addNewLineItem(ContractLineItem lineItem) {
		if(lineItem == null) {
			return;
		}
		lineItem.initLineItem();
		this.lineItems.add(lineItem);
	}
	
	public void suspendLineItem(ContractLineItem lineItem) {
		if(lineItem == null) {
			return;
		}
		lineItem.suspendLineItem();
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

	public String getOrderRecurrence() {
		return orderRecurrence;
	}

	public void setOrderRecurrence(String orderRecurrence) {
		this.orderRecurrence = orderRecurrence;
	}

	public String getContractNumber() {
		return contractNumber;
	}

	public void setContractNumber(String contractNumber) {
		this.contractNumber = contractNumber;
	}

	public String getPartyId() {
		return partyId;
	}

	public void setPartyId(String partyId) {
		this.partyId = partyId;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public BigDecimal getArAmount() {
		return arAmount;
	}

	public void setArAmount(BigDecimal arAmount) {
		this.arAmount = arAmount;
	}
	
}

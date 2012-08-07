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
@Table(name="FM_PARTY_BILLING_ACCOUNT")
public class PartyBillingAccount implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.TABLE, generator="seqGenerator")  
	@TableGenerator(name="seqGenerator", table="ad_table_sequences",pkColumnName="TS_SEQUENCE_NAME",valueColumnName="TS_SEQUENCE_VALUE",
	                allocationSize=1 // flush every 1 insert  
	)
	@Column(name="PB_PARTY_BILLING_ACCOUNT_ID", unique=true, nullable=false)
	private int partyBillingAccountId;
	
	@Column(name="PB_PARTY_EXTERNAL_ID")
	private String partyExternalId;
	
	@Column(name="PB_BALANCE_AMOUNT",nullable=false)
	private BigDecimal balanceAmount;
	
	@Column(name="PB_ASPECT_DATE")
	@Temporal(TemporalType.TIMESTAMP)
	private Date aspectDate;
	
	@Column(name="PB_BILLING_CYCLE_ID")
	private String billingCycleNumber;

	public int getPartyBillingAccountId() {
		return partyBillingAccountId;
	}

	public void setPartyBillingAccountId(int partyBillingAccountId) {
		this.partyBillingAccountId = partyBillingAccountId;
	}

	public String getPartyExternalId() {
		return partyExternalId;
	}

	public void setPartyExternalId(String partyExternalId) {
		this.partyExternalId = partyExternalId;
	}

	public Date getAspectDate() {
		return aspectDate;
	}

	public void setAspectDate(Date aspectDate) {
		this.aspectDate = aspectDate;
	}

	public String getBillingCycleNumber() {
		return billingCycleNumber;
	}

	public void setBillingCycleNumber(String billingCycleNumber) {
		this.billingCycleNumber = billingCycleNumber;
	}

	public BigDecimal getBalanceAmount() {
		return balanceAmount;
	}

	public void setBalanceAmount(BigDecimal balanceAmount) {
		this.balanceAmount = balanceAmount;
	}
}

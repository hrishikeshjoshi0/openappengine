/**
 * 
 */
package com.openappengine.model.batch;

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

/**
 * @author hrishikesh.joshi
 *
 */
@Entity
@Table(name="BT_PAYMENT_UPLOAD_ITEM")
public class BulkPaymentUploadItem implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.TABLE, generator="seqGenerator")  
	@TableGenerator(name="seqGenerator", table="ad_table_sequences",pkColumnName="TS_SEQUENCE_NAME",valueColumnName="TS_SEQUENCE_VALUE",
	                allocationSize=1 // flush every 1 insert  
	)
	@Column(name="BT_PAYMENT_UPLOAD_ITEM_ID", unique=true, nullable=false)
	private int bulkPaymentUploadItemId;
	
	@Column(name="BT_UPLOAD_ITEM_TIMESTAMP")
	@Temporal(TemporalType.TIMESTAMP)
	private Date uploadTimestamp;
	
	@Column(name="BT_STATUS_ID")
	private String status;
	
	@Column(name="BT_AMOUNT")
	private BigDecimal amount;

	@Column(name="BT_BILLING_CYCLE")
	private String billingCycleId;
	
	@Column(name="BT_PARTY_EXTERNAL_ID")
	private String partyExternalId;
	
	@ManyToOne
	@JoinColumn(name = "BT_BULK_PAYMENT_UPLOAD_ID")
	private BulkPaymentUpload bulkPaymentUpload;

	public int getBulkPaymentUploadItemId() {
		return bulkPaymentUploadItemId;
	}

	public void setBulkPaymentUploadItemId(int bulkPaymentUploadItemId) {
		this.bulkPaymentUploadItemId = bulkPaymentUploadItemId;
	}

	public Date getUploadTimestamp() {
		return uploadTimestamp;
	}

	public void setUploadTimestamp(Date uploadTimestamp) {
		this.uploadTimestamp = uploadTimestamp;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public String getBillingCycleId() {
		return billingCycleId;
	}

	public void setBillingCycleId(String billingCycleId) {
		this.billingCycleId = billingCycleId;
	}

	public BulkPaymentUpload getBulkPaymentUpload() {
		return bulkPaymentUpload;
	}

	public void setBulkPaymentUpload(BulkPaymentUpload bulkPaymentUpload) {
		this.bulkPaymentUpload = bulkPaymentUpload;
	}

	public String getPartyExternalId() {
		return partyExternalId;
	}

	public void setPartyExternalId(String partyExternalId) {
		this.partyExternalId = partyExternalId;
	}
	
}

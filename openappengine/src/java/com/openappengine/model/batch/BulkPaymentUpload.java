/**
 * 
 */
package com.openappengine.model.batch;

import java.io.Serializable;
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
@Table(name="BT_PAYMENT_UPLOAD")
public class BulkPaymentUpload implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.TABLE, generator="seqGenerator")  
	@TableGenerator(name="seqGenerator", table="ad_table_sequences",pkColumnName="TS_SEQUENCE_NAME",valueColumnName="TS_SEQUENCE_VALUE",
	                allocationSize=1 // flush every 1 insert  
	)
	@Column(name="BT_PAYMENT_UPLOAD_ID", unique=true, nullable=false)
	private int bulkPaymentUploadId;
	
	@Column(name="BC_UPLOAD_TIMESTAMP")
	@Temporal(TemporalType.TIMESTAMP)
	private Date uploadTimestamp;
	
	@Column(name="BT_STATUS_ID")
	private String status;
	
	@OneToMany(mappedBy="bulkPaymentUpload",cascade=CascadeType.ALL)
	private List<BulkPaymentUploadItem> uploadItems = new ArrayList<BulkPaymentUploadItem>();

	public int getBulkPaymentUploadId() {
		return bulkPaymentUploadId;
	}

	public void setBulkPaymentUploadId(int bulkPaymentUploadId) {
		this.bulkPaymentUploadId = bulkPaymentUploadId;
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

	public List<BulkPaymentUploadItem> getUploadItems() {
		return uploadItems;
	}

	public void setUploadItems(List<BulkPaymentUploadItem> uploadItems) {
		this.uploadItems = uploadItems;
	}
	
}

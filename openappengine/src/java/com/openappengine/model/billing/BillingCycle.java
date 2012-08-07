/**
 * 
 */
package com.openappengine.model.billing;

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

import com.openappengine.model.fm.OhOrderHeader;

/**
 * @author hrishikesh.joshi
 *
 */
@Entity
@Table(name="BL_BILLING_CYCLE")
public class BillingCycle implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.TABLE, generator="seqGenerator")  
	@TableGenerator(name="seqGenerator", table="ad_table_sequences",pkColumnName="TS_SEQUENCE_NAME",valueColumnName="TS_SEQUENCE_VALUE",
	                allocationSize=1 // flush every 1 insert  
	)
	@Column(name="BC_BILLING_CYCLE_ID", unique=true, nullable=false)
	private int billingCycleId;
	
	@Column(name="BC_FROM_DATE")
	@Temporal(TemporalType.DATE)
	private Date fromDate;
	
	@Column(name="BC_TO_DATE")
	@Temporal(TemporalType.DATE)
	private Date toDate;
	
	@Column(name="BC_NAME")
	private String name;
	
	@Column(name="BC_STATUS_ID")
	private String status;
	
	@OneToMany(mappedBy="billingCycle",cascade=CascadeType.ALL)
	private List<OhOrderHeader> orders = new ArrayList<OhOrderHeader>();

	public int getBillingCycleId() {
		return billingCycleId;
	}

	public void setBillingCycleId(int billingCycleId) {
		this.billingCycleId = billingCycleId;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<OhOrderHeader> getOrders() {
		return orders;
	}

	public void setOrders(List<OhOrderHeader> orders) {
		this.orders = orders;
	}
}

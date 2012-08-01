/**
 * 
 */
package com.openappengine.model.fm.tax;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

/**
 * @author hrishi
 *
 */
@Entity
@Table(name="FM_TAX_TYPE")
public class FmTaxType implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "TT_TAX_TYPE_ID", unique = true, nullable = false)
	@GeneratedValue(strategy=GenerationType.TABLE, generator="seqGenerator")  
	@TableGenerator(name="seqGenerator", table="ad_table_sequences",pkColumnName="TS_SEQUENCE_NAME",valueColumnName="TS_SEQUENCE_VALUE",
	                allocationSize=1 // flush every 1 insert  
	)
	private int taxTypeId;
	
	@Lob()
	@Column(name = "TT_DESCRIPTION", length = 255)
	private String taxDescription;
	
	@OneToMany(mappedBy="taxType",cascade=CascadeType.ALL)
	private List<FmTaxRate> taxRates = new ArrayList<FmTaxRate>();
	
	public int getTaxTypeId() {
		return taxTypeId;
	}

	public void setTaxTypeId(int taxTypeId) {
		this.taxTypeId = taxTypeId;
	}

	public String getTaxDescription() {
		return taxDescription;
	}

	public void setTaxDescription(String taxDescription) {
		this.taxDescription = taxDescription;
	}

	public List<FmTaxRate> getTaxRates() {
		return taxRates;
	}

	public void setTaxRates(List<FmTaxRate> taxRates) {
		this.taxRates = taxRates;
	}
}

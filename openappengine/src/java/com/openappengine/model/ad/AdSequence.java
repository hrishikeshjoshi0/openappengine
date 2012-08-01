/**
 * 
 */
package com.openappengine.model.ad;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author hrishikesh.joshi
 *
 */
@Entity
@Table(name="AD_SEQUENCE")
public class AdSequence implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="AD_SEQUENCE_NAME", unique=true, nullable=false)
	private String sequenceName;
	
	@Column(name="AD_SEQUENCE_PREFIX",nullable=true)
	private String prefix;
	
	@Column(name="AD_SEQUENCE_VALUE",nullable=false)
	private Integer sequenceValue;

	public String getSequenceName() {
		return sequenceName;
	}

	public void setSequenceName(String sequenceName) {
		this.sequenceName = sequenceName;
	}

	public Integer getSequenceValue() {
		return sequenceValue;
	}

	public void setSequenceValue(Integer sequenceValue) {
		this.sequenceValue = sequenceValue;
	}

	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

}

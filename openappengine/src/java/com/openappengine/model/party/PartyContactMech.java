package com.openappengine.model.party;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

@Entity
@Table(name="PM_PARTY_CONTACT_MECH")
public class PartyContactMech implements Serializable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.TABLE, generator="partyContactMechGenerator")  
	@TableGenerator(name="partyContactMechGenerator", table="ad_table_sequences",pkColumnName="TS_SEQUENCE_NAME",valueColumnName="TS_SEQUENCE_VALUE",
	                allocationSize=1 // flush every 1 insert  
	)
	@Column(name="PM_CONTACT_MECH_ID")
	private int partyContactMechId;
	
	@Column(name="PM_CONTACT_MECH_PURPOSE", nullable=false, length=50)
	private String contactMechPurpose;

	@Column(name="PM_CONTACT_MECH_TYPE", nullable=false, length=50)
	private String contactMechType;

	@Column(name="PM_INFO_STRING", nullable=false, length=100)
	private String infoString;
	
	@ManyToOne
	@JoinColumn(name="PM_PARTY_ID",insertable=false,updatable=false)
	private Party party;

	public PartyContactMech(String contactMechPurpose, String contactMechType,
			String infoString) {
		super();
		this.contactMechPurpose = contactMechPurpose;
		this.contactMechType = contactMechType;
		this.infoString = infoString;
	}
	
	public PartyContactMech() {
    }

	public String getContactMechPurpose() {
		return contactMechPurpose;
	}

	public void setContactMechPurpose(String contactMechPurpose) {
		this.contactMechPurpose = contactMechPurpose;
	}

	public String getContactMechType() {
		return contactMechType;
	}

	public void setContactMechType(String contactMechType) {
		this.contactMechType = contactMechType;
	}

	public String getInfoString() {
		return infoString;
	}

	public void setInfoString(String infoString) {
		this.infoString = infoString;
	}

	public boolean sameValueAs(PartyContactMech other) {
		return this.equals(other);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime
				* result
				+ ((contactMechPurpose == null) ? 0 : contactMechPurpose
						.hashCode());
		result = prime * result
				+ ((contactMechType == null) ? 0 : contactMechType.hashCode());
		result = prime * result
				+ ((infoString == null) ? 0 : infoString.hashCode());
		result = prime * result
				+ ((getParty() == null) ? 0 : getParty().hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PartyContactMech other = (PartyContactMech) obj;
		if (contactMechPurpose == null) {
			if (other.contactMechPurpose != null)
				return false;
		} else if (!contactMechPurpose.equals(other.contactMechPurpose))
			return false;
		if (contactMechType == null) {
			if (other.contactMechType != null)
				return false;
		} else if (!contactMechType.equals(other.contactMechType))
			return false;
		if (infoString == null) {
			if (other.infoString != null)
				return false;
		} else if (!infoString.equals(other.infoString))
			return false;
		if (getParty() != other.getParty())
			return false;
		return true;
	}

	public int getPartyContactMechId() {
		return partyContactMechId;
	}

	public void setPartyContactMechId(int partyContactMechId) {
		this.partyContactMechId = partyContactMechId;
	}

	public Party getParty() {
		return party;
	}

	public void setParty(Party party) {
		this.party = party;
	}
	
}
package com.openappengine.model.party;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.TableGenerator;

import org.apache.commons.lang.StringUtils;

@javax.persistence.Entity(name="PM_PARTY")
@Inheritance(strategy=InheritanceType.JOINED)
public class Party implements Serializable {

	// TODO - Needs to be configurable.
	public static final Long DEFAULT_START_EXTERNAL_ID = new Long("1000000");

	/**
	 * Active Party.
	 */
	public static final String PARTY_STATUS_ACTIVE = "ACTIVE";

	/**
	 * Suspended Party.
	 */
	public static final String PARTY_STATUS_SUSPENDED = "SUSPENDED";

	/**
	 * Terminated Party.
	 */
	public static final String PARTY_STATUS_TERMINATED = "TERMINATED";

	@Id
	@Column(name = "PM_PARTY_ID", unique = true, nullable = false)
	@GeneratedValue(strategy=GenerationType.TABLE, generator="partyGenerator")  
	@TableGenerator(name="partyGenerator", table="ad_table_sequences",pkColumnName="TS_SEQUENCE_NAME",valueColumnName="TS_SEQUENCE_VALUE",
	                allocationSize=1 // flush every 1 insert  
	)
	private int partyId;

	@Lob()
	@Column(name = "PM_DESCRIPTION", length = 100)
	private String description;

	@Column(name = "PM_EXTERNAL_ID", length = 50)
	private String externalId;

	@Column(name = "PM_PARTY_TYPE", nullable = false, length = 100)
	private String partyType;

	@Column(name = "PM_PREFERRED_CURRENCY_UOM", length = 50)
	private String preferredCurrencyUom;

	@Column(name = "PM_STATUS", nullable = false, length = 50)
	private String status;

	@OneToMany(cascade = {CascadeType.ALL})
	@JoinColumn(name = "PM_PARTY_ID", nullable = false)
	private List<PartyContactMech> partyContactMechs = new ArrayList<PartyContactMech>();

	@OneToMany(cascade = {CascadeType.ALL})
	@JoinTable(name = "PARTY_ADDRESS", joinColumns = { @JoinColumn(name = "PM_PARTY_ID", unique = true) }, inverseJoinColumns = { @JoinColumn(name = "AB_ADDRESS_ID") })
	private List<Address> addresses = new ArrayList<Address>();

	public Party() {
	}

	public int getPartyId() {
		return partyId;
	}

	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getExternalId() {
		return externalId;
	}

	public void setExternalId(String externalId) {
		this.externalId = externalId;
	}

	public String getPartyType() {
		return partyType;
	}

	public void setPartyType(String partyType) {
		this.partyType = partyType;
	}

	public String getPreferredCurrencyUom() {
		return preferredCurrencyUom;
	}

	public void setPreferredCurrencyUom(String preferredCurrencyUom) {
		this.preferredCurrencyUom = preferredCurrencyUom;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<PartyContactMech> getPartyContactMechs() {
		return partyContactMechs;
	}

	public void setPartyContactMechs(List<PartyContactMech> partyContactMeches) {
		this.partyContactMechs = partyContactMeches;
	}

	public void addPartyContactMech(PartyContactMech contactMech) {
		if (contactMech == null) {
			return;
		}

		this.partyContactMechs.add(contactMech);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((description == null) ? 0 : description.hashCode());
		result = prime * result
				+ ((externalId == null) ? 0 : externalId.hashCode());
		result = prime * result + partyId;
		result = prime * result
				+ ((partyType == null) ? 0 : partyType.hashCode());
		result = prime
				* result
				+ ((preferredCurrencyUom == null) ? 0 : preferredCurrencyUom
						.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
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
		Party other = (Party) obj;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (externalId == null) {
			if (other.externalId != null)
				return false;
		} else if (!externalId.equals(other.externalId))
			return false;
		if (partyId != other.partyId)
			return false;
		if (partyType == null) {
			if (other.partyType != null)
				return false;
		} else if (!partyType.equals(other.partyType))
			return false;
		if (preferredCurrencyUom == null) {
			if (other.preferredCurrencyUom != null)
				return false;
		} else if (!preferredCurrencyUom.equals(other.preferredCurrencyUom))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		return true;
	}

	public boolean sameIdentityAs(Party other) {
		return this.equals(other);
	}

	public Integer identity() {
		return partyId;
	}

	public List<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}
	
	public void addAddress(Address address) {
		if(address == null) {
			return;
		}
		if(StringUtils.isEmpty(address.getToName())) {
			if(StringUtils.equals("PERSON", this.partyType)) {
				address.setToName(((Person)this).getFirstName() + " " + ((Person)this).getLastName());
			}
		}
		addresses.add(address);
	}

}
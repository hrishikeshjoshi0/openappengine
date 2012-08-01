/**
 * 
 */
package com.openappengine.model.party;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

/**
 * @author hrishi
 *
 */

@Entity
@Table(name="AB_ADDRESS_BOOK")
public class Address implements Serializable {

	@Id
	@Column(name = "AB_ADDRESS_BOOK_ID", unique = true, nullable = false)
	@GeneratedValue(strategy=GenerationType.TABLE, generator="addressGenerator")  
	@TableGenerator(name="addressGenerator", table="ad_table_sequences",pkColumnName="TS_SEQUENCE_NAME",valueColumnName="TS_SEQUENCE_VALUE",
	                allocationSize=1 // flush every 1 insert  
	)
	private int addressBookId;
	
	@Column(name="AB_TO_NAME", nullable=false, length=100)
	private String toName;
	
	@Column(name="AB_ATTN_NAME", nullable=false, length=100)
	private String attnName;
	
	@Column(name="AB_ADDRESS_1", nullable=false, length=100)
	private String address1;
	
	@Column(name="AB_ADDRESS_2", nullable=true, length=100)
	private String address2;
	
	@Column(name="AB_DIRECTIONS", nullable=true, length=100)
	private String directions;
	
	@Column(name="AB_CITY", nullable=false, length=100)
	private String city;
	
	@Column(name="AB_POSTAL_CODE", nullable=false, length=100)
	private String postalCode;
	
	@Column(name="AB_POSTAL_CODE_EXT", nullable=true, length=100)
	private String postalCodeExt;
	
	@Column(name="AB_COUNTRY", nullable=false, length=100)
	private String country;
	
	@Column(name="AB_STATE_PROVINCE", nullable=false, length=100)
	private String stateProvince;
	
	/*@OneToMany
	@JoinTable(name= "AB_ADDRESS_TYPE", joinColumns = { @JoinColumn(name = "AT_ADDRESS_BOOK_ID", unique = true) }, inverseJoinColumns = { @JoinColumn(name = "AT_ADDRESS_TYPE_ID") })
	private Set<AddressType> addressTypes = new HashSet<AddressType>();*/
	
	public int getAddressBookId() {
		return addressBookId;
	}

	public void setAddressBookId(int addressBookId) {
		this.addressBookId = addressBookId;
	}

	public String getToName() {
		return toName;
	}

	public void setToName(String toName) {
		this.toName = toName;
	}

	public String getAttnName() {
		return attnName;
	}

	public void setAttnName(String attnName) {
		this.attnName = attnName;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getDirections() {
		return directions;
	}

	public void setDirections(String directions) {
		this.directions = directions;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getPostalCodeExt() {
		return postalCodeExt;
	}

	public void setPostalCodeExt(String postalCodeExt) {
		this.postalCodeExt = postalCodeExt;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getStateProvince() {
		return stateProvince;
	}

	public void setStateProvince(String stateProvince) {
		this.stateProvince = stateProvince;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((address1 == null) ? 0 : address1.hashCode());
		result = prime * result
				+ ((address2 == null) ? 0 : address2.hashCode());
		result = prime * result + addressBookId;
		result = prime * result + ((city == null) ? 0 : city.hashCode());
		result = prime * result + ((country == null) ? 0 : country.hashCode());
		result = prime * result
				+ ((directions == null) ? 0 : directions.hashCode());
		result = prime * result
				+ ((postalCode == null) ? 0 : postalCode.hashCode());
		result = prime * result
				+ ((postalCodeExt == null) ? 0 : postalCodeExt.hashCode());
		result = prime * result
				+ ((stateProvince == null) ? 0 : stateProvince.hashCode());
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
		Address other = (Address) obj;
		if (address1 == null) {
			if (other.address1 != null)
				return false;
		} else if (!address1.equals(other.address1))
			return false;
		if (address2 == null) {
			if (other.address2 != null)
				return false;
		} else if (!address2.equals(other.address2))
			return false;
		if (addressBookId != other.addressBookId)
			return false;
		if (city == null) {
			if (other.city != null)
				return false;
		} else if (!city.equals(other.city))
			return false;
		if (country == null) {
			if (other.country != null)
				return false;
		} else if (!country.equals(other.country))
			return false;
		if (directions == null) {
			if (other.directions != null)
				return false;
		} else if (!directions.equals(other.directions))
			return false;
		if (postalCode == null) {
			if (other.postalCode != null)
				return false;
		} else if (!postalCode.equals(other.postalCode))
			return false;
		if (postalCodeExt == null) {
			if (other.postalCodeExt != null)
				return false;
		} else if (!postalCodeExt.equals(other.postalCodeExt))
			return false;
		if (stateProvince == null) {
			if (other.stateProvince != null)
				return false;
		} else if (!stateProvince.equals(other.stateProvince))
			return false;
		return true;
	}
}

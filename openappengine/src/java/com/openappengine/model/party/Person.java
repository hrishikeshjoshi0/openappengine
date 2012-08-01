/**
 * 
 */
package com.openappengine.model.party;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * @author hrishi
 * 
 */
@Entity(name="PM_PERSON")
@PrimaryKeyJoinColumn(name="PM_PARTY_ID")
public class Person extends Party {
	
	@Column(name = "PM_SALUTAION", length = 100, nullable = true)
	private String salutation;

	@Column(name = "PM_FIRST_NAME", length = 100, nullable = false)
	private String firstName;

	@Column(name = "PM_MIDDLE_NAME", length = 100, nullable = true)
	private String middleName;

	@Column(name = "PM_LAST_NAME", length = 100, nullable = true)
	private String lastName;

	@Column(name = "PM_SUFFIX", length = 50, nullable = true)
	private String suffix;

	@Column(name = "PM_NICK_NAME", length = 50, nullable = true)
	private String nickname;

	@Column(name = "PM_GENDER", nullable = true)
	private String gender;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "PM_BIRTH_DATE", nullable = true)
	private Date birthDate;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "PM_DECEASED_DATE", nullable = true)
	private Date deceasedDate;

	@Column(name = "PM_MARITAL_STATUS", length = 10, nullable = true)
	private String maritalStatus;

	@Column(name = "PM_SSN", length = 50, nullable = true)
	private String socialSecurityNumber;

	@Column(name = "PM_PASSPORT_NUMBER", length = 50, nullable = true)
	private String passportNumber;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "PM_PASSPORT_EXPIRATION_DATE", nullable = true)
	private Date passportExpireDate;

	@Lob()
	@Column(name = "PM_COMMENTS", length = 100, nullable = true)
	private String comments;

	public String getSalutation() {
		return salutation;
	}

	public void setSalutation(String salutation) {
		this.salutation = salutation;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getSuffix() {
		return suffix;
	}

	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public Date getDeceasedDate() {
		return deceasedDate;
	}

	public void setDeceasedDate(Date deceasedDate) {
		this.deceasedDate = deceasedDate;
	}

	public String getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public String getSocialSecurityNumber() {
		return socialSecurityNumber;
	}

	public void setSocialSecurityNumber(String socialSecurityNumber) {
		this.socialSecurityNumber = socialSecurityNumber;
	}

	public String getPassportNumber() {
		return passportNumber;
	}

	public void setPassportNumber(String passportNumber) {
		this.passportNumber = passportNumber;
	}

	public Date getPassportExpireDate() {
		return passportExpireDate;
	}

	public void setPassportExpireDate(Date passportExpireDate) {
		this.passportExpireDate = passportExpireDate;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result
				+ ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result
				+ ((lastName == null) ? 0 : lastName.hashCode());
		result = prime * result
				+ ((middleName == null) ? 0 : middleName.hashCode());
		result = prime * result
				+ ((passportNumber == null) ? 0 : passportNumber.hashCode());
		result = prime
				* result
				+ ((socialSecurityNumber == null) ? 0 : socialSecurityNumber
						.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		Person other = (Person) obj;
		if (firstName == null) {
			if (other.firstName != null)
				return false;
		} else if (!firstName.equals(other.firstName))
			return false;
		if (gender != other.gender)
			return false;
		if (lastName == null) {
			if (other.lastName != null)
				return false;
		} else if (!lastName.equals(other.lastName))
			return false;
		if (middleName == null) {
			if (other.middleName != null)
				return false;
		} else if (!middleName.equals(other.middleName))
			return false;
		if (passportNumber == null) {
			if (other.passportNumber != null)
				return false;
		} else if (!passportNumber.equals(other.passportNumber))
			return false;
		if (socialSecurityNumber == null) {
			if (other.socialSecurityNumber != null)
				return false;
		} else if (!socialSecurityNumber.equals(other.socialSecurityNumber))
			return false;
		return true;
	}
}

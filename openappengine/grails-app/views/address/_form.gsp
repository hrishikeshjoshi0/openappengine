<%@ page import="com.openappengine.model.party.Address" %>


<g:hiddenField name="id" value="${addressInstance?.addressBookId}" />

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'address1', 'error')} ">
	<label for="address1">
		<g:message code="address.address1.label" default="Address1" />
		
	</label>
	<g:textField name="address1" value="${addressInstance?.address1}" />
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'address2', 'error')} ">
	<label for="address2">
		<g:message code="address.address2.label" default="Address2" />
		
	</label>
	<g:textField name="address2" value="${addressInstance?.address2}" />
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'attnName', 'error')} ">
	<label for="attnName">
		<g:message code="address.attnName.label" default="Attn Name" />
		
	</label>
	<g:textField name="attnName" value="${addressInstance?.attnName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="address.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${addressInstance?.city}" />
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'country', 'error')} ">
	<label for="country">
		<g:message code="address.country.label" default="Country" />
		
	</label>
	<g:textField name="country" value="${addressInstance?.country}" />
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'postalCode', 'error')} ">
	<label for="postalCode">
		<g:message code="address.postalCode.label" default="Postal Code" />
		
	</label>
	<g:textField name="postalCode" value="${addressInstance?.postalCode}" />
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'stateProvince', 'error')} ">
	<label for="stateProvince">
		<g:message code="address.stateProvince.label" default="State Province" />
		
	</label>
	<g:textField name="stateProvince" value="${addressInstance?.stateProvince}" />
</div>
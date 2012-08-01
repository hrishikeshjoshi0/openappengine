
<%@ page import="com.openappengine.model.party.Address" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-address" class="content scaffold-show" role="main">
			<ol class="property-list address">
			
				<g:if test="${addressInstance?.toName}">
					<li class="fieldcontain">
						<span id="toName-label" class="property-label"><g:message code="address.toName.label" default="To Name" /></span>
						<span class="property-value" aria-labelledby="toName-label"><g:fieldValue bean="${addressInstance}" field="toName"/></span>
					</li>
				</g:if>
			
				<g:if test="${addressInstance?.address1}">
					<li class="fieldcontain">
						<span id="address1-label" class="property-label"><g:message code="address.address1.label" default="Address1" /></span>
						<span class="property-value" aria-labelledby="address1-label"><g:fieldValue bean="${addressInstance}" field="address1"/></span>
					</li>
				</g:if>
			
				<g:if test="${addressInstance?.address2}">
					<li class="fieldcontain">
						<span id="address2-label" class="property-label"><g:message code="address.address2.label" default="Address2" /></span>
						<span class="property-value" aria-labelledby="address2-label"><g:fieldValue bean="${addressInstance}" field="address2"/></span>
					</li>
				</g:if>
			
				<g:if test="${addressInstance?.city}">
					<li class="fieldcontain">
						<span id="city-label" class="property-label"><g:message code="address.city.label" default="City" /></span>
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${addressInstance}" field="city"/></span>
					</li>
				</g:if>
			
				<g:if test="${addressInstance?.country}">
					<li class="fieldcontain">
						<span id="country-label" class="property-label"><g:message code="address.country.label" default="Country" /></span>
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${addressInstance}" field="country"/></span>
					</li>
				</g:if>
			
				<g:if test="${addressInstance?.stateProvince}">
					<li class="fieldcontain">
						<span id="stateProvince-label" class="property-label"><g:message code="address.stateProvince.label" default="State Province" /></span>
						<span class="property-value" aria-labelledby="stateProvince-label"><g:fieldValue bean="${addressInstance}" field="stateProvince"/></span>
					</li>
				</g:if>
				
				<g:if test="${addressInstance?.postalCode}">
					<li class="fieldcontain">
						<span id="postalCode-label" class="property-label"><g:message code="address.postalCode.label" default="Postal Code" /></span>
						<span class="property-value" aria-labelledby="postalCode-label"><g:fieldValue bean="${addressInstance}" field="postalCode"/></span>
					</li>
				</g:if>
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${addressInstance?.addressBookId}" />
					<g:link class="edit" action="edit" id="${addressInstance?.addressBookId}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

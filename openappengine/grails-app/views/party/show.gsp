
<%@ page import="com.openappengine.model.party.Party" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'party.label', default: 'Party')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-party" class="content scaffold-show" role="main">
			<ol class="property-list party">
			
				<g:if test="${partyInstance?.partyId}">
				<li class="fieldcontain">
					<span id="partyId-label" class="property-label"><g:message code="party.partyId.label" default="Party Id" /></span>
					
						<span class="property-value" aria-labelledby="partyId-label"><g:fieldValue bean="${partyInstance}" field="partyId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partyInstance?.addresses}">
				<li class="fieldcontain">
					<span id="addresses-label" class="property-label"><g:message code="party.addresses.label" default="Addresses" /></span>
					
						<g:each in="${partyInstance.addresses}" var="a">
						<span class="property-value" aria-labelledby="addresses-label"><g:link controller="address" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${partyInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="party.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${partyInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partyInstance?.externalId}">
				<li class="fieldcontain">
					<span id="externalId-label" class="property-label"><g:message code="party.externalId.label" default="External Id" /></span>
					
						<span class="property-value" aria-labelledby="externalId-label"><g:fieldValue bean="${partyInstance}" field="externalId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partyInstance?.partyContactMechs}">
				<li class="fieldcontain">
					<span id="partyContactMechs-label" class="property-label"><g:message code="party.partyContactMechs.label" default="Party Contact Mechs" /></span>
					
						<g:each in="${partyInstance.partyContactMechs}" var="p">
						<span class="property-value" aria-labelledby="partyContactMechs-label"><g:link controller="partyContactMech" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${partyInstance?.partyType}">
				<li class="fieldcontain">
					<span id="partyType-label" class="property-label"><g:message code="party.partyType.label" default="Party Type" /></span>
					
						<span class="property-value" aria-labelledby="partyType-label"><g:fieldValue bean="${partyInstance}" field="partyType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partyInstance?.preferredCurrencyUom}">
				<li class="fieldcontain">
					<span id="preferredCurrencyUom-label" class="property-label"><g:message code="party.preferredCurrencyUom.label" default="Preferred Currency Uom" /></span>
					
						<span class="property-value" aria-labelledby="preferredCurrencyUom-label"><g:fieldValue bean="${partyInstance}" field="preferredCurrencyUom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partyInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="party.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${partyInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${partyInstance?.id}" />
					<g:link class="edit" action="edit" id="${partyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

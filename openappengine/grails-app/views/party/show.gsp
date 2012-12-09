
<%@ page import="com.openappengine.model.party.Party" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'party.label', default: 'Party')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-party" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="party.partyId.label" default="Party Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: partyInstance, field: "partyId")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="party.addresses.label" default="Addresses" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${partyInstance.addresses}" var="a">
						<li><g:link controller="address" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="party.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: partyInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="party.externalId.label" default="External Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: partyInstance, field: "externalId")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="party.partyContactMechs.label" default="Party Contact Mechs" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${partyInstance.partyContactMechs}" var="p">
						<li><g:link controller="partyContactMech" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="party.partyType.label" default="Party Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: partyInstance, field: "partyType")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="party.preferredCurrencyUom.label" default="Preferred Currency Uom" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: partyInstance, field: "preferredCurrencyUom")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="party.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: partyInstance, field: "status")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>

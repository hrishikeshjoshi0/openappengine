
<%@ page import="com.openappengine.model.party.Party" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'party.label', default: 'Party')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-party" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="partyId" title="${message(code: 'party.partyId.label', default: 'Party Id')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'party.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="externalId" title="${message(code: 'party.externalId.label', default: 'External Id')}" />
			
				<g:sortableColumn property="partyType" title="${message(code: 'party.partyType.label', default: 'Party Type')}" />
			
				<g:sortableColumn property="preferredCurrencyUom" title="${message(code: 'party.preferredCurrencyUom.label', default: 'Preferred Currency Uom')}" />
			
				<g:sortableColumn property="status" title="${message(code: 'party.status.label', default: 'Status')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${partyInstanceList}" status="i" var="partyInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${partyInstance.partyId}">${fieldValue(bean: partyInstance, field: "partyId")}</g:link></td>
			
				<td>${fieldValue(bean: partyInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: partyInstance, field: "externalId")}</td>
			
				<td>${fieldValue(bean: partyInstance, field: "partyType")}</td>
			
				<td>${fieldValue(bean: partyInstance, field: "preferredCurrencyUom")}</td>
			
				<td>${fieldValue(bean: partyInstance, field: "status")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${partyInstanceTotal}" />
	</div>
</section>

</body>

</html>


<%@ page import="com.openappengine.model.billing.BillingCycle" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'billingCycle.label', default: 'BillingCycle')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-billingCycle" class="content scaffold-list" role="main">
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="billingCycleId" title="${message(code: 'billingCycle.billingCycleId.label', default: 'Billing Cycle Id')}" />
					
						<g:sortableColumn property="fromDate" title="${message(code: 'billingCycle.fromDate.label', default: 'From Date')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'billingCycle.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'billingCycle.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="toDate" title="${message(code: 'billingCycle.toDate.label', default: 'To Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${billingCycleInstanceList}" status="i" var="billingCycleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${billingCycleInstance.billingCycleId}">${fieldValue(bean: billingCycleInstance, field: "billingCycleId")}</g:link></td>
					
						<td><g:formatDate date="${billingCycleInstance.fromDate}" /></td>
					
						<td>${fieldValue(bean: billingCycleInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: billingCycleInstance, field: "status")}</td>
					
						<td><g:formatDate date="${billingCycleInstance.toDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${billingCycleInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

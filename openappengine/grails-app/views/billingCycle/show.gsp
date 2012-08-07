
<%@ page import="com.openappengine.model.billing.BillingCycle" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'billingCycle.label', default: 'BillingCycle')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-billingCycle" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-billingCycle" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list billingCycle">
			
				<g:if test="${billingCycleInstance?.billingCycleId}">
				<li class="fieldcontain">
					<span id="billingCycleId-label" class="property-label"><g:message code="billingCycle.billingCycleId.label" default="Billing Cycle Id" /></span>
					
						<span class="property-value" aria-labelledby="billingCycleId-label"><g:fieldValue bean="${billingCycleInstance}" field="billingCycleId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${billingCycleInstance?.fromDate}">
				<li class="fieldcontain">
					<span id="fromDate-label" class="property-label"><g:message code="billingCycle.fromDate.label" default="From Date" /></span>
					
						<span class="property-value" aria-labelledby="fromDate-label"><g:formatDate date="${billingCycleInstance?.fromDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${billingCycleInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="billingCycle.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${billingCycleInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${billingCycleInstance?.orders}">
				<li class="fieldcontain">
					<span id="orders-label" class="property-label"><g:message code="billingCycle.orders.label" default="Orders" /></span>
					
						<g:each in="${billingCycleInstance.orders}" var="o">
						<span class="property-value" aria-labelledby="orders-label"><g:link controller="ohOrderHeader" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${billingCycleInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="billingCycle.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${billingCycleInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${billingCycleInstance?.toDate}">
				<li class="fieldcontain">
					<span id="toDate-label" class="property-label"><g:message code="billingCycle.toDate.label" default="To Date" /></span>
					
						<span class="property-value" aria-labelledby="toDate-label"><g:formatDate date="${billingCycleInstance?.toDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${billingCycleInstance?.id}" />
					<g:link class="edit" action="edit" id="${billingCycleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

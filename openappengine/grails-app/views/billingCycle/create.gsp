<%@ page import="com.openappengine.model.billing.BillingCycle" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'billingCycle.label', default: 'BillingCycle')}" />
		<title>
			Create New Billing Cycle 
		</title>
	</head>
	<body>
		<div id="create-billingCycle" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${billingCycleInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${billingCycleInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
					<g:render template="form"/>
					<g:submitButton name="create" class="save" 
							value="${message(code: 'default.button.create.label', default: 'Save')}" />
			</g:form>
		</div>
	</body>
</html>

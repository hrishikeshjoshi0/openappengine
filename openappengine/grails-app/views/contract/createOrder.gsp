<%@ page import="com.openappengine.model.contract.Contract" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}" />
		<title>
			Contract | Create Orders From Contract 
		</title>
	</head>
	
	<body>
		<div id="create-contract" class="content scaffold-create" role="main">
			<g:hasErrors bean="${contractInstance}">
			
			<ul class="errors" role="alert">
				<g:eachError bean="${contractInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<br/>
			
			<h1>
				Create Bulk Orders
			</h1>
			
			<g:form name="contractForm" action="createAllOrders" >
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: ohOrderHeaderInstance, field: 'fromDate', 'error')} ">
						<label for="toDate">
							<g:message code="ohOrderHeader.toDate.label" default="From Date" />
						</label>
						<g:jqDatePicker name="fromDate" value="${params?.fromDate}" />
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: ohOrderHeaderInstance, field: 'toDate', 'error')} ">
						<label for="toDate">
							<g:message code="ohOrderHeader.toDate.label" default="To Date" />
						</label>
						<g:jqDatePicker name="toDate" value="${params?.toDate}" />
					</div>					
				</fieldset>
				
				<fieldset class="buttons">
					<g:submitButton name="createOrder" 
							class="save" value="${message(code: 'default.button.createOrder.label', default: 'Create Order')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

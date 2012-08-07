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
					<table style="width: 50%;">
						<tr>
							<td><label>Select Billing Cycle </label></td>
							<td><g:hiddenField name="id"
									value="${bulkPaymentUploadInstance?.bulkPaymentUploadId}" /> <g:select
									name="billingCycleId" from="${billingCycles}" optionValue="name"
									optionKey="name" /></td>
						</tr>
						<tr>
							<td colspan="2">
								<g:submitButton name="createOrder" 
									class="save" value="${message(code: 'default.button.createOrder.label', default: 'Create Order')}" />
							</td>		
						</tr>
					</table>
			</g:form>
		</div>
	</body>
</html>

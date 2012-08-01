
<%@ page import="com.openappengine.model.contract.ContractLineItem" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contractLineItem.label', default: 'ContractLineItem')}" />
		<title>
			Contract | Contract# ${contractLineItemInstance?.contract?.contractNumber }
		</title>
	</head>
	<body>
		<div id="show-contractLineItem" class="content scaffold-show" role="main">
			
			<h1>Contract# - ${contractLineItemInstance?.contract?.contractNumber}</h1> 
			<ol class="property-list contractLineItem">
			
					<li class="fieldcontain">
						<span id="contract-label" class="property-label"><g:message code="contractLineItem.contract.label" default="Contract" /></span>
						<span class="property-value" aria-labelledby="contract-label"><g:link controller="contract" action="show" id="${contractLineItemInstance?.contract?.contractId}">${contractLineItemInstance?.contract?.contractNumber}</g:link></span>
					</li>
			
					<li class="fieldcontain">
						<span id="product-label" class="property-label"><g:message code="contractLineItem.product.label" default="Product" /></span>
						<span class="property-value" aria-labelledby="product-label">${contractLineItemInstance?.product?.pdProductName}</span>
					</li>
			
					<li class="fieldcontain">
						<span id="quantity-label" class="property-label"><g:message code="contractLineItem.quantity.label" default="Quantity" /></span>
						<span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${contractLineItemInstance}" field="quantity"/></span>
					</li>
			
					<!-- TODO -->
					<li class="fieldcontain">
						<span id="selectedAmouunt-label" class="property-label"><g:message code="contractLineItem.selectedAmouunt.label" default="Selected Amouunt" /></span>
						<span class="property-value" aria-labelledby="selectedAmouunt-label"><g:fieldValue bean="${contractLineItemInstance}" field="selectedAmouunt"/></span>
					</li>
			
					<li class="fieldcontain">
						<span id="status-label" class="property-label"><g:message code="contractLineItem.status.label" default="Status" /></span>
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${contractLineItemInstance}" field="status"/></span>
					</li>
			</ol>
		</div>
	</body>
</html>

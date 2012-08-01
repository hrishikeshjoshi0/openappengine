
<%@ page import="com.openappengine.model.fm.FmPayment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fmPayment.label', default: 'FmPayment')}" />
		<title>
			Payment | Payment
		</title>
	</head>
	<body>
		<div id="show-fmPayment" class="content scaffold-show" role="main">
			<ol class="property-list fmPayment">
				<li class="fieldcontain">
					<span id="paymentNumber-label" class="property-label"><g:message code="fmPayment.paymentNumber.label" default="Payment Number" /></span>
					<span class="property-value" aria-labelledby="paymentNumber-label"><g:fieldValue bean="${fmPaymentInstance}" field="paymentNumber"/></span>
				</li>
				
				<li class="fieldcontain">
					<span id="partyExternalIdFrom-label" class="property-label"><g:message code="fmPayment.partyExternalIdFrom.label" default="Party External Id From" /></span>
					<span class="property-value" aria-labelledby="partyExternalIdFrom-label"><g:fieldValue bean="${fmPaymentInstance}" field="partyExternalIdFrom"/></span>
				</li>
				
				<li class="fieldcontain">
					<span id="billingAccountId-label" class="property-label"><g:message code="fmPayment.billingAccountId.label" default="Billing Account Id" /></span>
					<span class="property-value" aria-labelledby="billingAccountId-label"><g:fieldValue bean="${fmPaymentInstance}" field="billingAccountId"/></span>
				</li>
				
				<li class="fieldcontain">
					<span id="contractExternalId-label" class="property-label"><g:message code="fmPayment.contractExternalId.label" default="Contract External Id" /></span>
					<span class="property-value" aria-labelledby="contractExternalId-label"><g:fieldValue bean="${fmPaymentInstance}" field="contractExternalId"/></span>
				</li>
				
				<li class="fieldcontain">
					<span id="orderNumber-label" class="property-label"><g:message code="fmPayment.orderNumber.label" default="Order Number" /></span>
					<span class="property-value" aria-labelledby="orderNumber-label"><g:fieldValue bean="${fmPaymentInstance}" field="orderNumber"/></span>
				</li>
				
				<li class="fieldcontain">
					<span id="currencyUom-label" class="property-label"><g:message code="fmPayment.currencyUom.label" default="Currency Uom" /></span>
					<span class="property-value" aria-labelledby="currencyUom-label"><g:fieldValue bean="${fmPaymentInstance}" field="currencyUom"/></span>
				</li>
				
				<li class="fieldcontain">
					<span id="paymentType-label" class="property-label"><g:message code="fmPayment.paymentType.label" default="Payment Type" /></span>
					<span class="property-value" aria-labelledby="paymentType-label"><g:fieldValue bean="${fmPaymentInstance}" field="paymentType"/></span>
				</li>
				
				<li class="fieldcontain">
					<span id="paymentMethod-label" class="property-label"><g:message code="fmPayment.paymentMethod.label" default="Payment Method" /></span>
					<span class="property-value" aria-labelledby="paymentMethod-label"><g:fieldValue bean="${fmPaymentInstance}" field="paymentMethod"/></span>
				</li>

				<li class="fieldcontain">
					<span id="transactionId-label" class="property-label"><g:message code="fmPayment.transactionId.label" default="Transaction Id" /></span>
					<span class="property-value" aria-labelledby="transactionId-label"><g:fieldValue bean="${fmPaymentInstance}" field="transactionId"/></span>
				</li>
			
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="fmPayment.status.label" default="Status" /></span>
					<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${fmPaymentInstance}" field="status"/></span>
				</li>
				
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="fmPayment.amount.label" default="Amount" /></span>
					<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${fmPaymentInstance}" field="amount"/></span>
				</li>
			
				<li class="fieldcontain">
					<span id="effectiveDate-label" class="property-label"><g:message code="fmPayment.effectiveDate.label" default="Effective Date" /></span>
					<span class="property-value" aria-labelledby="effectiveDate-label"><g:formatDate date="${fmPaymentInstance?.effectiveDate}" /></span>
				</li>
			</ol>
		</div>
	</body>
</html>

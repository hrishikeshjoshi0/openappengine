
<%@page import="com.openappengine.model.product.Product"%>
<%@ page import="com.openappengine.model.fm.OhOrderHeader"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'ohOrderHeader.label', default: 'OhOrderHeader')}" />
<title>
	Order | Complete Order # <g:fieldValue bean="${ohOrderHeaderInstance}" field="externalId" />
</title>
</head>
<body>
	<h1>
		Order # <g:fieldValue bean="${ohOrderHeaderInstance}" field="externalId" />
	</h1>
	<div id="show-ohOrderHeader" class="content scaffold-show" role="main">
		<ol class="property-list ohOrderHeader">

			<li class="fieldcontain"><span id="externalId-label"
				class="property-label"><g:message
						code="ohOrderHeader.externalId.label" default="External Id" /></span> <span
				class="property-value" aria-labelledby="externalId-label"><g:fieldValue
						bean="${ohOrderHeaderInstance}" field="externalId" /></span></li>

			<li class="fieldcontain"><span id="orderName-label"
				class="property-label"><g:message
						code="ohOrderHeader.orderName.label" default="Order Name" /></span> <span
				class="property-value" aria-labelledby="orderName-label"><g:fieldValue
						bean="${ohOrderHeaderInstance}" field="orderName" /></span></li>
			<li class="fieldcontain"><span id="orderType-label"
				class="property-label"><g:message
						code="ohOrderHeader.orderType.label" default="Order Type" /></span> <span
				class="property-value" aria-labelledby="orderType-label"><g:fieldValue
						bean="${ohOrderHeaderInstance}" field="orderType" /></span></li>

			<li class="fieldcontain"><span id="billingAccountId-label"
				class="property-label"><g:message
						code="ohOrderHeader.billingAccountId.label"
						default="Billing Account Id" /></span> <span class="property-value"
				aria-labelledby="billingAccountId-label"><g:fieldValue
						bean="${ohOrderHeaderInstance}" field="billingAccountId" /></span></li>
			
			<li class="fieldcontain"><span id="status-label"
				class="property-label"><g:message
						code="ohOrderHeader.status.label"
						default="Status" /></span> <span class="property-value"
				aria-labelledby="status-label"><g:fieldValue
						bean="${ohOrderHeaderInstance}" field="status" /></span></li>			

			<li class="fieldcontain"><span id="contractNumber-label"
				class="property-label"><g:message
						code="ohOrderHeader.contractNumber.label"
						default="Contract Number" /></span> <span class="property-value"
				aria-labelledby="contractNumber-label"><g:fieldValue
						bean="${ohOrderHeaderInstance}" field="contractNumber" /></span></li>

			<li class="fieldcontain"><span id="currencyUom-label"
				class="property-label"><g:message
						code="ohOrderHeader.currencyUom.label" default="Currency Uom" /></span>
				<span class="property-value" aria-labelledby="currencyUom-label"><g:fieldValue
						bean="${ohOrderHeaderInstance}" field="currencyUom" /></span></li>

			<li class="fieldcontain"><span id="entryDate-label"
				class="property-label"><g:message
						code="ohOrderHeader.entryDate.label" default="Entry Date" /></span> <span
				class="property-value" aria-labelledby="entryDate-label">
				<g:formatDate format="yyyy-MM-dd"
						date="${ohOrderHeaderInstance?.entryDate}" /></span></li>

			<li class="fieldcontain"><span id="fromDate-label"
				class="property-label"><g:message
						code="ohOrderHeader.fromDate.label" default="From Date" /></span> <span
				class="property-value" aria-labelledby="fromDate-label"><g:formatDate format="yyyy-MM-dd"
						date="${ohOrderHeaderInstance?.fromDate}" /></span></li>
						
			<li class="fieldcontain"><span id="toDate-label"
				class="property-label"><g:message
						code="ohOrderHeader.toDate.label" default="To Date" /></span> <span
				class="property-value" aria-labelledby="toDate-label"><g:formatDate format="yyyy-MM-dd"
						date="${ohOrderHeaderInstance?.toDate}" /></span></li>			

			<li class="fieldcontain"><span id="orderDate-label"
				class="property-label"><g:message
						code="ohOrderHeader.orderDate.label" default="Order Date" /></span> <span
				class="property-value" aria-labelledby="orderDate-label"><g:formatDate format="yyyy-MM-dd"
						date="${ohOrderHeaderInstance?.orderDate}" /></span></li>

			<li class="fieldcontain"><span id="grandTotal-label"
				class="property-label"><g:message
						code="ohOrderHeader.grandTotal.label" default="Grand Total" /></span> <span
				class="property-value" aria-labelledby="grandTotal-label"><g:fieldValue
						bean="${ohOrderHeaderInstance}" field="grandTotal" /></span></li>
			
			<br/>
			<li class="fieldcontain"><span id="orderItems-label"
				class="property-label"><g:message
						code="ohOrderHeader.orderItems.label" default="Order Items" /></span>
				<table>
					<thead>
						<tr>
							<th>Product</th>
							<th>Quantity</th>
							<th>Unit Price</th>
							<th>Tax</th>
							<th>Total Price</th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${ohOrderHeaderInstance.orderItems}" var="o">
							<tr>
								<td>
									${o.product?.pdProductName}
								</td>
								<td>
									${o.quantity}
								</td>
								<td>
									${o.unitPrice}
								</td>
								<td>
									${o.taxPrice}
								</td>
								<td>
									${o.lineTotalPrice}
								</td>
							</tr>
						</g:each>
					</tbody>
				</table></li>
		</ol>
	</div>
	<g:form method="post" action="completeOrder" controller="order">
				<g:hiddenField name="id" value="${ohOrderHeaderInstance?.orderId}" />
				<fieldset class="buttons">
					<g:actionSubmit class="Complete" action="completeOrder" value="${message(code: 'default.button.complete.label', default: 'Complete')}" formnovalidate="" />
				</fieldset>
	</g:form>
</body>
</html>

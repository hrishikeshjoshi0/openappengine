
<%@ page import="com.openappengine.model.contract.ContractLineItem" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contractLineItem.label', default: 'ContractLineItem')}" />
		<title>
			Contract | Contract# ${contractLineItemInstance?.contract?.contractNumber } | Add Contract Line Item
		</title>
	</head>
	<body>
		<div id="list-contractLineItem" class="hor-minimalist content scaffold-list" role="main">
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="lineItemId" title="${message(code: 'contractLineItem.lineItemId.label', default: 'Line Item Id')}" />
					
						<th><g:message code="contractLineItem.contract.label" default="Contract" /></th>
					
						<g:sortableColumn property="itemDescription" title="${message(code: 'contractLineItem.itemDescription.label', default: 'Item Description')}" />
					
						<g:sortableColumn property="itemType" title="${message(code: 'contractLineItem.itemType.label', default: 'Item Type')}" />
					
						<th><g:message code="contractLineItem.product.label" default="Product" /></th>
					
						<g:sortableColumn property="quantity" title="${message(code: 'contractLineItem.quantity.label', default: 'Quantity')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contractLineItemInstanceList}" status="i" var="contractLineItemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contractLineItemInstance.id}">${fieldValue(bean: contractLineItemInstance, field: "lineItemId")}</g:link></td>
					
						<td>${fieldValue(bean: contractLineItemInstance, field: "contract")}</td>
					
						<td>${fieldValue(bean: contractLineItemInstance, field: "itemDescription")}</td>
					
						<td>${fieldValue(bean: contractLineItemInstance, field: "itemType")}</td>
					
						<td>${fieldValue(bean: contractLineItemInstance, field: "product")}</td>
					
						<td>${fieldValue(bean: contractLineItemInstance, field: "quantity")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contractLineItemInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

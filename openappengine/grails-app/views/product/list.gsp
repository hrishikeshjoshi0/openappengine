
<%@ page import="com.openappengine.model.product.Product" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-product" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="pdProductId" title="${message(code: 'product.pdProductId.label', default: 'Pd Product Id')}" />
			
				<g:sortableColumn property="pdAmountUomType" title="${message(code: 'product.pdAmountUomType.label', default: 'Pd Amount Uom Type')}" />
			
				<g:sortableColumn property="pdComments" title="${message(code: 'product.pdComments.label', default: 'Pd Comments')}" />
			
				<g:sortableColumn property="pdCreatedDate" title="${message(code: 'product.pdCreatedDate.label', default: 'Pd Created Date')}" />
			
				<g:sortableColumn property="pdDescription" title="${message(code: 'product.pdDescription.label', default: 'Pd Description')}" />
			
				<g:sortableColumn property="pdFixedAmount" title="${message(code: 'product.pdFixedAmount.label', default: 'Pd Fixed Amount')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${productInstanceList}" status="i" var="productInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${productInstance.pdProductId}">${fieldValue(bean: productInstance, field: "pdProductId")}</g:link></td>
			
				<td>${fieldValue(bean: productInstance, field: "pdAmountUomType")}</td>
			
				<td>${fieldValue(bean: productInstance, field: "pdComments")}</td>
			
				<td><g:formatDate date="${productInstance.pdCreatedDate}" /></td>
			
				<td>${fieldValue(bean: productInstance, field: "pdDescription")}</td>
			
				<td>${fieldValue(bean: productInstance, field: "pdFixedAmount")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${productInstanceTotal}" />
	</div>
</section>

</body>

</html>

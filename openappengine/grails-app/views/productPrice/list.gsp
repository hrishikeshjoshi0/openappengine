
<%@ page import="com.openappengine.model.product.ProdProductPrice" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prodProductPrice.label', default: 'ProdProductPrice')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-prodProductPrice" class="content scaffold-list" role="main">
			<table class="hor-minimalist">
				<thead>
					<tr>
					
						<g:sortableColumn property="ppProdProductPriceId" title="${message(code: 'prodProductPrice.ppProdProductPriceId.label', default: 'Pp Prod Product Price Id')}" />
					
						<g:sortableColumn property="ppCurrencyUomId" title="${message(code: 'prodProductPrice.ppCurrencyUomId.label', default: 'Pp Currency Uom Id')}" />
					
						<g:sortableColumn property="ppFromDate" title="${message(code: 'prodProductPrice.ppFromDate.label', default: 'Pp From Date')}" />
					
						<g:sortableColumn property="ppPrice" title="${message(code: 'prodProductPrice.ppPrice.label', default: 'Pp Price')}" />
					
						<g:sortableColumn property="ppToDate" title="${message(code: 'prodProductPrice.ppToDate.label', default: 'Pp To Date')}" />
					
						<th><g:message code="prodProductPrice.prodProduct.label" default="Prod Product" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${prodProductPriceInstanceList}" status="i" var="prodProductPriceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${prodProductPriceInstance.id}">${fieldValue(bean: prodProductPriceInstance, field: "ppProdProductPriceId")}</g:link></td>
					
						<td>${fieldValue(bean: prodProductPriceInstance, field: "ppCurrencyUomId")}</td>
					
						<td><g:formatDate date="${prodProductPriceInstance.ppFromDate}" /></td>
					
						<td>${fieldValue(bean: prodProductPriceInstance, field: "ppPrice")}</td>
					
						<td><g:formatDate date="${prodProductPriceInstance.ppToDate}" /></td>
					
						<td>${fieldValue(bean: prodProductPriceInstance, field: "prodProduct")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${prodProductPriceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

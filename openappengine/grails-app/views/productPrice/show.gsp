
<%@ page import="com.openappengine.model.product.ProdProductPrice"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'prodProductPrice.label', default: 'ProdProductPrice')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div id="show-prodProductPrice" class="content scaffold-show"
		role="main">
		<ol class="property-list prodProductPrice">

			<g:if test="${prodProductPriceInstance?.ppProdProductPriceId}">
				<li class="fieldcontain"><span id="ppProdProductPriceId-label"
					class="property-label"><g:message
							code="prodProductPrice.ppProdProductPriceId.label"
							default="Pp Prod Product Price Id" /></span> <span
					class="property-value" aria-labelledby="ppProdProductPriceId-label"><g:fieldValue
							bean="${prodProductPriceInstance}" field="ppProdProductPriceId" /></span>
				</li>
			</g:if>

			<g:if test="${prodProductPriceInstance?.ppCurrencyUomId}">
				<li class="fieldcontain"><span id="ppCurrencyUomId-label"
					class="property-label"><g:message
							code="prodProductPrice.ppCurrencyUomId.label"
							default="Pp Currency Uom Id" /></span> <span class="property-value"
					aria-labelledby="ppCurrencyUomId-label"><g:fieldValue
							bean="${prodProductPriceInstance}" field="ppCurrencyUomId" /></span></li>
			</g:if>

			<g:if test="${prodProductPriceInstance?.ppFromDate}">
				<li class="fieldcontain"><span id="ppFromDate-label"
					class="property-label"><g:message
							code="prodProductPrice.ppFromDate.label" default="Pp From Date" /></span>

					<span class="property-value" aria-labelledby="ppFromDate-label"><g:formatDate
							date="${prodProductPriceInstance?.ppFromDate}" /></span></li>
			</g:if>

			<g:if test="${prodProductPriceInstance?.ppPrice}">
				<li class="fieldcontain"><span id="ppPrice-label"
					class="property-label"><g:message
							code="prodProductPrice.ppPrice.label" default="Pp Price" /></span> <span
					class="property-value" aria-labelledby="ppPrice-label"><g:fieldValue
							bean="${prodProductPriceInstance}" field="ppPrice" /></span></li>
			</g:if>

			<g:if test="${prodProductPriceInstance?.ppToDate}">
				<li class="fieldcontain"><span id="ppToDate-label"
					class="property-label"><g:message
							code="prodProductPrice.ppToDate.label" default="Pp To Date" /></span> <span
					class="property-value" aria-labelledby="ppToDate-label"><g:formatDate
							date="${prodProductPriceInstance?.ppToDate}" /></span></li>
			</g:if>

			<g:if test="${prodProductPriceInstance?.prodProduct}">
				<li class="fieldcontain">
				
				<span id="prodProduct-label" class="property-label"><g:message
							code="prodProductPrice.prodProduct.label" default="Prod Product" /></span>

					<span class="property-value" aria-labelledby="prodProduct-label"><g:link
							controller="product" action="show"
							id="${prodProductPriceInstance?.prodProduct?.id}">
							${prodProductPriceInstance?.prodProduct?.encodeAsHTML()}
				</g:link></span></li>
			</g:if>

		</ol>
		<g:form>
			<fieldset class="buttons">
				<g:hiddenField name="id" value="${prodProductPriceInstance?.id}" />
				<g:link class="edit" action="edit"
					id="${prodProductPriceInstance?.id}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>

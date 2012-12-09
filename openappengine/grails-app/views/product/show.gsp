
<%@ page import="com.openappengine.model.product.Product" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-product" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdProductId.label" default="Pd Product Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "pdProductId")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdAmountUomType.label" default="Pd Amount Uom Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "pdAmountUomType")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdComments.label" default="Pd Comments" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "pdComments")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdCreatedDate.label" default="Pd Created Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${productInstance?.pdCreatedDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdDescription.label" default="Pd Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "pdDescription")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdFixedAmount.label" default="Pd Fixed Amount" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "pdFixedAmount")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdInternalName.label" default="Pd Internal Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "pdInternalName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdIntroductionDate.label" default="Pd Introduction Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${productInstance?.pdIntroductionDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdIsVirtual.label" default="Pd Is Virtual" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${productInstance?.pdIsVirtual}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdPiecesIncluded.label" default="Pd Pieces Included" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "pdPiecesIncluded")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdProductName.label" default="Pd Product Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "pdProductName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdProductType.label" default="Pd Product Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "pdProductType")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdQuantityIncluded.label" default="Pd Quantity Included" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "pdQuantityIncluded")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdQuantityUom.label" default="Pd Quantity Uom" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "pdQuantityUom")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdRequireAmount.label" default="Pd Require Amount" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${productInstance?.pdRequireAmount}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdRequireInventory.label" default="Pd Require Inventory" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${productInstance?.pdRequireInventory}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdReturnable.label" default="Pd Returnable" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${productInstance?.pdReturnable}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdSalesDiscWhenNotAvail.label" default="Pd Sales Disc When Not Avail" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${productInstance?.pdSalesDiscWhenNotAvail}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdSalesDiscontinuationDate.label" default="Pd Sales Discontinuation Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${productInstance?.pdSalesDiscontinuationDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdSupportDiscontinuationDate.label" default="Pd Support Discontinuation Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${productInstance?.pdSupportDiscontinuationDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdTaxable.label" default="Pd Taxable" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${productInstance?.pdTaxable}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdWeight.label" default="Pd Weight" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "pdWeight")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pdWeightUomId.label" default="Pd Weight Uom Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "pdWeightUomId")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.prodProductPrices.label" default="Prod Product Prices" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${productInstance.prodProductPrices}" var="p">
						<li><g:link controller="prodProductPrice" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.productTaxes.label" default="Product Taxes" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${productInstance.productTaxes}" var="p">
						<li><g:link controller="fmTaxType" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>

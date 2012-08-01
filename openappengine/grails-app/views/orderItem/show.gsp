
<%@ page import="com.openappengine.model.fm.OiOrderItem" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'oiOrderItem.label', default: 'OiOrderItem')}" />
		<title>
			Order | Order # ${oiOrderItemInstance?.orderHeader?.externalId } | Show Order Item
		</title>
	</head>
	<body>
		<a href="#show-oiOrderItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-oiOrderItem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list oiOrderItem">
			
				<g:if test="${oiOrderItemInstance?.orderItemId}">
				<li class="fieldcontain">
					<span id="orderItemId-label" class="property-label"><g:message code="oiOrderItem.orderItemId.label" default="Order Item Id" /></span>
					
						<span class="property-value" aria-labelledby="orderItemId-label"><g:fieldValue bean="${oiOrderItemInstance}" field="orderItemId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${oiOrderItemInstance?.cancelQuantity}">
				<li class="fieldcontain">
					<span id="cancelQuantity-label" class="property-label"><g:message code="oiOrderItem.cancelQuantity.label" default="Cancel Quantity" /></span>
					
						<span class="property-value" aria-labelledby="cancelQuantity-label"><g:fieldValue bean="${oiOrderItemInstance}" field="cancelQuantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${oiOrderItemInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="oiOrderItem.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${oiOrderItemInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${oiOrderItemInstance?.externalId}">
				<li class="fieldcontain">
					<span id="externalId-label" class="property-label"><g:message code="oiOrderItem.externalId.label" default="External Id" /></span>
					
						<span class="property-value" aria-labelledby="externalId-label"><g:fieldValue bean="${oiOrderItemInstance}" field="externalId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${oiOrderItemInstance?.itemDescription}">
				<li class="fieldcontain">
					<span id="itemDescription-label" class="property-label"><g:message code="oiOrderItem.itemDescription.label" default="Item Description" /></span>
					
						<span class="property-value" aria-labelledby="itemDescription-label"><g:fieldValue bean="${oiOrderItemInstance}" field="itemDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${oiOrderItemInstance?.lineTotalPrice}">
				<li class="fieldcontain">
					<span id="lineTotalPrice-label" class="property-label"><g:message code="oiOrderItem.lineTotalPrice.label" default="Line Total Price" /></span>
					
						<span class="property-value" aria-labelledby="lineTotalPrice-label"><g:fieldValue bean="${oiOrderItemInstance}" field="lineTotalPrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${oiOrderItemInstance?.orderHeader}">
				<li class="fieldcontain">
					<span id="orderHeader-label" class="property-label"><g:message code="oiOrderItem.orderHeader.label" default="Order Header" /></span>
					
						<span class="property-value" aria-labelledby="orderHeader-label"><g:link controller="ohOrderHeader" action="show" id="${oiOrderItemInstance?.orderHeader?.id}">${oiOrderItemInstance?.orderHeader?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${oiOrderItemInstance?.orderItemSequenceId}">
				<li class="fieldcontain">
					<span id="orderItemSequenceId-label" class="property-label"><g:message code="oiOrderItem.orderItemSequenceId.label" default="Order Item Sequence Id" /></span>
					
						<span class="property-value" aria-labelledby="orderItemSequenceId-label"><g:fieldValue bean="${oiOrderItemInstance}" field="orderItemSequenceId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${oiOrderItemInstance?.orderItemType}">
				<li class="fieldcontain">
					<span id="orderItemType-label" class="property-label"><g:message code="oiOrderItem.orderItemType.label" default="Order Item Type" /></span>
					
						<span class="property-value" aria-labelledby="orderItemType-label"><g:fieldValue bean="${oiOrderItemInstance}" field="orderItemType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${oiOrderItemInstance?.priceModified}">
				<li class="fieldcontain">
					<span id="priceModified-label" class="property-label"><g:message code="oiOrderItem.priceModified.label" default="Price Modified" /></span>
					
						<span class="property-value" aria-labelledby="priceModified-label"><g:formatBoolean boolean="${oiOrderItemInstance?.priceModified}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${oiOrderItemInstance?.product}">
				<li class="fieldcontain">
					<span id="product-label" class="property-label"><g:message code="oiOrderItem.product.label" default="Product" /></span>
					
						<span class="property-value" aria-labelledby="product-label"><g:link controller="product" action="show" id="${oiOrderItemInstance?.product?.id}">${oiOrderItemInstance?.product?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${oiOrderItemInstance?.quantity}">
				<li class="fieldcontain">
					<span id="quantity-label" class="property-label"><g:message code="oiOrderItem.quantity.label" default="Quantity" /></span>
					
						<span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${oiOrderItemInstance}" field="quantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${oiOrderItemInstance?.selectedAmouunt}">
				<li class="fieldcontain">
					<span id="selectedAmouunt-label" class="property-label"><g:message code="oiOrderItem.selectedAmouunt.label" default="Selected Amouunt" /></span>
					
						<span class="property-value" aria-labelledby="selectedAmouunt-label"><g:fieldValue bean="${oiOrderItemInstance}" field="selectedAmouunt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${oiOrderItemInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="oiOrderItem.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${oiOrderItemInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${oiOrderItemInstance?.taxPrice}">
				<li class="fieldcontain">
					<span id="taxPrice-label" class="property-label"><g:message code="oiOrderItem.taxPrice.label" default="Tax Price" /></span>
					
						<span class="property-value" aria-labelledby="taxPrice-label"><g:fieldValue bean="${oiOrderItemInstance}" field="taxPrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${oiOrderItemInstance?.unitListPrice}">
				<li class="fieldcontain">
					<span id="unitListPrice-label" class="property-label"><g:message code="oiOrderItem.unitListPrice.label" default="Unit List Price" /></span>
					
						<span class="property-value" aria-labelledby="unitListPrice-label"><g:fieldValue bean="${oiOrderItemInstance}" field="unitListPrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${oiOrderItemInstance?.unitPrice}">
				<li class="fieldcontain">
					<span id="unitPrice-label" class="property-label"><g:message code="oiOrderItem.unitPrice.label" default="Unit Price" /></span>
					
						<span class="property-value" aria-labelledby="unitPrice-label"><g:fieldValue bean="${oiOrderItemInstance}" field="unitPrice"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${oiOrderItemInstance?.id}" />
					<g:link class="edit" action="edit" id="${oiOrderItemInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

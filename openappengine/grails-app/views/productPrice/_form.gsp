<%@ page import="com.openappengine.model.product.ProdProductPrice" %>

<g:hiddenField name="prodProduct.pdProductId" value="pdProductId" />

<div class="fieldcontain ${hasErrors(bean: prodProductPriceInstance, field: 'ppFromDate', 'error')} ">
	<label for="ppFromDate">
		<g:message code="prodProductPrice.ppFromDate.label" default="From Date" />
		
	</label>
	<g:datePicker name="ppFromDate" precision="day" value="${prodProductPriceInstance?.ppFromDate}" />
</div>

<div class="fieldcontain ${hasErrors(bean: prodProductPriceInstance, field: 'ppToDate', 'error')} ">
	<label for="ppToDate">
		<g:message code="prodProductPrice.ppToDate.label" default="To Date" />
		
	</label>
	<g:datePicker name="ppToDate" precision="day" value="${prodProductPriceInstance?.ppToDate}" />
</div>

<div class="fieldcontain ${hasErrors(bean: prodProductPriceInstance, field: 'ppPrice', 'error')} ">
	<label for="ppPrice">
		<g:message code="prodProductPrice.ppPrice.label" default="Price" />
		
	</label>
	<g:field type="number" name="ppPrice" value="${fieldValue(bean: prodProductPriceInstance, field: 'ppPrice')}" />
</div>
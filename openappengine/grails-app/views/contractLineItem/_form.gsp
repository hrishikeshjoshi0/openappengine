<%@ page import="com.openappengine.model.contract.ContractLineItem" %>

<g:hiddenField name="contract.contractId" value="${contractLineItemInstance?.contract?.contractId}" />

<div class="fieldcontain ${hasErrors(bean: contractLineItemInstance, field: 'product', 'error')} ">
	<label for="product">
		<g:message code="contractLineItem.product.label" default="Product" />
	</label>
	<g:select name="product.pdProductId" from="${com.openappengine.model.product.Product.list()}" noSelection="['':'']"
			optionKey="pdProductId" optionValue="pdProductName" required="true" value="${contractLineItemInstance?.product?.pdProductId}"
			onchange="${remoteFunction(action:'ajaxGetProductPrice',params:'\'id=\' + escape(this.value)', 
            			onSuccess:'$("input#selectedAmouunt").val(data);')}" 
			class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractLineItemInstance, field: 'fromDate', 'error')} ">
	<label for="fromDate">
		<g:message code="contract.fromDate.label" default="From Date" />
		
	</label>
	<g:datePicker name="fromDate" value="${contractLineItemInstance?.fromDate}" precision="day" />
</div>

<div class="fieldcontain ${hasErrors(bean: contractLineItemInstance, field: 'toDate', 'error')} ">
	<label for="toDate">
		<g:message code="contract.toDate.label" default="To Date" />
		
	</label>
	<g:datePicker name="toDate" value="${contractLineItemInstance?.toDate}" precision="day" />
</div>

<div class="fieldcontain ${hasErrors(bean: contractLineItemInstance, field: 'quantity', 'error')} ">
	<label for="quantity">
		<g:message code="contractLineItem.quantity.label" default="Quantity" />
	</label>
	<g:field type="number" name="quantity" value="${fieldValue(bean: contractLineItemInstance, field: 'quantity')}" />
</div>

<!--  TODO populate amount onchange from Product Prices -->
<div class="fieldcontain">
	<label for="selectedAmouunt">
		<g:message code="contractLineItem.selectedAmouunt.label" default="Price" />
	</label>
	<g:field type="number" name="selectedAmouunt" value="${params.price}" readonly="readonly" />
</div>
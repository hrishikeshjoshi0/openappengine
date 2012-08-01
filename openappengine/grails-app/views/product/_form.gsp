<%@page import="com.openappengine.master.ProductType"%>
<%@ page import="com.openappengine.model.product.Product"%>

<div
	class="fieldcontain ${hasErrors(bean: productInstance, field: 'pdProductName', 'error')} ">
	<label for="pdProductName"> <g:message
			code="product.pdProductName.label" default="Product Name" />
	</label>
	<g:textField name="pdProductName"
		value="${productInstance?.pdProductName}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: productInstance, field: 'pdInternalName', 'error')} ">
	<label for="pdInternalName"> <g:message
			code="product.pdInternalName.label" default="Internal Name" />
	</label>
	<g:textField name="pdInternalName"
		value="${productInstance?.pdInternalName}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: productInstance, field: 'pdIntroductionDate', 'error')} ">
	<label for="pdIntroductionDate"> <g:message
			code="product.pdIntroductionDate.label"
			default="Introduction Date" />
	</label>
	<g:jqDatePicker name="pdIntroductionDate" value="${productInstance?.pdIntroductionDate}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: productInstance, field: 'pdProductType', 'error')} ">
	<label for="pdProductType"> <g:message
			code="product.pdProductType.label" default="Product Type" />
	</label>
	<g:select name="pdProductType" from="${ProductType?.values()}"
		value="${personInstance?.pdProductType}" optionKey="key" />	
</div>

<div
	class="fieldcontain ${hasErrors(bean: productInstance, field: 'pdTaxable', 'error')} ">
	<label for="pdTaxable"> <g:message
			code="product.pdTaxable.label" default="Taxable" />
	</label>
	<g:checkBox name="pdTaxable" value="${productInstance?.pdTaxable}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: productInstance, field: 'pdDescription', 'error')} ">
	<label for="pdDescription"> <g:message
			code="product.pdDescription.label" default="Pd Description" />
	</label>
	<g:textField name="pdDescription"
		value="${productInstance?.pdDescription}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: productInstance, field: 'pdIsVirtual', 'error')} ">
	<label for="pdIsVirtual"> <g:message
			code="product.pdIsVirtual.label" default="Is Virtual" />
	</label>
	<g:checkBox name="pdIsVirtual" value="${productInstance?.pdIsVirtual}" />
</div>

<div
	class="fieldcontain">
	<label for="initPrice"> <g:message
			code="product.pdDescription.label" default="Price" />
	</label>
	<g:textField name="initPrice"
		value="${params.initPrice}" />
</div>

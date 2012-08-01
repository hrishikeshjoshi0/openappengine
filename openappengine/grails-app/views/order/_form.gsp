<%@ page import="com.openappengine.model.fm.OhOrderHeader" %>

<div class="fieldcontain ${hasErrors(bean: ohOrderHeaderInstance, field: 'externalId', 'error')} ">
	<label for="externalId">
		<g:message code="ohOrderHeader.externalId.label" default="External Id" />
		
	</label>
	<g:textField name="externalId" value="${ohOrderHeaderInstance?.externalId}" readonly="readonly"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ohOrderHeaderInstance, field: 'orderName', 'error')} ">
	<label for="orderName">
		<g:message code="ohOrderHeader.orderName.label" default="Order Name" />
		
	</label>
	<g:textField name="orderName" value="${ohOrderHeaderInstance?.orderName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ohOrderHeaderInstance, field: 'orderType', 'error')} ">
	<label for="orderType">
		<g:message code="ohOrderHeader.orderType.label" default="Order Type" />
		
	</label>
	<g:textField name="orderType" value="${ohOrderHeaderInstance?.orderType}" readonly="readonly"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ohOrderHeaderInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="ohOrderHeader.status.label" default="Status" />
		
	</label>
	<g:textField name="status" value="${ohOrderHeaderInstance?.status}" readonly="readonly"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ohOrderHeaderInstance, field: 'contractNumber', 'error')} ">
	<label for="contractNumber">
		<g:message code="ohOrderHeader.contractNumber.label" default="Contract Number" />
		
	</label>
	<g:textField name="contractNumber" value="${ohOrderHeaderInstance?.contractNumber}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ohOrderHeaderInstance, field: 'billingAccountId', 'error')} ">
	<label for="billingAccountId">
		<g:message code="ohOrderHeader.billingAccountId.label" default="Billing Account Id" />
		
	</label>
	<g:textField name="billingAccountId" value="${ohOrderHeaderInstance?.billingAccountId}" />
	<a id="addParty" href="#" style="width: 12px;height: 12px;text-decoration: none;" title="Party">
		<img src="${resource(dir: 'images/icons', file: 'party_icon.png')}" alt="Add Party" title="Add Party" style="width: 16px;height: 16px;"/>
	</a>
</div>

<div class="fieldcontain ${hasErrors(bean: ohOrderHeaderInstance, field: 'grandTotal', 'error')} ">
	<label for="grandTotal">
		<g:message code="ohOrderHeader.grandTotal.label" default="Grand Total" />
		
	</label>
	<g:field type="number" name="grandTotal" value="${fieldValue(bean: ohOrderHeaderInstance, field: 'grandTotal')}" readonly="readonly"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ohOrderHeaderInstance, field: 'orderDate', 'error')} ">
	<label for="orderDate">
		<g:message code="ohOrderHeader.orderDate.label" default="Order Date" />
		
	</label>
	<g:datePicker name="orderDate" precision="day" value="${ohOrderHeaderInstance?.orderDate}" />
</div>
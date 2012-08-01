<%@ page import="com.openappengine.model.fm.FmPayment" %>

<div class="fieldcontain ${hasErrors(bean: fmPaymentInstance, field: 'amount', 'error')} ">
	<label for="amount">
		<g:message code="fmPayment.amount.label" default="Amount" />
		
	</label>
	<g:field type="number" name="amount" value="${fieldValue(bean: fmPaymentInstance, field: 'amount')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: fmPaymentInstance, field: 'billingAccountId', 'error')} ">
	<label for="billingAccountId">
		<g:message code="fmPayment.billingAccountId.label" default="Billing Account Id" />
		
	</label>
	<g:textField name="billingAccountId" value="${fmPaymentInstance?.billingAccountId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: fmPaymentInstance, field: 'contractExternalId', 'error')} ">
	<label for="contractExternalId">
		<g:message code="fmPayment.contractExternalId.label" default="Contract External Id" />
		
	</label>
	<g:textField name="contractExternalId" value="${fmPaymentInstance?.contractExternalId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: fmPaymentInstance, field: 'currencyUom', 'error')} ">
	<label for="currencyUom">
		<g:message code="fmPayment.currencyUom.label" default="Currency Uom" />
		
	</label>
	<g:textField name="currencyUom" value="${fmPaymentInstance?.currencyUom}" />
</div>

<div class="fieldcontain ${hasErrors(bean: fmPaymentInstance, field: 'effectiveDate', 'error')} ">
	<label for="effectiveDate">
		<g:message code="fmPayment.effectiveDate.label" default="Effective Date" />
		
	</label>
	<g:datePicker name="effectiveDate" precision="day" value="${fmPaymentInstance?.effectiveDate}" />
</div>

<div class="fieldcontain ${hasErrors(bean: fmPaymentInstance, field: 'orderNumber', 'error')} ">
	<label for="orderNumber">
		<g:message code="fmPayment.orderNumber.label" default="Order Number" />
		
	</label>
	<g:textField name="orderNumber" value="${fmPaymentInstance?.orderNumber}" />
</div>

<div class="fieldcontain ${hasErrors(bean: fmPaymentInstance, field: 'partyExternalIdFrom', 'error')} ">
	<label for="partyExternalIdFrom">
		<g:message code="fmPayment.partyExternalIdFrom.label" default="Party External Id From" />
		
	</label>
	<g:textField name="partyExternalIdFrom" value="${fmPaymentInstance?.partyExternalIdFrom}" />
</div>

<div class="fieldcontain ${hasErrors(bean: fmPaymentInstance, field: 'partyExternalIdTo', 'error')} ">
	<label for="partyExternalIdTo">
		<g:message code="fmPayment.partyExternalIdTo.label" default="Party External Id To" />
		
	</label>
	<g:textField name="partyExternalIdTo" value="${fmPaymentInstance?.partyExternalIdTo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: fmPaymentInstance, field: 'paymentMethod', 'error')} ">
	<label for="paymentMethod">
		<g:message code="fmPayment.paymentMethod.label" default="Payment Method" />
		
	</label>
	<g:textField name="paymentMethod" value="${fmPaymentInstance?.paymentMethod}" />
</div>

<div class="fieldcontain ${hasErrors(bean: fmPaymentInstance, field: 'paymentNumber', 'error')} ">
	<label for="paymentNumber">
		<g:message code="fmPayment.paymentNumber.label" default="Payment Number" />
		
	</label>
	<g:textField name="paymentNumber" value="${fmPaymentInstance?.paymentNumber}" />
</div>

<div class="fieldcontain ${hasErrors(bean: fmPaymentInstance, field: 'paymentType', 'error')} ">
	<label for="paymentType">
		<g:message code="fmPayment.paymentType.label" default="Payment Type" />
		
	</label>
	<g:textField name="paymentType" value="${fmPaymentInstance?.paymentType}" />
</div>

<div class="fieldcontain ${hasErrors(bean: fmPaymentInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="fmPayment.status.label" default="Status" />
		
	</label>
	<g:textField name="status" value="${fmPaymentInstance?.status}" />
</div>

<div class="fieldcontain ${hasErrors(bean: fmPaymentInstance, field: 'transactionId', 'error')} ">
	<label for="transactionId">
		<g:message code="fmPayment.transactionId.label" default="Transaction Id" />
		
	</label>
	<g:textField name="transactionId" value="${fmPaymentInstance?.transactionId}" />
</div>


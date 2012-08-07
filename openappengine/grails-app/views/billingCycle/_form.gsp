<%@ page import="com.openappengine.model.billing.BillingCycle" %>
<table>
	<tr>
		<td>
			<g:message code="billingCycle.fromDate.label" default="From Date" />
		</td>
		<td>
			<g:datePicker name="fromDate" precision="day" value="${billingCycleInstance?.fromDate}" />
		</td>
	</tr>
	<tr>
		<td>
			<g:message code="billingCycle.toDate.label" default="To Date" />
		</td>
		<td>
			<g:datePicker name="toDate" precision="day" value="${billingCycleInstance?.toDate}" />
		</td>
	</tr>
	<tr>
		<td>
			<g:message code="billingCycle.name.label" default="Name" />
		</td>
		<td>
			<g:textField name="name" value="${billingCycleInstance?.name}" />
		</td>
	</tr>
</table>






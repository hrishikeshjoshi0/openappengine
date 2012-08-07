
<%@ page import="com.openappengine.model.batch.BulkPaymentUpload" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bulkPaymentUpload.label', default: 'BulkPaymentUpload')}" />
		<title>
			Start Payment Batch Run
		</title>
	</head>
	<body>
		<div id="show-bulkPaymentUpload" class="content scaffold-show" role="main">
			<h1>
				Start Payment Batch Run 
			</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<g:if test="${billingCycles.isEmpty()}">
				No Billing Cycle Waiting for Payments
			</g:if>
			<g:else>
				<table style="width: 40%;">
					<g:form controller="bulkPaymentUpload">
						<tr>
							<td><label>Status</label></td>
							<td>
								<g:fieldValue bean="${bulkPaymentUploadInstance}" field="status"/>
							</td>
						</tr>
						<tr>
							<td><label>Uploaded Timestamp</label></td>
							<td>
								<g:formatDate date="${bulkPaymentUploadInstance?.uploadTimestamp}"/>
							</td>
						</tr>
						<tr>
							<td><label>Select Billing Cycle </label></td>
							<td><g:hiddenField name="id"
									value="${bulkPaymentUploadInstance?.bulkPaymentUploadId}" /> <g:select
									name="billingCycleId" from="${billingCycles}" optionValue="name"
									optionKey="name" /></td>
						</tr>
						<tr>
							<td><g:actionSubmit value="Start Batch"
									action="uploadBulkPayments" /></td>
						</tr>
					</g:form>
				</table>
			</g:else>
		</div>
	</body>
</html>
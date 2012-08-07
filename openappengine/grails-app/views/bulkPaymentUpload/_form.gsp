<%@ page import="com.openappengine.model.batch.BulkPaymentUpload" %>
<div class="fieldcontain ${hasErrors(bean: bulkPaymentUploadInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="bulkPaymentUpload.status.label" default="Status" />
		
	</label>
	<g:textField name="status" value="${bulkPaymentUploadInstance?.status}" />
</div>

<div class="fieldcontain ${hasErrors(bean: bulkPaymentUploadInstance, field: 'uploadTimestamp', 'error')} ">
	<label for="uploadTimestamp">
		<g:message code="bulkPaymentUpload.uploadTimestamp.label" default="Upload Timestamp" />
		
	</label>
	<g:datePicker name="uploadTimestamp" precision="day" value="${bulkPaymentUploadInstance?.uploadTimestamp}" />
</div>


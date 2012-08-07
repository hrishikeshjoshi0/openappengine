
<%@ page import="com.openappengine.model.batch.BulkPaymentUpload" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bulkPaymentUpload.label', default: 'BulkPaymentUpload')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-bulkPaymentUpload" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<ol class="property-list bulkPaymentUpload">
			
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="bulkPaymentUpload.status.label" default="Status" /></span>
					<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${bulkPaymentUploadInstance}" field="status"/></span>
				</li>
				
				<li class="fieldcontain">
					<span id="uploadTimestamp-label" class="property-label"><g:message code="bulkPaymentUpload.uploadTimestamp.label" default="Upload Timestamp" /></span>
					<span class="property-value" aria-labelledby="uploadTimestamp-label">
						<g:formatDate date="${bulkPaymentUploadInstance?.uploadTimestamp}"/>
					</span>
				</li>
			</ol>
			
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bulkPaymentUploadInstance?.bulkPaymentUploadId}" />
					<g:select name="billingCycle" from="${billingCycles}" optionValue=""/>
					<g:link controller="bulkPaymentUpload" action="uploadBulkPayments" id="${bulkPaymentUploadInstance?.bulkPaymentUploadId}">
						Start Batch
					</g:link>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

<%@ page import="com.openappengine.model.batch.BulkPaymentUpload" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bulkPaymentUpload.label', default: 'BulkPaymentUpload')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bulkPaymentUpload" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bulkPaymentUpload" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bulkPaymentUpload">
			
				<g:if test="${bulkPaymentUploadInstance?.bulkPaymentUploadId}">
				<li class="fieldcontain">
					<span id="bulkPaymentUploadId-label" class="property-label"><g:message code="bulkPaymentUpload.bulkPaymentUploadId.label" default="Bulk Payment Upload Id" /></span>
					
						<span class="property-value" aria-labelledby="bulkPaymentUploadId-label"><g:fieldValue bean="${bulkPaymentUploadInstance}" field="bulkPaymentUploadId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bulkPaymentUploadInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="bulkPaymentUpload.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${bulkPaymentUploadInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bulkPaymentUploadInstance?.uploadItems}">
				<li class="fieldcontain">
					<span id="uploadItems-label" class="property-label"><g:message code="bulkPaymentUpload.uploadItems.label" default="Upload Items" /></span>
					
						<g:each in="${bulkPaymentUploadInstance.uploadItems}" var="u">
						<span class="property-value" aria-labelledby="uploadItems-label"><g:link controller="bulkPaymentUploadItem" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${bulkPaymentUploadInstance?.uploadTimestamp}">
				<li class="fieldcontain">
					<span id="uploadTimestamp-label" class="property-label"><g:message code="bulkPaymentUpload.uploadTimestamp.label" default="Upload Timestamp" /></span>
					
						<span class="property-value" aria-labelledby="uploadTimestamp-label"><g:formatDate date="${bulkPaymentUploadInstance?.uploadTimestamp}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bulkPaymentUploadInstance?.id}" />
					<g:link class="edit" action="edit" id="${bulkPaymentUploadInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

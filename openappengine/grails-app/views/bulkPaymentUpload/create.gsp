<%@ page import="com.openappengine.model.batch.BulkPaymentUpload" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bulkPaymentUpload.label', default: 'BulkPaymentUpload')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="create-bulkPaymentUpload" class="content scaffold-create" role="main">
			<h1>
				Uploaded Batch
			</h1>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

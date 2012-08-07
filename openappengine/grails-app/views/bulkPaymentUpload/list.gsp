
<%@ page import="com.openappengine.model.batch.BulkPaymentUpload" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bulkPaymentUpload.label', default: 'BulkPaymentUpload')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-bulkPaymentUpload" class="content scaffold-list" role="main">
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="bulkPaymentUploadId" title="${message(code: 'bulkPaymentUpload.bulkPaymentUploadId.label', default: 'Upload Id')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'bulkPaymentUpload.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="uploadTimestamp" title="${message(code: 'bulkPaymentUpload.uploadTimestamp.label', default: 'Upload Timestamp')}" />
						
						<th/>
					</tr>
				</thead>
				<tbody>
				<g:each in="${bulkPaymentUploadInstanceList}" status="i" var="bulkPaymentUploadInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bulkPaymentUploadInstance.bulkPaymentUploadId}">${fieldValue(bean: bulkPaymentUploadInstance, field: "bulkPaymentUploadId")}</g:link></td>
					
						<td>${fieldValue(bean: bulkPaymentUploadInstance, field: "status")}</td>
					
						<td><g:formatDate date="${bulkPaymentUploadInstance.uploadTimestamp}" /></td>
					
						<td>
							<g:link action="showBatchForm" id="${bulkPaymentUploadInstance.bulkPaymentUploadId}">
								Start Batch
							</g:link>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bulkPaymentUploadInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

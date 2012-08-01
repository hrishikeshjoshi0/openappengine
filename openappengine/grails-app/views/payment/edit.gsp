<%@ page import="com.openappengine.model.fm.FmPayment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fmPayment.label', default: 'FmPayment')}" />
		<title>
			Payment | Edit Payment
		</title>
	</head>
	<body>
		<div id="edit-fmPayment" class="content scaffold-edit" role="main">
			<g:hasErrors bean="${fmPaymentInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${fmPaymentInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${fmPaymentInstance?.paymentId}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

<%@ page import="com.openappengine.model.fm.FmPayment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fmPayment.label', default: 'FmPayment')}" />
		<title>
			Payment | Create New Payment
		</title>
	</head>
	<body>
		<div id="create-fmPayment" class="content scaffold-create" role="main">
			<g:hasErrors bean="${fmPaymentInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${fmPaymentInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
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

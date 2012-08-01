<%@ page import="com.openappengine.model.party.Party" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'party.label', default: 'Party')}" />
		<title>
			Party | Create New Party
		</title>
	</head>
	<body>
		<div id="create-party" class="content scaffold-create" role="main">
			<g:hasErrors bean="${partyInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${partyInstance}" var="error">
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

<%@ page import="com.openappengine.model.party.Person" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title>
			Party | Create New Party
		</title>
	</head>
	<body>
		<a href="#create-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="create-person" class="content scaffold-create" role="main">
			<g:hasErrors bean="${personInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${personInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
			    <fieldset class="form">
					<g:render template="tabbedForm"/>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

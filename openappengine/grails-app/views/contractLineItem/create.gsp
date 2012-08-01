<%@ page import="com.openappengine.model.contract.ContractLineItem" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contractLineItem.label', default: 'ContractLineItem')}" />
		<title>
			Contract | Contract# ${contractLineItemInstance?.contract?.contractNumber } | Add Contract Line Item
		</title>
	</head>
	<body>
		<div id="create-contractLineItem" class="content scaffold-create" role="main">
			<g:hasErrors bean="${contractLineItemInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${contractLineItemInstance}" var="error">
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

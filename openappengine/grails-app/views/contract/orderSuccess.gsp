<%@ page import="com.openappengine.model.contract.Contract" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}" />
		<title>
			Contract | Order created from Contracts
		</title>
	</head>
	
	<body>
		<div id="order-success" class="content scaffold-create" role="main">
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
		</div>
	</body>
</html>

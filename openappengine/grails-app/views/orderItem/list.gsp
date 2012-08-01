
<%@ page import="com.openappengine.model.fm.OiOrderItem" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'oiOrderItem.label', default: 'OiOrderItem')}" />
		<title>
			Order | Search Orders
		</title>
	</head>
	<body>
		<a href="#list-oiOrderItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-oiOrderItem" class="content scaffold-list" role="main">
			<table class="hor-minimalist">
				<thead>
					<tr>
					
						<g:sortableColumn property="orderItemId" title="${message(code: 'oiOrderItem.orderItemId.label', default: 'Order Item Id')}" />
					
						<g:sortableColumn property="cancelQuantity" title="${message(code: 'oiOrderItem.cancelQuantity.label', default: 'Cancel Quantity')}" />
					
						<g:sortableColumn property="comments" title="${message(code: 'oiOrderItem.comments.label', default: 'Comments')}" />
					
						<g:sortableColumn property="externalId" title="${message(code: 'oiOrderItem.externalId.label', default: 'External Id')}" />
					
						<g:sortableColumn property="itemDescription" title="${message(code: 'oiOrderItem.itemDescription.label', default: 'Item Description')}" />
					
						<g:sortableColumn property="lineTotalPrice" title="${message(code: 'oiOrderItem.lineTotalPrice.label', default: 'Line Total Price')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${oiOrderItemInstanceList}" status="i" var="oiOrderItemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${oiOrderItemInstance.id}">${fieldValue(bean: oiOrderItemInstance, field: "orderItemId")}</g:link></td>
					
						<td>${fieldValue(bean: oiOrderItemInstance, field: "cancelQuantity")}</td>
					
						<td>${fieldValue(bean: oiOrderItemInstance, field: "comments")}</td>
					
						<td>${fieldValue(bean: oiOrderItemInstance, field: "externalId")}</td>
					
						<td>${fieldValue(bean: oiOrderItemInstance, field: "itemDescription")}</td>
					
						<td>${fieldValue(bean: oiOrderItemInstance, field: "lineTotalPrice")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${oiOrderItemInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

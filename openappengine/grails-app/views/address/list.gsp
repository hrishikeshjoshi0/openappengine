
<%@ page import="com.openappengine.model.party.Address" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
		<title>
			Address Book
		</title>
	</head>
	<body>
		<div id="list-address" class="hor-minimalist content scaffold-list" role="main">
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="addressBookId" title="${message(code: 'address.addressBookId.label', default: 'Address Book Id')}" />
					
						<g:sortableColumn property="address1" title="${message(code: 'address.address1.label', default: 'Address1')}" />
					
						<g:sortableColumn property="address2" title="${message(code: 'address.address2.label', default: 'Address2')}" />
					
						<g:sortableColumn property="attnName" title="${message(code: 'address.attnName.label', default: 'Attn Name')}" />
					
						<g:sortableColumn property="city" title="${message(code: 'address.city.label', default: 'City')}" />
					
						<g:sortableColumn property="country" title="${message(code: 'address.country.label', default: 'Country')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${addressInstanceList}" status="i" var="addressInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${addressInstance.id}">${fieldValue(bean: addressInstance, field: "addressBookId")}</g:link></td>
					
						<td>${fieldValue(bean: addressInstance, field: "address1")}</td>
					
						<td>${fieldValue(bean: addressInstance, field: "address2")}</td>
					
						<td>${fieldValue(bean: addressInstance, field: "attnName")}</td>
					
						<td>${fieldValue(bean: addressInstance, field: "city")}</td>
					
						<td>${fieldValue(bean: addressInstance, field: "country")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${addressInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

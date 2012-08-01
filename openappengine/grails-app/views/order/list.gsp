
<%@ page import="com.openappengine.model.fm.OhOrderHeader" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ohOrderHeader.label', default: 'OhOrderHeader')}" />
		<title>
			Order | Search Orders
		</title>
	</head>
	<body>
		
		<g:render template="search"></g:render>	
		
		<div style="height: 400px;overflow: scroll;">
		<div id="list-ohOrderHeader" class="content scaffold-list" role="main" style="height: 400px;overflow: ">
			<table class="hor-minimalist">
				<thead>
					<tr>
						<g:sortableColumn property="billingAccountId" title="${message(code: 'ohOrderHeader.billingAccountId.label', default: 'Billing Account Id')}" />
					
						<g:sortableColumn property="contractNumber" title="${message(code: 'ohOrderHeader.contractNumber.label', default: 'Contract Number')}" />
					
						<g:sortableColumn property="currencyUom" title="${message(code: 'ohOrderHeader.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="entryDate" title="${message(code: 'ohOrderHeader.entryDate.label', default: 'Entry Date')}" />
					
						<g:sortableColumn property="externalId" title="${message(code: 'ohOrderHeader.externalId.label', default: 'External Id')}" />
					
						<th>View</th>
						
						<th>Cancel</th>
						
						<th>Complete</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${ohOrderHeaderInstanceList}" status="i" var="ohOrderHeaderInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: ohOrderHeaderInstance, field: "billingAccountId")}</td>
					
						<td>${fieldValue(bean: ohOrderHeaderInstance, field: "contractNumber")}</td>
					
						<td>${fieldValue(bean: ohOrderHeaderInstance, field: "status")}</td>
					
						<td><g:formatDate date="${ohOrderHeaderInstance.entryDate}" format="dd.MM.yyyy" /></td>
					
						<td>${fieldValue(bean: ohOrderHeaderInstance, field: "externalId")}</td>
						
						<td>
							<g:link action="show" class="view_details"
								id="${ohOrderHeaderInstance.orderId}">
								<img src="${resource(dir: 'images/skin/icons', file: 'application_view_detail.png')}"
									alt="View Details" class="icon" />
							</g:link>
						</td>
						
						<td>
							<g:if test="${ohOrderHeaderInstance.status == 'INVOICED' || ohOrderHeaderInstance.status == 'NEW'}">
								<g:link action="cancel" class="view_details"
									id="${ohOrderHeaderInstance.orderId}">
									<img src="${resource(dir: 'images/skin/icons', file: 'application_delete.png')}"
										title="Cancel Order"
										alt="Cancel Order" class="icon" />
								</g:link>
							</g:if>
						</td>
						
						<td>
							<g:if test="${ohOrderHeaderInstance.status == 'INVOICED'}">
								<g:link action="complete" class="view_details"
									id="${ohOrderHeaderInstance.orderId}">
									<img src="${resource(dir: 'images/skin/icons', file: 'application_complete.png')}"
										title="Complete Order"
										alt="Complete Order" class="icon" />
								</g:link>
							</g:if>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ohOrderHeaderInstanceTotal}" />
			</div>
		</div>
		</div>
	</body>
</html>

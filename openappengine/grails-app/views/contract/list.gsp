
<%@ page import="com.openappengine.model.contract.Contract" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}" />
		<title>
			Contract | Search Contracts
		</title>
	</head>
	<body>
			<div>
				<g:formRemote name="searchForm" on404="alert('not found!')" update="list-contract"
		              url="[action:'filter']" class="search-form">
		            <table style="width:auto;">
		            	<thead>
							<tr>
								<th colspan="6">
										Contract Search
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Contract Number:</td>
								<td><input id="contractNumber" name="contractNumber" type="text" /></td>
			
							</tr>
							<tr>
			            		<td colspan="6">
			            			<input type="submit" value="Search" />			
			            		</td>
			            	</tr>
						</tbody>
		            </table>  
				</g:formRemote>
			</div>
			
			<div id="list-contract" class="hor-minimalist content scaffold-list" role="main">
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="contractNumber" title="${message(code: 'contract.contractNumber.label', default: 'Contract Number')}" />
					
						<g:sortableColumn property="fromDate" title="${message(code: 'contract.fromDate.label', default: 'From Date')}" />
						
						<g:sortableColumn property="toDate" title="${message(code: 'contract.toDate.label', default: 'To Date')}" />
					
						<g:sortableColumn property="partyId" title="${message(code: 'contract.party.label', default: 'Party')}" />
						
						<g:sortableColumn property="active" title="${message(code: 'contract.active.label', default: 'Active')}" />
						
						<th>View </th>
						<th>Terminate</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${contractInstanceList}" status="i" var="contractInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: contractInstance, field: "contractNumber")}</td>
					
						<td><g:formatDate date="${contractInstance.fromDate}" format="yyyy-MM-dd"/></td>
						
						<td><g:formatDate date="${contractInstance.toDate}" format="yyyy-MM-dd"/></td>
					
						<td>
							<g:set var="party" value="${com.openappengine.model.party.Party.findByExternalId(contractInstance.partyId)}" />
							${party?.externalId + " - " + party?.firstName + " " + party?.lastName}
						</td>
						
						<td>
							<g:formatBoolean boolean="${contractInstance.active}" true="Yes" false="No"/>
						</td>
					
						<td>
							<g:link action="show" id="${contractInstance.contractId}">
								<img src="${resource(dir: 'images/skin/icons', file: 'application_view_detail.png')}"
									title="View Details" alt="View Details" class="icon" />
							</g:link>
						</td>
						
						<td>	
							<g:if test="${contractInstance.active}">
								<g:link action="terminate" id="${contractInstance.contractId}">
									<img src="${resource(dir: 'images/skin/icons', file: 'application_delete.png')}"
										title="Terminate"
										alt="Terminate" class="icon" />
								</g:link>
							</g:if>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contractInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

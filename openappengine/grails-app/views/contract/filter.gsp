<div id="list-contract" class="content scaffold-list" role="main">
			<table class="hor-minimalist">
				<thead>
					<tr>
						<g:sortableColumn property="contractNumber" title="${message(code: 'contract.contractNumber.label', default: 'Contract Number')}" />
					
						<g:sortableColumn property="fromDate" title="${message(code: 'contract.fromDate.label', default: 'From Date')}" />
						
						<g:sortableColumn property="toDate" title="${message(code: 'contract.toDate.label', default: 'To Date')}" />
					
						<g:sortableColumn property="orderRecurrence" title="${message(code: 'contract.orderRecurrence.label', default: 'Order Recurrence')}" />
					
						<g:sortableColumn property="partyId" title="${message(code: 'contract.party.label', default: 'Party')}" />
						
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
					
						<td>${fieldValue(bean: contractInstance, field: "orderRecurrence")}</td>
					
						<td>
							<g:set var="party" value="${com.openappengine.model.party.Party.findByExternalId(contractInstance.partyId)}" />
							${party?.externalId + " - " + party?.firstName + " " + party?.lastName}
						</td>
					
						<td>
							<g:link action="show" id="${contractInstance.contractId}">
								<img src="${resource(dir: 'images/skin/icons', file: 'application_view_detail.png')}"
									title="View Details" alt="View Details" class="icon" />
							</g:link>
						</td>
						
						<td>	
							<g:link action="terminate" id="${contractInstance.contractId}">
								<img src="${resource(dir: 'images/skin/icons', file: 'application_delete.png')}"
									title="Terminate"
									alt="Terminate" class="icon" />
							</g:link>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contractInstanceTotal}" />
			</div>
		</div>
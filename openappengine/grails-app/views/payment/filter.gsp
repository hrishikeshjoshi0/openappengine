<div id="list-fmPayment" class="content scaffold-list" role="main">
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="billingAccountId" title="${message(code: 'fmPayment.billingAccountId.label', default: 'Billing Account Id')}" />
						
						<g:sortableColumn property="amount" title="${message(code: 'fmPayment.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="contractExternalId" title="${message(code: 'fmPayment.contractExternalId.label', default: 'Contract External Id')}" />
						
						<g:sortableColumn property="contractExternalId" title="${message(code: 'fmPayment.orderNumber.label', default: 'Order Number')}" />
					
						<g:sortableColumn property="currencyUom" title="${message(code: 'fmPayment.currencyUom.label', default: 'Currency Uom')}" />
					
						<g:sortableColumn property="effectiveDate" title="${message(code: 'fmPayment.effectiveDate.label', default: 'Effective Date')}" />
					
						<th>View</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${fmPaymentInstanceList}" status="i" var="fmPaymentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: fmPaymentInstance, field: "billingAccountId")}</td>
						
						<td>${fieldValue(bean: fmPaymentInstance, field: "amount")}</td>
					
						<td>${fieldValue(bean: fmPaymentInstance, field: "contractExternalId")}</td>
						
						<td>${fieldValue(bean: fmPaymentInstance, field: "orderNumber")}</td>
					
						<td>${fieldValue(bean: fmPaymentInstance, field: "currencyUom")}</td>
					
						<td><g:formatDate date="${fmPaymentInstance.effectiveDate}" /></td>
					
						<td>
							<g:link action="show" class="view_details"
								id="${fmPaymentInstance.paymentId}">
								<img src="${resource(dir: 'images/skin/icons', file: 'application_view_detail.png')}"
									alt="View Details" class="icon" />
							</g:link>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${fmPaymentInstanceTotal}" />
			</div>
		</div>
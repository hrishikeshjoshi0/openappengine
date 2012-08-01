<%@page import="com.openappengine.master.OrderStatus"%>
<%@ page import="com.openappengine.model.fm.OhOrderHeader" %>

<div id="list-ohOrderHeader" class="content scaffold-list" role="main">
			<h1>
				Order Summary
			</h1>
			<div id="summary">
				<table class="hor-minimalist">
					<thead>
						<tr>
							<th>Status</th>
							<th>Order Items Total</th>
							<th>Tax</th>
							<th>Grand Total</th>
						</tr>
					</thead>
					<tbody>
						<% 
							OrderStatus.values()?.each { orderStat ->
					
								BigDecimal lit = new BigDecimal("0.0")
								BigDecimal tax = new BigDecimal("0.0")
								BigDecimal grtot = new BigDecimal("0.0")
					
								ohOrderHeaderInstanceList?.each { order ->
									if(orderStat.getKey().equals(order.status)) {
										lit = lit.add(order.getOrderItemTotalUnitPrice())
										tax = tax.add(order.getOrderItemTotalTaxPrice())
										grtot = grtot.add(order.grandTotal)
									}
								}
					
								out.print "<tr>"
								out.print "<td>" + orderStat.getKey() + "</td>"
								out.print "<td>" + lit + "</td>"
								out.print "<td>" + tax + "</td>"
								out.print "<td>" + grtot + "</td>"
								out.print "</tr>"
							}
						 %>
					</tbody>
				</table>
			</div>	
			
			<br/>	
			
			<h1>
				Detail
			</h1>
			
			<div style="height: 400px;overflow: scroll;">
			<table class="hor-minimalist">
				<thead>
					<tr>
						<g:sortableColumn property="externalId" title="${message(code: 'ohOrderHeader.externalId.label', default: 'External Id')}" />
						
						<g:sortableColumn property="billingAccountId" title="${message(code: 'ohOrderHeader.billingAccountId.label', default: 'Billing Account Id')}" />
					
						<g:sortableColumn property="entryDate" title="${message(code: 'ohOrderHeader.entryDate.label', default: 'Entry Date')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'ohOrderHeader.status.label', default: 'Status')}" />
						
						<th class="sortable"><a href="#" >Order Items Total</a></th>
						
						<th class="sortable"><a href="#" >Tax</a></th>
						
						<th class="sortable"><a href="#" >Grand Total</a></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${ohOrderHeaderInstanceList}" status="i" var="ohOrderHeaderInstance">
					<tr>
						<td>${fieldValue(bean: ohOrderHeaderInstance, field: "externalId")}</td>
					
						<td>${fieldValue(bean: ohOrderHeaderInstance, field: "billingAccountId")}</td>
					
						<td><g:formatDate format="yyyy-MM-dd" date="${ohOrderHeaderInstance.entryDate}" /></td>
					
						<td>${fieldValue(bean: ohOrderHeaderInstance, field: "status")}</td>
						
						<td>
							${ohOrderHeaderInstance.getOrderItemTotalUnitPrice() }
						</td>
						
						<td>
							${ohOrderHeaderInstance.getOrderItemTotalTaxPrice() }
						</td>
						
						<td>
							<g:formatNumber number="${ohOrderHeaderInstance.grandTotal}" type="number" maxFractionDigits="2" />
						</td>	
					</tr>
				</g:each>
				</tbody>
			</table>
			</div>
		</div>
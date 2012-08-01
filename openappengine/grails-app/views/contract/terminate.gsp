
<%@ page import="com.openappengine.model.contract.Contract" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}" />
		<title>
			Contract | Terminate Contract# - ${contractInstance?.contractNumber}
		</title>
	</head>
	<body>
		<div id="show-contract" class="content scaffold-show" role="main">
			<h1>Contract# - ${contractInstance?.contractNumber}</h1>
			<g:form action="terminateContract" controller="contract">
			<g:hiddenField name="id" value="${contractInstance?.contractId}" />
			<ol class="property-list contract">
					<li class="fieldcontain">
						<span id="contractNumber-label" class="property-label"><g:message code="contract.contractNumber.label" default="Contract Number" /></span>
						<span class="property-value" aria-labelledby="contractNumber-label"><g:fieldValue bean="${contractInstance}" field="contractNumber"/></span>
					</li>
				
					<li class="fieldcontain">
						<span id="partyId-label" class="property-label"><g:message code="contract.partyId.label" default="Party" /></span>
						<span class="property-value" aria-labelledby="partyId-label">
							<g:set var="party" value="${com.openappengine.model.party.Person.findByExternalId(contractInstance.partyId)}" />
							${party.externalId + " - " + party.firstName + " " + party.lastName}
						</span>
					</li>
			
					<li class="fieldcontain">
						<span id="fromDate-label" class="property-label"><g:message code="contract.fromDate.label" default="From Date" /></span>
						<span class="property-value" aria-labelledby="toDate-label"><g:formatDate format="yyyy-MM-dd" date="${contractInstance?.fromDate}" /></span>
					</li>
				
					<li class="fieldcontain">
						<span id="toDate-label" class="property-label"><g:message code="contract.toDate.label" default="To Date" /></span>
						<span class="property-value" aria-labelledby="fromDate-label">
							<g:jqDatePicker name="toDate" value="${contractInstance?.toDate}" />
						</span>
					</li>
			
					<li class="fieldcontain">
						<span id="orderRecurrence-label" class="property-label"><g:message code="contract.orderRecurrence.label" default="Order Recurrence" /></span>
						<span class="property-value" aria-labelledby="orderRecurrence-label"><g:fieldValue bean="${contractInstance}" field="orderRecurrence"/></span>
					</li>
				
				<br /><br />
				<g:if test="${contractInstance?.lineItems}">
						<span id="lineItems-label"><g:message code="contract.lineItems.label" default="Line Items" /></span>
						
						<table style="width=70%;font: Tahoma;font-size: 12px;">
						<thead>
							<tr>
								<th>No</th>
								<th>Product</th>
								<th>Quantity</th>
								<th>Status</th>
								<th/>
								<th/>
							</tr>
						</thead>
						<tbody>
						<g:each in="${contractInstance.lineItems}" var="l" status="i">
							<tr>
								<td>
									${(i+1)}
								</td>
								<td>
									${l.product?.pdProductName}
								</td>
								<td>
									${l.quantity}
								</td>
								<td>
									${l.status}
								</td>
								<td>
									<g:link controller="contractLineItem" action="show" id="${l.lineItemId}">
										<img src="${resource(dir: 'images/skin/icons', file: 'application_view_detail.png')}"
											alt="View Details" class="icon" />
									</g:link>
								</td>
								<td>	
									<g:if test="${l.active}">
										<g:link action="terminate" controller="contractLineItem" id="${l.lineItemId}">
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
				</g:if>
				</ol>
			
				<fieldset class="buttons">
					<g:submitButton name="terminateContract" value="Terminate Contract"/>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

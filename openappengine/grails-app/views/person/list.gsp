
<%@ page import="com.openappengine.model.party.Person" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title>
			Party | Search Party
		</title>
	</head>
	<body>
		<div>
			<g:formRemote name="searchForm" on404="alert('not found!')" update="list-person"
	              url="[action:'filter']" class="search-form">
	            <table style="width:auto;">
	            	<thead>
						<tr>
							<th colspan="6">
								<h2>
									Person Search
								</h2>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>First Name:</td>
							<td><input id="firstName" name="firstName" type="text" /></td>
		
							<td>Middle Name:</td>
							<td><input id="middleName" name="middleName" type="text" /></td>
		
							<td>Last Name:</td>
							<td><input id="lastName" name="lastName" type="text" /></td>
						</tr>
						<tr>
							<td>External Id:</td>
							<td><input id="externalId" name="externalId" type="text" /></td>
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
		
		<br />
		
		<div id="list-person" class="content scaffold-list" role="main">
			<table id="personSearchResultsTbl" class="hor-minimalist">
				<thead>
					<tr>
						<g:sortableColumn property="firstName" title="${message(code: 'person.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'person.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="externalId" title="${message(code: 'person.externalId.label', default: 'External Id')}" />
					
						<g:sortableColumn property="partyType" title="${message(code: 'person.partyType.label', default: 'Party Type')}" />
					
						<th/>
					</tr>
				</thead>
				<tbody id="listing">
				<g:each in="${personInstanceList}" status="i" var="personInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: personInstance, field: "firstName")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "externalId")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "partyType")}</td>
						
						<td>
							<g:link action="show" class="view_details"
								id="${personInstance.partyId}">
								<img src="${resource(dir: 'images/skin/icons', file: 'application_view_detail.png')}"
									alt="View Details" class="icon" />
							</g:link>
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>

		<ajax:paginate id="paginate" tableId="personSearchResultsTbl"
			url="${createLink(controller:'person',action:'list')}"
			totalRecords="${personInstanceTotal}" style="margin-left:30px;"/>
	</body>
</html>
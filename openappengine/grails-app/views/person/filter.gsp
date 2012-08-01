<div id="list-person" class="content scaffold-list" role="main">
			<table class="hor-minimalist">
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
			<div class="pagination">
				<g:paginate total="${personInstanceTotal}" />
			</div>
		</div>
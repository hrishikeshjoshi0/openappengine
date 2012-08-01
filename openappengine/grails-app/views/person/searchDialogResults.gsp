<script type="text/javascript">
			var $unique = $('input.unique');
			$unique.click(function() {
			    $unique.filter(':checked').not(this).removeAttr('checked');
			});
		</script>
<%@ page import="com.openappengine.model.party.Person"%>
<div id="list-person" class="content scaffold-list" style="font-size: 11px;font: Tahoma;" role="main">
	<table class="hor-minimalist">
		<thead>
			<tr>
				<th />

				<g:sortableColumn property="firstName"
					title="${message(code: 'person.firstName.label', default: 'First Name')}" />

				<g:sortableColumn property="lastName"
					title="${message(code: 'person.lastName.label', default: 'Last Name')}" />

				<g:sortableColumn property="externalId"
					title="${message(code: 'person.externalId.label', default: 'External Id')}" />

				<g:sortableColumn property="partyType"
					title="${message(code: 'person.partyType.label', default: 'Party Type')}" />
			</tr>
		</thead>
		<tbody id="listing">
			<g:each in="${personInstanceList}" status="i" var="personInstance">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

					<td><input type='checkbox' name='partyExternal'
						value='${fieldValue(bean: personInstance, field: "externalId")}'
						class='unique' /></td>

					<td>
						${fieldValue(bean: personInstance, field: "firstName")}
					</td>

					<td>
						${fieldValue(bean: personInstance, field: "lastName")}
					</td>

					<td>
						${fieldValue(bean: personInstance, field: "externalId")}
					</td>

					<td>
						${fieldValue(bean: personInstance, field: "partyType")}
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>
	<div id="pagination" class="pagination">
     </div>	
	<div class="pagination">
		<g:paginate total="${personInstanceTotal?personInstanceTotal:0}" />
	</div>
</div>
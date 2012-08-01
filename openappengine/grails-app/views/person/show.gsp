
<%@ page import="com.openappengine.model.party.Person" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title>
			Party | Party# ${personInstance?.externalId }
		</title>
	</head>
	<body>
		<a href="#show-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="show-person" class="content scaffold-show" role="main">
			<h1>
				Party - <g:fieldValue bean="${personInstance}" field="externalId"/>
			</h1>
			<ol class="property-list person">
			
					<li class="fieldcontain">
						<span id="externalId-label" class="property-label"><g:message code="person.externalId.label" default="External Id" /></span>
						<span class="property-value" aria-labelledby="externalId-label"><g:fieldValue bean="${personInstance}" field="externalId"/></span>
					</li>
			
					<li class="fieldcontain">
						<span id="firstName-label" class="property-label"><g:message code="person.firstName.label" default="First Name" /></span>
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${personInstance}" field="firstName"/></span>
					</li>
				
					<li class="fieldcontain">
						<span id="middleName-label" class="property-label"><g:message code="person.middleName.label" default="Middle Name" /></span>
						<span class="property-value" aria-labelledby="middleName-label"><g:fieldValue bean="${personInstance}" field="middleName"/></span>
					</li>
				
					<li class="fieldcontain">
						<span id="lastName-label" class="property-label"><g:message code="person.lastName.label" default="Last Name" /></span>
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${personInstance}" field="lastName"/></span>
					</li>
					
					<li class="fieldcontain">
						<span id="suffix-label" class="property-label"><g:message code="person.suffix.label" default="Suffix" /></span>
						<span class="property-value" aria-labelledby="suffix-label"><g:fieldValue bean="${personInstance}" field="suffix"/></span>
					</li>
					
					<li class="fieldcontain">
						<span id="gender-label" class="property-label"><g:message code="person.gender.label" default="Gender" /></span>
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${personInstance}" field="gender"/></span>
					</li>
				
					<li class="fieldcontain">
						<span id="birthDate-label" class="property-label"><g:message code="person.birthDate.label" default="Birth Date" /></span>
						<span class="property-value" aria-labelledby="birthDate-label"><g:formatDate date="${personInstance?.birthDate}" /></span>
					</li>
			
			
					<g:if test="${personInstance?.partyContactMechs}">
					<li class="fieldcontain">
							<span id="partyContactMechs-label" class="property-label"><g:message code="person.partyContactMechs.label" default="Party Contact Mechs" /></span>
						
							<g:each in="${personInstance.partyContactMechs}" var="p">
							<span class="property-value" aria-labelledby="partyContactMechs-label"><g:link controller="partyContactMech" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
							</g:each>
						
					</li>
					</g:if>
			
				<g:if test="${personInstance?.addresses}">
				<li class="fieldcontain">
					<%--<span id="addresses-label" class="property-label">
						<g:message code="person.addresses.label" default="Addresses" />
					</span>
						--%>
						<table style="width:50%;">
							<thead>
								<tr>
									<th>Address</th>
									<th />
								</tr>
							</thead>
							<tbody>
							<g:each in="${personInstance.addresses}" var="a">
									<tr>
										<td>
											${a?.address1}, ${a?.address2}, <br /> 
													${a?.city}, ${a?.postalCode}
													${a?.stateProvince}, <br /> 
													${a?.country} <br />
										</td>
										<td>
											<g:link controller="address" action="show" id="${a.addressBookId}">
												<img src="${resource(dir: 'images', file: 'view_detail.png')}" alt="View"/>
											</g:link>
										</td>
									</tr>
							</g:each>
							</tbody>
						</table>
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${personInstance?.partyId}" />
					<g:link class="edit" action="edit" id="${personInstance?.partyId}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

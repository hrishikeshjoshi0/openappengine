<%@ page import="com.openappengine.model.party.Party" %>



<div class="fieldcontain ${hasErrors(bean: partyInstance, field: 'partyId', 'error')} ">
	<label for="partyId">
		<g:message code="party.partyId.label" default="Party Id" />
	</label>
	<g:field type="number" name="partyId" value="${fieldValue(bean: partyInstance, field: 'partyId')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: partyInstance, field: 'addresses', 'error')} ">
	<label for="addresses">
		<g:message code="party.addresses.label" default="Addresses" />
		
	</label>
	<g:select name="addresses" from="${com.openappengine.model.party.Address.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${partyInstance?.addresses*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: partyInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="party.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${partyInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: partyInstance, field: 'externalId', 'error')} ">
	<label for="externalId">
		<g:message code="party.externalId.label" default="External Id" />
		
	</label>
	<g:textField name="externalId" value="${partyInstance?.externalId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: partyInstance, field: 'partyContactMechs', 'error')} ">
	<label for="partyContactMechs">
		<g:message code="party.partyContactMechs.label" default="Party Contact Mechs" />
		
	</label>
	<g:select name="partyContactMechs" from="${com.openappengine.model.party.PartyContactMech.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${partyInstance?.partyContactMechs*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: partyInstance, field: 'partyType', 'error')} ">
	<label for="partyType">
		<g:message code="party.partyType.label" default="Party Type" />
		
	</label>
	<g:textField name="partyType" value="${partyInstance?.partyType}" />
</div>

<div class="fieldcontain ${hasErrors(bean: partyInstance, field: 'preferredCurrencyUom', 'error')} ">
	<label for="preferredCurrencyUom">
		<g:message code="party.preferredCurrencyUom.label" default="Preferred Currency Uom" />
		
	</label>
	<g:textField name="preferredCurrencyUom" value="${partyInstance?.preferredCurrencyUom}" />
</div>

<div class="fieldcontain ${hasErrors(bean: partyInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="party.status.label" default="Status" />
		
	</label>
	<g:textField name="status" value="${partyInstance?.status}" />
</div>


<%@ page import="com.openappengine.model.party.Party" %>



			<div class="control-group fieldcontain ${hasErrors(bean: partyInstance, field: 'partyId', 'error')} ">
				<label for="partyId" class="control-label"><g:message code="party.partyId.label" default="Party Id" /></label>
				<div class="controls">
					<g:field type="number" name="partyId" value="${partyInstance.partyId}" />
					<span class="help-inline">${hasErrors(bean: partyInstance, field: 'partyId', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: partyInstance, field: 'addresses', 'error')} ">
				<label for="addresses" class="control-label"><g:message code="party.addresses.label" default="Addresses" /></label>
				<div class="controls">
					<g:select name="addresses" from="${com.openappengine.model.party.Address.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${partyInstance?.addresses*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: partyInstance, field: 'addresses', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: partyInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="party.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${partyInstance?.description}" />
					<span class="help-inline">${hasErrors(bean: partyInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: partyInstance, field: 'externalId', 'error')} ">
				<label for="externalId" class="control-label"><g:message code="party.externalId.label" default="External Id" /></label>
				<div class="controls">
					<g:textField name="externalId" value="${partyInstance?.externalId}" />
					<span class="help-inline">${hasErrors(bean: partyInstance, field: 'externalId', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: partyInstance, field: 'partyContactMechs', 'error')} ">
				<label for="partyContactMechs" class="control-label"><g:message code="party.partyContactMechs.label" default="Party Contact Mechs" /></label>
				<div class="controls">
					<g:select name="partyContactMechs" from="${com.openappengine.model.party.PartyContactMech.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${partyInstance?.partyContactMechs*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: partyInstance, field: 'partyContactMechs', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: partyInstance, field: 'partyType', 'error')} ">
				<label for="partyType" class="control-label"><g:message code="party.partyType.label" default="Party Type" /></label>
				<div class="controls">
					<g:textField name="partyType" value="${partyInstance?.partyType}" />
					<span class="help-inline">${hasErrors(bean: partyInstance, field: 'partyType', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: partyInstance, field: 'preferredCurrencyUom', 'error')} ">
				<label for="preferredCurrencyUom" class="control-label"><g:message code="party.preferredCurrencyUom.label" default="Preferred Currency Uom" /></label>
				<div class="controls">
					<g:textField name="preferredCurrencyUom" value="${partyInstance?.preferredCurrencyUom}" />
					<span class="help-inline">${hasErrors(bean: partyInstance, field: 'preferredCurrencyUom', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: partyInstance, field: 'status', 'error')} ">
				<label for="status" class="control-label"><g:message code="party.status.label" default="Status" /></label>
				<div class="controls">
					<g:textField name="status" value="${partyInstance?.status}" />
					<span class="help-inline">${hasErrors(bean: partyInstance, field: 'status', 'error')}</span>
				</div>
			</div>


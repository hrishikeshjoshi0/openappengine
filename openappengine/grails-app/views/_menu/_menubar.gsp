<g:if test="${session.layout == null || session.layout == 'grid'}">
	<g:set var="menutype" value="nav nav-tabs" />
</g:if>
<g:elseif test="${session.layout == 'fluid'}">
	<g:set var="menutype" value="nav nav-tabs" />
</g:elseif>

<!-- position of menu: LTR (left-to-right, European) or RTL (right-to-left, Oriental) -->
<g:if test="${session.menuposition == 'right' && session.layout == 'grid'}">
	<g:set var="menuposition" value="pull-right" />
</g:if>
<g:elseif test="${session.menuposition == 'right' && session.layout == 'fluid'}">
	<g:set var="menuposition" value="tabbable tabs-right" /> <!-- pull-right -->
</g:elseif>
<g:elseif test="${session.layout == 'fluid'}">
	<g:set var="menuposition" value="tabbable tabs-left" /> <!-- pull-left -->
</g:elseif>
<g:else>
	<g:set var="menuposition" value="" />
</g:else>


<div class="${menuposition}">
	<ul class="nav nav-list" data-role="listview" data-split-icon="gear" data-filter="true">
		<li class="controller${params.controller == 'party' ? " active" : ""}">
				<g:link controller="party" action="index">
					<g:message code="party.label" default="Party"/>
				</g:link>
		</li>
		
		<li class="controller${params.controller == 'product' ? " active" : ""}">
				<g:link controller="product" action="index">
					<g:message code="product.label" default="Product"/>
				</g:link>
		</li>
		<li class="controller${params.controller == 'payment' ? " active" : ""}">
				<g:link controller="payment" action="paymentUpload">
					<g:message code="product.label" default="Payment Upload"/>
				</g:link>
		</li>
	</ul>
</div>

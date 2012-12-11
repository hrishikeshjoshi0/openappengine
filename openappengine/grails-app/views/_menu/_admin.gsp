<ul class="nav pull-right">
	<li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#"><g:message code="default.admin.label"/><b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li class="">
				<a tabindex="-1" href="#"><b>Technical Admin</b></a>
			</li>
			<g:if env="development">
			<li class=""><a href="${createLink(uri: '/dbconsole')}"><g:message code="default.dbconsole.label"/></a></li>
			</g:if>
			<li class=""><a href="${createLink(uri: '/systeminfo')}"><g:message code="default.systeminfo.label"/></a></li>
			<li class="dropdown-submenu">
				<a tabindex="-1" href="#">All Controller</a>
				<ul class="dropdown-menu">
					<li class="controller"><g:link controller="home">HomeController</g:link></li>
					<li class="divider"></li>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.logicalPropertyName } }">
						<g:if test="${c.logicalPropertyName != 'home'}">
							<li class="controller"><g:link controller="${c.logicalPropertyName}">${c?.fullName?.substring(c?.fullName?.lastIndexOf('.')+1)}</g:link></li>
						</g:if>
					</g:each>
				</ul>
			</li>
		</ul>
	</li>
</ul>

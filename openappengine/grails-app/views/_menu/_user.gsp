<ul class="nav pull-right">
	<li class="dropdown dropdown-btn">
<%--<sec:ifNotLoggedIn>--%>

		<a class="dropdown-toggle" role="button" data-toggle="dropdown" data-target="#" href="#" tabindex="-1">
			<!-- TODO: integrate Springsource Security etc. and show User's name ... -->
			<g:message code="security.signin.label"/><b class="caret"></b>
		</a>

		<ul class="dropdown-menu" role="menu">
			<li class="form-container">
				<form action="login" method="post" accept-charset="UTF-8">
					<input style="margin-bottom: 15px;" type="text" placeholder="Username" id="username" name="username">
					<input style="margin-bottom: 15px;" type="password" placeholder="Password" id="password" name="password">
					<input style="float: left; margin-right: 10px;" type="checkbox" name="remember-me" id="remember-me" value="1">
					<label class="string optional" for="user_remember_me"> Remember me</label>
					<input class="btn btn-primary btn-block" type="submit" id="sign-in" value="Sign In">
				</form>
			</li>
			<li class="divider"></li>
			<li class="button-container">
				<!-- NOTE: the renderDialog MUST be placed outside the NavBar (at least for Bootstrap 2.1.1): see bottom of main.gsp -->
				<g:render template="/_common/modals/registerTextLink"/>
			</li>
		</ul>

<%--</sec:ifNotLoggedIn>--%>
<%--<sec:ifLoggedIn>--%>

<%--		<a class="dropdown-toggle" role="button" data-toggle="dropdown" data-target="#" href="#">--%>
<%--			<!-- TODO: Only show menu items based on permissions (e.g., Guest has no account page) -->--%>
<%--			<i class="icon-user icon-large icon-white"></i>--%>
<%--			${user.name}--%>
<%--			<g:message code="default.user.unknown.label" default="Guest"/> <b class="caret"></b>--%>
<%--		</a>--%>
<%--		<ul class="dropdown-menu" role="menu">--%>
<%--			<!-- TODO: Only show menu items based on permissions -->--%>
<%--			<li class=""><a href="${createLink(uri: '/')}">--%>
<%--				<i class="icon-user"></i>--%>
<%--				<g:message code="user.show.label"/>--%>
<%--			</a></li>--%>
<%--			<li class=""><a href="${createLink(uri: '/')}">--%>
<%--				<i class="icon-cogs"></i>--%>
<%--				<g:message code="user.settings.change.label"/>--%>
<%--			</a></li>--%>
<%--			--%>
<%--			<li class="divider"></li>--%>
<%--			<li class=""><a href="${createLink(uri: '/')}">--%>
<%--				<i class="icon-off"></i>--%>
<%--				<g:message code="security.signoff.label"/>--%>
<%--			</a></li>--%>
<%--		</ul>--%>

<%--</sec:ifLoggedIn>--%>
	</li>
</ul>

<noscript>
<ul class="nav pull-right">
	<li class="">
		<g:link controller="user" action="show"><g:message code="default.user.unknown.label"/></g:link>
	</li>
</ul>
</noscript>

<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'errors.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery-ui.min.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.ui.menubar.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css/smoothness', file: 'jquery-ui-1.8.2.custom.css')}" type="text/css">
		
		<script src="${resource(dir: 'js', file: 'jquery-1.7.1.js')}"></script>
		<script src="${resource(dir: 'js/external', file: 'jquery.bgiframe-2.1.2.js')}"></script>
		<script src="${resource(dir: 'js/external', file: 'jquery.tmpl.js')}"></script>
		<script src="${resource(dir: 'js/ui', file: 'jquery.ui.core.js')}"></script>
		<script src="${resource(dir: 'js/ui', file: 'jquery.ui.widget.js')}"></script>
		<script src="${resource(dir: 'js/ui', file: 'jquery.ui.datepicker.js')}"></script>
		<script src="${resource(dir: 'js/ui', file: 'jquery.ui.widget.js')}"></script>
		<script src="${resource(dir: 'js/ui', file: 'jquery.ui.mouse.js')}"></script>
		<script src="${resource(dir: 'js/ui', file: 'jquery.ui.draggable.js')}"></script>
		<script src="${resource(dir: 'js/ui', file: 'jquery.ui.position.js')}"></script>
		<script src="${resource(dir: 'js/ui', file: 'jquery.ui.resizable.js')}"></script>
		<script src="${resource(dir: 'js/ui', file: 'jquery.ui.dialog.js')}"></script>
		<script src="${resource(dir: 'js/ui', file: 'jquery.ui.button.js')}"></script>
		<script src="${resource(dir: 'js/ui', file: 'jquery.ui.observable.js')}"></script>
		<script src="${resource(dir: 'js/ui', file: 'jquery.ui.dataview.js')}"></script>
		<script src="${resource(dir: 'js/ui', file: 'jquery.ui.grid.js')}"></script>
		<script src="${resource(dir: 'js/ui', file: 'jquery.ui.dataviewlocal.js')}"></script>
		<script src="${resource(dir: 'js/ui', file: 'jquery.ui.autocomplete.js')}"></script>
		<script src="${resource(dir: 'js/ui', file: 'jquery.ui.slider.js')}"></script>
		<script src="${resource(dir: 'js/ui', file: 'jquery.ui.menu.js')}"></script>
		<script src="${resource(dir: 'js', file: 'jquery.validate.js')}"></script>
		<!-- TODO -- Template -->
		<script src="${resource(dir: 'js', file: 'pager.js')}"></script>
		<script src="${resource(dir: 'js', file: 'jquery-ui.min.js')}"></script>
		
		 <script type="text/javascript">    
		    $(function(){
		    	// BUTTONS
				$("#menubar_ul").menubar({
                	menuIcon : true,
                	select : function(event, ui){
                		//$("#menubarStatusUpdater").text("'" + ui.item.text() + "' menubar item selected");
                	}
            	});
		    });
		  </script>
		
		<g:layoutHead/>
        <r:layoutResources />
	</head>
	<body>
		<div id="wrap">
			<div id="grailsLogo" role="banner">
				<div id="header_stat" style="float: right; margin-right: 1em;">
					<sec:ifNotLoggedIn>
						<g:link controller="login" action="auth">Login</g:link>
					</sec:ifNotLoggedIn>
					<sec:ifLoggedIn>
						   Welcome : <sec:username /> 
						   |<g:link controller="logout" style="color:#EEE;">Log out</g:link>
					</sec:ifLoggedIn>
				</div>
			</div>
	
			<div id="menu_status_bar" style="font: Tahoma;">
				
				<!-- Menubar -->
				<div id="menubar" style="float: left;">
					<ul id="menubar_ul" aria-label="Sample Options">
						<!-- 
						<li><a href="#">Mega Menu</a>
							<ul aria-label="Mega Menu" style="width: auto;">
								<li>
									<a href="#">
										<div>
								          <h3>Tabular Content Example</h3>
								          <table class="hor-minimalist" id="tabular-content">
								            <tr>
								              <th style="width: 15px">ID</th>
								              <th>Name</th>
								              <th>Place</th>
								              <th style="width: 60px">Number</th>
								            </tr>
								            <tr>
								              <td>1</td><td>Shiva Shankara Sahoo</td><td>Parlakhemundi</td><td>6742266</td>
								            </tr>
								            <tr>
								              <td>2</td><td>Ravi Nikam</td><td>Brussels</td><td>5669985</td>
								            </tr>
								            <tr>
								              <td>3</td><td>John Doe</td><td>Olympus</td><td>8699552</td>
								            </tr>
								            <tr>
								              <td>4</td><td>Don Joe</td><td>Sinki</td><td>8877556</td>
								            </tr>
								          </table>
								        </div>
									</a>
								</li>
							</ul></li>
							 -->
						<li><a href="#">Party</a>
							<ul aria-label="Party">
								<li><g:link controller="person" action="create">New Party</g:link>
								</li>
								<li><g:link controller="person" action="list">Find Party</g:link>
								</li>
								<%--<li><a href="#">Recent Documents</a>
												<ul>
													<li><a href="#">Document 1</a></li>
													<li><a href="#">Document 2</a></li>
													<li><a href="#">Document 3</a></li>
													<li><a href="#">Continuous Web Accessibility Monitoring</a></li>
													<li><a href="#">Multimedia Transcription and Captioning</a></li>
												</ul>
											</li>
											--%>
							</ul></li>
						<li><a href="#">Contract</a>
							<ul aria-label="Contract">
								<li><g:link controller="contract" action="create">New Contract</g:link>
								</li>
								<li><g:link controller="contract" action="list">View Existing Contracts</g:link>
								</li>
							</ul></li>
						<li><a href="#">Financials</a>
							<ul aria-label="Financials">
								<li><g:link controller="payment" action="list">View Payments</g:link>
								</li>
								<li><g:link controller="order" action="create">New Order</g:link>
								</li>
								<li><g:link controller="order" action="list">Find Orders</g:link>
								</li>
								<li><g:link controller="order" action="orderStatusReport">Order Status Summary</g:link>
								</li>
							</ul></li>
						<li><a href="#">Product</a>
							<ul aria-label="Product">
								<li><g:link controller="product" action="create">New Product</g:link>
								</li>
								<li><g:link controller="product" action="list">Find Product</g:link>
								</li>
							</ul></li>
						<li><a href="#">Tax</a>
							<ul aria-label="Product">
								<li><g:link controller="tax" action="list">Taxes</g:link></li>
							</ul></li>
					</ul>
				</div>
				<!-- Menubar -->
	
				<!-- Spinner -->
				<div id="spinner" class="spinner"
					style="display: none; float: right; margin-right: 40px;">
					<g:message code="spinner.alt" default="Loading&hellip;" />
				</div>
			</div>
	
			<div id="body-content">
				<br /><br />
				
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
	
				<br /><br />
	
				<g:layoutBody />
			</div>
	
			<div class="footer" role="contentinfo"></div>
	
			<g:javascript library="application" />
			<r:layoutResources />
		</div>
	</body>
</html>
<div id="Content" class="container-fluid">

	
	
	

	<!-- print system messages (infos, warnings, etc) - not validation errors -->
	<g:if test="${flash.message}">
		<div class="alert alert-info">${flash.message}</div>
	</g:if>

<!-- Main menu in one line (e.g., controller entry points -->
	  <div class="row-fluid">
	    <div class="span2">
	      <!--Sidebar content-->
		  <g:render template="/_menu/menubar"/>
	    </div>
	    
	    <div class="span10">
	    <!-- Secondary menu in one line (e.g., actions for current controller) -->
	<div class="row">
		<div class="span12">
			<g:render template="/_menu/submenubar"/>														
		</div>
	</div>
	      <!--Body content-->
	      <g:layoutBody />
		  <g:pageProperty name="page.body" />
	    </div>
	</div>
</div>

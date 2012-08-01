
<%@ page import="com.openappengine.model.party.Party" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'party.label', default: 'Party')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<script type="text/javascript">
	        $(document).ready(function() {
                         <jqgrid:grid
                                id="party"
                                url="'${createLink(action: 'listJSON')}'"
                                editurl="'${createLink(action: 'editJSON')}'"
                                colNames="'External Id', 'Status', 'Description'"
                                colModel="{name:'externalId', editable: false},
                                          {name:'status', editable: true},
                                          {name:'description', editable: true}"
                                sortname="'externalId'"
                                caption="'Party List'"
                                height="300"
                                autowidth="true"
                                scrollOffset="0"
                                viewrecords="true"
                                showPager="true"
                                datatype="'json'">
                                <jqgrid:navigation id="partyStandard" add="true" edit="true" 
                                      del="true" search="true" refresh="true" />
                         </jqgrid:grid>
               });
        </script>
	</head>
	<body>
		<div id="list-party" class="content scaffold-list" role="main">
			<!-- jqgrid -->
			<jqgrid:wrapper id="party" />
		</div>
	</body>
</html>

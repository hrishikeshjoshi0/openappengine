<%@ page import="com.openappengine.model.party.Party" %>
<!doctype html>
<html>
<head>
<script src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
		<script src="${resource(dir: 'js', file: 'jquery.handsontable.full.js')}"></script>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.handsontable.full.css')}"
	type="text/css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

   <button name="save">Upload Records</button>
     

    <div id="example1"></div>
        <script>
          var $container = $("#example1");
          var $console = $("#example1console");
          var $parent = $container.parent();
          var autosaveNotification;
          $container.handsontable({
            startRows: 8,
            startCols: 2,
            rowHeaders: true,
            colHeaders: true,
            minSpareRows: 1,
            contextMenu: true,
            colHeaders: ["Party ID", "Payment Amount"],
          });
          var handsontable = $container.data('handsontable');

          var rowList = handsontable.getData()
          $parent.find('button[name=save]').click(function () {
            $.ajax({
              url: "<g:createLink controller='payment' action='uploadRecords'></g:createLink>",
              dataType: "json",
              data: {data: JSON.stringify(rowList)}, //returns all cells' data
              type: 'POST',
            });
          });
        </script>
     

</body>
</html>
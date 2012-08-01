<%@ page import="com.openappengine.model.contract.Contract" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}" />
		<title>
			Contract | New Contract 
		</title>
		
		<script>
			$(function() {
				// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
				$( "#dialog:ui-dialog" ).dialog( "destroy" );

				$( "#dialog-form" ).dialog({
					autoOpen: false,
					width : '500px',
					height : 'auto',
					modal: true,
					buttons: {
						Add: function() {
							var count = parseInt(document.getElementById("itemCount").value);
							
							count++;
							document.getElementById("itemCount").value = count;

							var productId = $("#pdProductId").val();
							var productName = "";

							var response = $.ajax({ type: "GET",   
		                        url: "/openappengine/product/getProduct/" + $("#pdProductId").val(),   
		                        async: false
		                      }).responseText;

							$("#lineItems tbody").append("<tr>" +
									"<td id='lineItems[" + (count-1) +"].productId'>" + response + "</td>" + 
									"<td id='lineItems[" + (count-1) +"].quantity'>" + $("#quantity").val() + "</td>" +
									"<td id='lineItems[" + (count-1) +"].selectedAmouunt'>" + $("#selectedAmouunt").val() + "</td>" +
									"<td id='lineItems[" + (count-1) +"].fromDate'>" + $("#lineItemFromDate").val() + "</td>" +
									"<td id='lineItems[" + (count-1) +"].toDate'>" + $("#lineItemToDate").val() + "</td>" +
							"</tr>" );

							$("#contractForm").append(
									"<input type='hidden' name='lineItems[" + (count-1) +"].productId' value='" + $("#pdProductId").val() + "' />" +
									"<input type='hidden' name='lineItems[" + (count-1) +"].quantity' value='" + $("#quantity").val() + "' />" +
									"<input type='hidden' name='lineItems[" + (count-1) +"].selectedAmouunt' value='" + $("#selectedAmouunt").val() + "' />" + 
									"<input type='hidden' name='lineItems[" + (count-1) +"].lineItemFromDate' value='" + $("#lineItemFromDate").val() + "' />" +
									"<input type='hidden' name='lineItems[" + (count-1) +"].lineItemToDate' value='" + $("#lineItemToDate").val() + "' />"
							);

														
							$( this ).dialog( "close" );
						},
							
						Cancel: function() {
							$( this ).dialog( "close" );
						}
					},
					close: function() {
						$("#pdProductId").val("");
						$("#selectedAmouunt").val("");
						$("lineItemFromDate").val();
						$("lineItemToDate").val();
					}
				});

				$("#addLineItem")
					.click(function() {
						$( "#dialog-form" ).dialog( "open" );
				});
			});

			</script>
	</head>
	<body>
		
		<div id="dialog-form" title="Add Line Item">
			<fieldset class="form">
				<g:render template="/contractLineItem/form"/>
			</fieldset>
		</div>
		
		<br/>
		
		<div id="create-contract" class="content scaffold-create" role="main">
			<g:hasErrors bean="${contractInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${contractInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<br/>
			
			<span style="margin-left: 4em;margin-top: 10em;">
				<a id="addLineItem" href="#" style="width: 12px;height: 12px;" title="Add Line Item">
					<img src="${resource(dir: 'images', file: 'add_item.png')}" alt="Add Line Item"/>
				</a>
			</span>
			
			<g:form name="contractForm" action="save" >
				<fieldset class="form">
					<g:hiddenField name="itemCount" value="0" />
					<g:render template="form"/>
					
					<br/>
					<table id="lineItems" style="font-size: 11px;font: Tahoma;border: 1px;border-color: #EEE;">
                        <thead>
                            <tr>
                            	<th>Product</th>
                            	<th>Quantity</th>
                            	<th>Amount</th>
                            	<th>From Date</th>
                            	<th>To Date</th>
                            </tr>
                        </thead>
                        <tbody>
                        	
                        </tbody>
                    </table>
				</fieldset>
				
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

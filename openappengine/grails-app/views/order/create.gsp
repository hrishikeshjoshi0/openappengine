<%@ page import="com.openappengine.model.contract.Contract" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'order.label', default: 'Order')}" />
		<title>
			Order | Create New Order # <g:fieldValue bean="${ohOrderHeaderInstance}" field="externalId" />
		</title>
		
		<script type="text/javascript">
			$(document).ready(function() {
				$("#create").click(function() {
					// prevent the default action, e.g., following a link
					var itemCount = $("#itemCount").val();
					if(itemCount == 0) {
						alert("Please select atleast one order item.");
						return false;
					}

					var billingAccountId= $("#billingAccountId").val();
					if(billingAccountId == "") {
						alert("Please select the Billing Account.");
						return false;
					}	
				});
				
				var $dialog = $('<div></div>')
					.html('Loading...')
					.dialog({
						autoOpen: false,
						width : '800px',
						height : 'auto',
						modal : true,
						position : "top",	
						title: 'Select Party',
						buttons: {
							Select: function() {
								var partyExternalIds =  $('input.unique').filter(':checked');
								if(partyExternalIds.length == 0) {
									alert("Select atleast one record.");
									return;
								} 
								
								$("#billingAccountId").val(partyExternalIds[0].value);
								$( this ).dialog( "close" );	
							},
							Cancel: function() {
								$( this ).dialog( "close" );
							}
						},
						close: function() {
							$("#firstName").val("");
							$("#middleName").val("");
							$("#lastName").val("");
							
							$("#partyExternalId").val("");
						}
					});
	
				$('#addParty').click(function() {
					$dialog.load('/openappengine/person/searchDialog').dialog('open');
					// prevent the default action, e.g., following a link
					return false;
				});
			});
		
			$(function() {
				$( "#dialog-form" ).dialog({
					autoOpen: false,
					width : '800px',
					height : 'auto',
					open: function(event, ui) {
						//Init Order Items
						$.ajax({ type: "GET",   
	                        url: "/openappengine/order/addLineItem",   
	                        async: false
	                      }).responseText;
					},
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
									"<td id='lineItems[" + (count-1) +"].unitPrice'>" + $("#unitPrice").val() + "</td>" +
									"<td id='lineItems[" + (count-1) +"].taxPrice'>" + $("#taxPrice").val() + "</td>" +
									"<td id='lineItems[" + (count-1) +"].lineTotalPrice'>" + $("#lineTotalPrice").val() + "</td>" +
							"</tr>" );

							$("#orderForm").append(
									"<input type='hidden' name='lineItems[" + (count-1) +"].productId' value='" + $("#pdProductId").val() + "' />" +
									"<input type='hidden' name='lineItems[" + (count-1) +"].quantity' value='" + $("#quantity").val() + "' />" +
									"<input type='hidden' name='lineItems[" + (count-1) +"].unitPrice' value='" + $("#unitPrice").val() + "' />" +
									"<input type='hidden' name='lineItems[" + (count-1) +"].taxPrice' value='"  + $("#taxPrice").val() + "' />" +
									"<input type='hidden' name='lineItems[" + (count-1) +"].lineTotalPrice' value='" + $("#lineTotalPrice").val() + "' />"
							);

							var gt = $("#grandTotal").val();
							$("#grandTotal").val(gt + $("#lineTotalPrice").val());
														
							$( this ).dialog( "close" );
						},
							
						Cancel: function() {
							$( this ).dialog( "close" );
						}
					},
					close: function() {
						$("#pdProductId").val("");

						$("input#unitPriceHdn").val("");
						$("input#taxPriceHdn").val("");
						
						$("input#unitPrice").val("");
						$("input#taxPrice").val("");
						$("input#lineTotalPrice").val("");
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
		
		<div id="dialog-form" title="Add Item">
			<fieldset class="form">
				<g:render template="/orderItem/form"/>
			</fieldset>
		</div>
		
		<br/>
		
		<div id="create-order" class="content scaffold-create" role="main">
			<g:hasErrors bean="${ohOrderHeaderInstance}">
			<ul id="errors" class="errors" role="alert">
				<g:eachError bean="${ohOrderHeaderInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<br/>
			
			<g:form name="orderForm" action="invoiceOrder" >
				<h1>
					Create Order
				</h1>
				<fieldset class="form">
					<g:hiddenField name="itemCount" value="0" />
					<g:render template="form"/>
					
					<br/><br/>
					<div style="width:100%;background-color: #666666;float: left;">
							<a id="addLineItem" href="#" style="padding:5px;width: 12px;height: 12px;text-decoration: none;color:#FFFFFF;" title="Add Line Item">
								<img src="${resource(dir: 'images', file: 'add_item.png')}" alt="Add Line Item" title="Add Line Item"/>
							</a>
					</div>
					<br/><br/>
					<table id="lineItems" style="font-size: 11px;font: Tahoma;border: 1px;border-color: #EEE;">
                        <thead>
                            <tr>
                            	<th>Product</th>
                            	<th>Quantity</th>
                            	<th>Unit Price</th>
                            	<th>Tax</th>
                            	<th>Total Price</th>
                            </tr>
                        </thead>
                        <tbody>
                        	
                        </tbody>
                    </table>
				</fieldset>
				
				<fieldset class="buttons">
					<g:submitButton name="create" class="save"
						value="${message(code: 'default.button.invoice.label', default: 'Invoice')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

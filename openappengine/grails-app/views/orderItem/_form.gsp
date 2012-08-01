<%@ page import="com.openappengine.model.fm.OiOrderItem" %>

<script type="text/javascript">
$(document).ready(function(){
    //called when key is pressed in textbox
    $("input#quantity").val('1.0');
    
	$("#quantity").keypress(function (e)  
	{ 
	  //if the letter is not digit then display error and don't type anything
	  if( e.which!=8 && e.which!=0 && (e.which<48 || e.which>57))
	  {
		//display error message
		//$("#errmsg").html("Digits Only").show().fadeOut("slow"); 
	    return false;
      }	
	});
  });

	function updatePrices(data) {

		$("input#unitPriceHdn").val(data.price);
		$("input#taxPriceHdn").val(data.tax);
		
		$("input#unitPrice").val(data.price);
		$("input#taxPrice").val(data.tax);
		$("input#lineTotalPrice").val(data.tax + data.price);
	}

	function quantityChanged() {

		var qty = $("input#quantity").val();
		var unitPrice = $("input#unitPriceHdn").val();
		var taxPrice = $("input#taxPriceHdn").val();

		$("input#unitPrice").val(unitPrice*qty);
		$("input#taxPrice").val(taxPrice*qty);
		$("input#lineTotalPrice").val(unitPrice*qty + taxPrice*qty);
	}
</script>

<input type="hidden" name="unitPriceHdn" id="unitPriceHdn" />
<input type="hidden" name="taxPriceHdn" id="taxPriceHdn" />

<div class="fieldcontain ${hasErrors(bean: oiOrderItemInstance, field: 'product', 'error')} ">
	<label for="product">
		<g:message code="contractLineItem.product.label" default="Product" />
	</label>
	<g:select id="pdProductId" name="product.pdProductId" from="${com.openappengine.model.product.Product.list()}" noSelection="['':'']"
			optionKey="pdProductId" optionValue="pdProductName" required="true" value="${oiOrderItemInstance?.product?.pdProductId}"
			onchange="${remoteFunction(controller:'product',action:'ajaxGetProductPrice',params:'\'id=\' + escape(this.value)', 
            			onSuccess:'updatePrices(data)')}" 
			class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: oiOrderItemInstance, field: 'quantity', 'error')} ">
	<label for="quantity">
		<g:message code="oiOrderItem.quantity.label" default="Quantity" />
		
	</label>
	<g:field type="number" name="quantity" value="${fieldValue(bean: oiOrderItemInstance, field: 'quantity')}" 
		onchange="quantityChanged();"/>
</div>

<div class="fieldcontain ${hasErrors(bean: oiOrderItemInstance, field: 'unitPrice', 'error')} ">
	<label for="unitPrice">
		<g:message code="oiOrderItem.unitPrice.label" default="Unit Price" />
		
	</label>
	<g:field type="number" name="unitPrice" value="${fieldValue(bean: oiOrderItemInstance, field: 'unitPrice')}" readonly="readonly"/>
</div>

<!-- TODO -->
<div class="fieldcontain ${hasErrors(bean: oiOrderItemInstance, field: 'taxPrice', 'error')} ">
	<label for="taxPrice">
		<g:message code="oiOrderItem.taxPrice.label" default="Tax Price" />
		
	</label>
	<g:field type="number" name="taxPrice" value="${fieldValue(bean: oiOrderItemInstance, field: 'taxPrice')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: oiOrderItemInstance, field: 'lineTotalPrice', 'error')} ">
	<label for="lineTotalPrice">
		<g:message code="oiOrderItem.lineTotalPrice.label" default="Line Total Price" />
		
	</label>
	<g:field type="number" name="lineTotalPrice" value="${fieldValue(bean: oiOrderItemInstance, field: 'lineTotalPrice')}" />
</div>
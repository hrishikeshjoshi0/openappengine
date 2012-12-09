<%@ page import="com.openappengine.model.product.Product" %>



			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdProductId', 'error')} ">
				<label for="pdProductId" class="control-label"><g:message code="product.pdProductId.label" default="Pd Product Id" /></label>
				<div class="controls">
					<g:field type="number" name="pdProductId" value="${productInstance.pdProductId}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdProductId', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdAmountUomType', 'error')} ">
				<label for="pdAmountUomType" class="control-label"><g:message code="product.pdAmountUomType.label" default="Pd Amount Uom Type" /></label>
				<div class="controls">
					<g:textField name="pdAmountUomType" value="${productInstance?.pdAmountUomType}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdAmountUomType', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdComments', 'error')} ">
				<label for="pdComments" class="control-label"><g:message code="product.pdComments.label" default="Pd Comments" /></label>
				<div class="controls">
					<g:textField name="pdComments" value="${productInstance?.pdComments}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdComments', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdCreatedDate', 'error')} ">
				<label for="pdCreatedDate" class="control-label"><g:message code="product.pdCreatedDate.label" default="Pd Created Date" /></label>
				<div class="controls">
					<bs:datePicker name="pdCreatedDate" precision="day" value="${productInstance?.pdCreatedDate}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdCreatedDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdDescription', 'error')} ">
				<label for="pdDescription" class="control-label"><g:message code="product.pdDescription.label" default="Pd Description" /></label>
				<div class="controls">
					<g:textField name="pdDescription" value="${productInstance?.pdDescription}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdDescription', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdFixedAmount', 'error')} ">
				<label for="pdFixedAmount" class="control-label"><g:message code="product.pdFixedAmount.label" default="Pd Fixed Amount" /></label>
				<div class="controls">
					<g:field type="number" name="pdFixedAmount" value="${productInstance.pdFixedAmount}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdFixedAmount', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdInternalName', 'error')} ">
				<label for="pdInternalName" class="control-label"><g:message code="product.pdInternalName.label" default="Pd Internal Name" /></label>
				<div class="controls">
					<g:textField name="pdInternalName" value="${productInstance?.pdInternalName}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdInternalName', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdIntroductionDate', 'error')} ">
				<label for="pdIntroductionDate" class="control-label"><g:message code="product.pdIntroductionDate.label" default="Pd Introduction Date" /></label>
				<div class="controls">
					<bs:datePicker name="pdIntroductionDate" precision="day" value="${productInstance?.pdIntroductionDate}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdIntroductionDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdIsVirtual', 'error')} ">
				<label for="pdIsVirtual" class="control-label"><g:message code="product.pdIsVirtual.label" default="Pd Is Virtual" /></label>
				<div class="controls">
					<bs:checkBox name="pdIsVirtual" value="${productInstance?.pdIsVirtual}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdIsVirtual', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdPiecesIncluded', 'error')} ">
				<label for="pdPiecesIncluded" class="control-label"><g:message code="product.pdPiecesIncluded.label" default="Pd Pieces Included" /></label>
				<div class="controls">
					<g:field type="number" name="pdPiecesIncluded" value="${productInstance.pdPiecesIncluded}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdPiecesIncluded', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdProductName', 'error')} ">
				<label for="pdProductName" class="control-label"><g:message code="product.pdProductName.label" default="Pd Product Name" /></label>
				<div class="controls">
					<g:textField name="pdProductName" value="${productInstance?.pdProductName}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdProductName', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdProductType', 'error')} ">
				<label for="pdProductType" class="control-label"><g:message code="product.pdProductType.label" default="Pd Product Type" /></label>
				<div class="controls">
					<g:textField name="pdProductType" value="${productInstance?.pdProductType}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdProductType', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdQuantityIncluded', 'error')} ">
				<label for="pdQuantityIncluded" class="control-label"><g:message code="product.pdQuantityIncluded.label" default="Pd Quantity Included" /></label>
				<div class="controls">
					<g:field type="number" name="pdQuantityIncluded" value="${productInstance.pdQuantityIncluded}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdQuantityIncluded', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdQuantityUom', 'error')} ">
				<label for="pdQuantityUom" class="control-label"><g:message code="product.pdQuantityUom.label" default="Pd Quantity Uom" /></label>
				<div class="controls">
					<g:textField name="pdQuantityUom" value="${productInstance?.pdQuantityUom}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdQuantityUom', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdRequireAmount', 'error')} ">
				<label for="pdRequireAmount" class="control-label"><g:message code="product.pdRequireAmount.label" default="Pd Require Amount" /></label>
				<div class="controls">
					<bs:checkBox name="pdRequireAmount" value="${productInstance?.pdRequireAmount}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdRequireAmount', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdRequireInventory', 'error')} ">
				<label for="pdRequireInventory" class="control-label"><g:message code="product.pdRequireInventory.label" default="Pd Require Inventory" /></label>
				<div class="controls">
					<bs:checkBox name="pdRequireInventory" value="${productInstance?.pdRequireInventory}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdRequireInventory', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdReturnable', 'error')} ">
				<label for="pdReturnable" class="control-label"><g:message code="product.pdReturnable.label" default="Pd Returnable" /></label>
				<div class="controls">
					<bs:checkBox name="pdReturnable" value="${productInstance?.pdReturnable}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdReturnable', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdSalesDiscWhenNotAvail', 'error')} ">
				<label for="pdSalesDiscWhenNotAvail" class="control-label"><g:message code="product.pdSalesDiscWhenNotAvail.label" default="Pd Sales Disc When Not Avail" /></label>
				<div class="controls">
					<bs:checkBox name="pdSalesDiscWhenNotAvail" value="${productInstance?.pdSalesDiscWhenNotAvail}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdSalesDiscWhenNotAvail', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdSalesDiscontinuationDate', 'error')} ">
				<label for="pdSalesDiscontinuationDate" class="control-label"><g:message code="product.pdSalesDiscontinuationDate.label" default="Pd Sales Discontinuation Date" /></label>
				<div class="controls">
					<bs:datePicker name="pdSalesDiscontinuationDate" precision="day" value="${productInstance?.pdSalesDiscontinuationDate}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdSalesDiscontinuationDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdSupportDiscontinuationDate', 'error')} ">
				<label for="pdSupportDiscontinuationDate" class="control-label"><g:message code="product.pdSupportDiscontinuationDate.label" default="Pd Support Discontinuation Date" /></label>
				<div class="controls">
					<bs:datePicker name="pdSupportDiscontinuationDate" precision="day" value="${productInstance?.pdSupportDiscontinuationDate}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdSupportDiscontinuationDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdTaxable', 'error')} ">
				<label for="pdTaxable" class="control-label"><g:message code="product.pdTaxable.label" default="Pd Taxable" /></label>
				<div class="controls">
					<bs:checkBox name="pdTaxable" value="${productInstance?.pdTaxable}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdTaxable', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdWeight', 'error')} ">
				<label for="pdWeight" class="control-label"><g:message code="product.pdWeight.label" default="Pd Weight" /></label>
				<div class="controls">
					<g:field type="number" name="pdWeight" value="${productInstance.pdWeight}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdWeight', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pdWeightUomId', 'error')} ">
				<label for="pdWeightUomId" class="control-label"><g:message code="product.pdWeightUomId.label" default="Pd Weight Uom Id" /></label>
				<div class="controls">
					<g:textField name="pdWeightUomId" value="${productInstance?.pdWeightUomId}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pdWeightUomId', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'prodProductPrices', 'error')} ">
				<label for="prodProductPrices" class="control-label"><g:message code="product.prodProductPrices.label" default="Prod Product Prices" /></label>
				<div class="controls">
					<g:select name="prodProductPrices" from="${com.openappengine.model.product.ProdProductPrice.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${productInstance?.prodProductPrices*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'prodProductPrices', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'productTaxes', 'error')} ">
				<label for="productTaxes" class="control-label"><g:message code="product.productTaxes.label" default="Product Taxes" /></label>
				<div class="controls">
					<g:select name="productTaxes" from="${com.openappengine.model.fm.tax.FmTaxType.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${productInstance?.productTaxes*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'productTaxes', 'error')}</span>
				</div>
			</div>


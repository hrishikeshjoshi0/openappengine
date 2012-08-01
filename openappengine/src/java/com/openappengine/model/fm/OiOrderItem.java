/**
 * 
 */
package com.openappengine.model.fm;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

import com.openappengine.model.product.Product;

/**
 * @author hrishikesh.joshi
 *
 */
@Entity
@Table(name="FM_ORDER_ITEM")
public class OiOrderItem implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "OI_ORDER_ITEM_ID", unique = true, nullable = false)
	@GeneratedValue(strategy=GenerationType.TABLE, generator="seqGenerator")  
	@TableGenerator(name="seqGenerator", table="ad_table_sequences",pkColumnName="TS_SEQUENCE_NAME",valueColumnName="TS_SEQUENCE_VALUE",
	                allocationSize=1 // flush every 1 insert  
	)
	private int orderItemId;
	
	@Column(name = "OI_ORDER_ITEM_SEQ_ID", nullable = false)
	private String orderItemSequenceId;
	
	@Column(name = "OI_EXTERNAL_ID")
	private String externalId;
	
	@Column(name = "OI_ORDER_ITEM_TYPE_ID")
	private String orderItemType;
	
	@ManyToOne
	@JoinColumn(name="OI_PRODUCT_ID", nullable=false)
	private Product product;
	
	@Column(name = "OI_QUANTITY")
	private BigDecimal quantity;
	
	@Column(name = "OI_CANCEL_QUANTITY")
	private BigDecimal cancelQuantity;

	@Column(name = "OI_SELECTED_AMOUNT")
	private BigDecimal selectedAmouunt;
	
	@Column(name = "OI_UNIT_PRICE")
	private BigDecimal unitPrice;
	
	@Column(name = "OI_UNIT_LIST_PRICE")
	private BigDecimal unitListPrice;
	
	@Column(name = "OI_IS_MODIFIED_PRICE")
	private boolean priceModified;
	
	@Column(name = "OI_ITEM_DESCRIPTION")
	private String itemDescription;
	
	@Column(name = "OI_COMMENTS")
	private String comments;
	
	@Column(name = "OI_STATUS_ID")
	private String status;
	
	@Column(name = "OI_TAX_PRICE")
	private BigDecimal taxPrice;
	
	@Column(name = "OI_LINE_TOTAL_PRICE")
	private BigDecimal lineTotalPrice;
	
	@ManyToOne
	@JoinColumn(name = "OI_ORDER_ID", unique = true, nullable = false)
	private OhOrderHeader orderHeader;

	public String getOrderItemSequenceId() {
		return orderItemSequenceId;
	}

	public void setOrderItemSequenceId(String orderItemSequenceId) {
		this.orderItemSequenceId = orderItemSequenceId;
	}

	public String getExternalId() {
		return externalId;
	}

	public void setExternalId(String externalId) {
		this.externalId = externalId;
	}

	public String getOrderItemType() {
		return orderItemType;
	}

	public void setOrderItemType(String orderItemType) {
		this.orderItemType = orderItemType;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public BigDecimal getQuantity() {
		return quantity;
	}

	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getCancelQuantity() {
		return cancelQuantity;
	}

	public void setCancelQuantity(BigDecimal cancelQuantity) {
		this.cancelQuantity = cancelQuantity;
	}

	public BigDecimal getSelectedAmouunt() {
		return selectedAmouunt;
	}

	public void setSelectedAmouunt(BigDecimal selectedAmouunt) {
		this.selectedAmouunt = selectedAmouunt;
	}

	public BigDecimal getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(BigDecimal unitPrice) {
		this.unitPrice = unitPrice;
	}

	public BigDecimal getUnitListPrice() {
		return unitListPrice;
	}

	public void setUnitListPrice(BigDecimal unitListPrice) {
		this.unitListPrice = unitListPrice;
	}

	public boolean isPriceModified() {
		return priceModified;
	}

	public void setPriceModified(boolean priceModified) {
		this.priceModified = priceModified;
	}

	public String getItemDescription() {
		return itemDescription;
	}

	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}

	public OhOrderHeader getOrderHeader() {
		return orderHeader;
	}

	public void setOrderHeader(OhOrderHeader orderHeader) {
		this.orderHeader = orderHeader;
	}

	public BigDecimal getTaxPrice() {
		return taxPrice;
	}

	public void setTaxPrice(BigDecimal taxPrice) {
		this.taxPrice = taxPrice;
	}

	public BigDecimal getLineTotalPrice() {
		return lineTotalPrice;
	}

	public void setLineTotalPrice(BigDecimal lineTotalPrice) {
		this.lineTotalPrice = lineTotalPrice;
	}
	
}

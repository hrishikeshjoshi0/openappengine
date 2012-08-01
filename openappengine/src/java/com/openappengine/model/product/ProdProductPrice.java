package com.openappengine.model.product;

import java.io.Serializable;
import javax.persistence.*;

import java.math.BigDecimal;
import java.util.Date;


/**
 * The persistent class for the prod_product_price database table.
 * 
 */
@Entity
@Table(name="prod_product_price")
public class ProdProductPrice implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.TABLE, generator="seqGenerator")  
	@TableGenerator(name="seqGenerator", table="ad_table_sequences",pkColumnName="TS_SEQUENCE_NAME",valueColumnName="TS_SEQUENCE_VALUE",
	                allocationSize=1 // flush every 1 insert  
	)
	@Column(name="PP_PROD_PRODUCT_PRICE_ID", unique=true, nullable=false)
	private int ppProdProductPriceId;

	@Column(name="PP_CURRENCY_UOM_ID", length=20)
	private String ppCurrencyUomId;

    @Temporal( TemporalType.TIMESTAMP)
	@Column(name="PP_FROM_DATE", nullable=false)
	private Date ppFromDate;

	@Column(name="PP_PRICE", precision=10, scale=3)
	private BigDecimal ppPrice;

    @Temporal( TemporalType.TIMESTAMP)
	@Column(name="PP_TO_DATE")
	private Date ppToDate;

	//bi-directional many-to-one association to ProdProduct
    @ManyToOne
	@JoinColumn(name="PP_PRODUCT_ID", nullable=false)
	private Product prodProduct;

    public ProdProductPrice() {
    }

	public int getPpProdProductPriceId() {
		return this.ppProdProductPriceId;
	}

	public void setPpProdProductPriceId(int ppProdProductPriceId) {
		this.ppProdProductPriceId = ppProdProductPriceId;
	}

	public String getPpCurrencyUomId() {
		return this.ppCurrencyUomId;
	}

	public void setPpCurrencyUomId(String ppCurrencyUomId) {
		this.ppCurrencyUomId = ppCurrencyUomId;
	}

	public Date getPpFromDate() {
		return this.ppFromDate;
	}

	public void setPpFromDate(Date ppFromDate) {
		this.ppFromDate = ppFromDate;
	}

	public BigDecimal getPpPrice() {
		return this.ppPrice;
	}

	public void setPpPrice(BigDecimal ppPrice) {
		this.ppPrice = ppPrice;
	}

	public Date getPpToDate() {
		return this.ppToDate;
	}

	public void setPpToDate(Date ppToDate) {
		this.ppToDate = ppToDate;
	}

	public Product getProdProduct() {
		return this.prodProduct;
	}

	public void setProdProduct(Product prodProduct) {
		this.prodProduct = prodProduct;
	}
	
}
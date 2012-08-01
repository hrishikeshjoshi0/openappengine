package com.openappengine.model.product;

import java.io.Serializable;
import javax.persistence.*;

import java.util.List;


/**
 * The persistent class for the prod_product_price_type database table.
 * 
 */
@Entity
@Table(name="prod_product_price_type")
public class ProdProductPriceType implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.TABLE, generator="seqGenerator")  
	@TableGenerator(name="seqGenerator", table="ad_table_sequences",pkColumnName="TS_SEQUENCE_NAME",valueColumnName="TS_SEQUENCE_VALUE",
	                allocationSize=1 // flush every 1 insert  
	)
	@Column(name="PT_PRODUCT_PRICE_TYPE_ID", unique=true, nullable=false)
	private int ptProductPriceTypeId;

	@Column(name="PT_DESCRIPTION", length=255)
	private String ptDescription;

	//bi-directional many-to-one association to ProdProductPrice
	@OneToMany(mappedBy="prodProductPriceType")
	private List<ProdProductPrice> prodProductPrices;

    public ProdProductPriceType() {
    }

	public int getPtProductPriceTypeId() {
		return this.ptProductPriceTypeId;
	}

	public void setPtProductPriceTypeId(int ptProductPriceTypeId) {
		this.ptProductPriceTypeId = ptProductPriceTypeId;
	}

	public String getPtDescription() {
		return this.ptDescription;
	}

	public void setPtDescription(String ptDescription) {
		this.ptDescription = ptDescription;
	}

	public List<ProdProductPrice> getProdProductPrices() {
		return this.prodProductPrices;
	}

	public void setProdProductPrices(List<ProdProductPrice> prodProductPrices) {
		this.prodProductPrices = prodProductPrices;
	}
	
}
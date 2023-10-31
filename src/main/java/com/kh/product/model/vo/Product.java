package com.kh.product.model.vo;

import java.sql.Date;

public class Product {

	private int productNo; //제품번호
	private int categoryNo; //카테고리번호
	private String productName; //제품이름
	private int productPrice; //제품가격
	private String productInfo;  //제품설명
	private String productIngredient; //제품성분
	private String productBrand; //제품브랜드
	private Date createDate; //제품등록일
	private String status; //상태값(Y/N)
	private String productTag; //제품태그
	
	public Product() {
		super();
	}

	public Product(int productNo, int categoryNo, String productName, int productPrice, String productInfo,
			String productIngredient, String productBrand, Date createDate, String status, String productTag) {
		super();
		this.productNo = productNo;
		this.categoryNo = categoryNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productInfo = productInfo;
		this.productIngredient = productIngredient;
		this.productBrand = productBrand;
		this.createDate = createDate;
		this.status = status;
		this.productTag = productTag;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}

	public String getProductIngredient() {
		return productIngredient;
	}

	public void setProductIngredient(String productIngredient) {
		this.productIngredient = productIngredient;
	}

	public String getProductBrand() {
		return productBrand;
	}

	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getProductTag() {
		return productTag;
	}

	public void setProductTag(String productTag) {
		this.productTag = productTag;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", categoryNo=" + categoryNo + ", productName=" + productName
				+ ", productPrice=" + productPrice + ", productInfo=" + productInfo + ", productIngredient="
				+ productIngredient + ", productBrand=" + productBrand + ", createDate=" + createDate + ", status="
				+ status + ", productTag=" + productTag + "]";
	}
	
	
	
	
}
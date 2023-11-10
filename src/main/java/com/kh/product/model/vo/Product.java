package com.kh.product.model.vo;

import java.sql.Date;

public class Product {

	private int productNo;
	private int categoryNo;
	private String productName;
	private int productPrice;
	private String productInfo;
	private String productIngredient;
	private String productBrand;
	private int count;
	private Date createDate;
	private String status;
	private String productTag;
	
	//사진게시판 목록에서 필요한 썸네일용 경로와 변경된파일이름(서버에업로드된 이름)을 합쳐 담을 필드변수
	private String imgsrc;
	
	//타입비교용카테고리이름
	private String categoryName;
	
	public Product() {
		
	}
	
	public Product(int productNo, String productName, String imgsrc, String categoryName) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.imgsrc = imgsrc;
		this.categoryName = categoryName;
	}



	public Product(int productNo, String productName, int productPrice, String productInfo, String productIngredient,
			String productBrand) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productInfo = productInfo;
		this.productIngredient = productIngredient;
		this.productBrand = productBrand;
	}

	public Product(int productNo, String productName, String imgsrc) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.imgsrc = imgsrc;
	}

	public Product(int productNo, int categoryNo, String productName, int productPrice, String productInfo,
			String productIngredient, String productBrand,int count, Date createDate, String status, String productTag) {
		super();
		this.productNo = productNo;
		this.categoryNo = categoryNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productInfo = productInfo;
		this.productIngredient = productIngredient;
		this.productBrand = productBrand;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
		this.productTag = productTag;
	}
	
	public Product(int productNo, int categoryNo, String productName, int productPrice, String productInfo,
			String productIngredient, String productBrand, int count,  Date createDate) {
		super();
		this.productNo = productNo;
		this.categoryNo = categoryNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productInfo = productInfo;
		this.productIngredient = productIngredient;
		this.productBrand = productBrand;
		this.count = count;
		this.createDate = createDate;
	}
	//사진게시글 목록 조회용 매개변수 생성자
	public Product(int productNo, int categoryNo, String productName, int productPrice, String imgsrc) {
		super();
		this.productNo = productNo;
		this.categoryNo = categoryNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.imgsrc = imgsrc;
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

	public String getImgsrc() {
		return imgsrc;
	}


	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}


	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", categoryNo=" + categoryNo + ", productName=" + productName
				+ ", productPrice=" + productPrice + ", productInfo=" + productInfo + ", productIngredient="
				+ productIngredient + ", productBrand=" + productBrand + ", createDate=" + createDate + ", status="
				+ status + ", productTag=" + productTag + ", imgsrc = " + imgsrc + "]";
	}

}
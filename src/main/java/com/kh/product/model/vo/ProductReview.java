package com.kh.product.model.vo;

import java.sql.Date;

public class ProductReview {

//	REVIEW_NO	NUMBER
//	USER_NO	NUMBER
//	PRODUCT_NO	NUMBER
//	REVIEW_CONTENT	VARCHAR2(4000 BYTE)
//	CREATE_DATE	DATE
//	STATUS	CHAR(1 BYTE)
	
	private int reviewNo;
	private int userNo;
	private int productNo;
	private String reviewContent;
	private Date createDate;
	private String status;
	
	public ProductReview() {
		super();
	}
	
	public ProductReview(int reviewNo, int userNo, String reviewContent) {
		super();
		this.reviewNo = reviewNo;
		this.userNo = userNo;
		this.reviewContent = reviewContent;
	}



	public ProductReview(int reviewNo, int userNo, int productNo, String reviewContent, Date createDate,
			String status) {
		super();
		this.reviewNo = reviewNo;
		this.userNo = userNo;
		this.productNo = productNo;
		this.reviewContent = reviewContent;
		this.createDate = createDate;
		this.status = status;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
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

	@Override
	public String toString() {
		return "ProductReview [reviewNo=" + reviewNo + ", userNo=" + userNo + ", productNo=" + productNo
				+ ", reviewContent=" + reviewContent + ", createDate=" + createDate + ", status=" + status + "]";
	}
	
	
	
}

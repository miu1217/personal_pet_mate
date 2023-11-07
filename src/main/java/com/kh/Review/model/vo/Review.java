package com.kh.Review.model.vo;

import java.sql.Date;

public class Review {
//	REVIEW_NO	NUMBER
//	USER_NO	NUMBER
//	PRODUCT_NO	NUMBER
//	REVIEW_CONTENT	VARCHAR2(4000 BYTE)
//	COUNT	NUMBER
//	CREATE_DATE	DATE
//	STATUS	CHAR(1 BYTE)
	
	private int reviewNo;
	private int userNo;
	private int productNo;
	private String reviewContent;
	private int count;
	private Date createDate;
	private String status;
	
	
	private String imgSrc;
	private String productName;
	private String userId;
	
	
	public Review() {
		super();
	}

	public Review(int reviewNo, int userNo, int productNo, String reviewContent, int count, Date createDate,
			String status) {
		super();
		this.reviewNo = reviewNo;
		this.userNo = userNo;
		this.productNo = productNo;
		this.reviewContent = reviewContent;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
	}
	
	
	
	//내가 쓴 리뷰만 보는 매개변수생성자
	public Review(String imgSrc,String productName,String userId ,Date createDate,int count) {
		super();
		this.imgSrc =imgSrc;
		this.productName=productName;
		this.userId=userId;
		this.count = count;
		this.createDate = createDate;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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
		return "Review [reviewNo=" + reviewNo + ", userNo=" + userNo + ", productNo=" + productNo + ", reviewContent="
				+ reviewContent + ", count=" + count + ", createDate=" + createDate + ", status=" + status + "]";
	}
	
	
	
	
}

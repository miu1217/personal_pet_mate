package com.kh.review.model.vo;

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
	private String titleImg;
	private String productName;
	private String userId;
	
	
	public Review() {
		super();
	}

	
	//내가 쓴 리뷰만 보는 매개변수생성자
	public Review(String titleImg, String productName, String userId, Date createDate) {
		super();
		this.titleImg = titleImg;
		this.productName = productName;
		this.userId = userId;
		this.createDate = createDate;
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
	
	
	

	public Review(int reviewNo, int userNo, int productNo, String reviewContent, int count) {
		super();
		this.reviewNo = reviewNo;
		this.userNo = userNo;
		this.productNo = productNo;
		this.reviewContent = reviewContent;
		this.count = count;
	}

	public Review(int reviewNo,  int userNo, int productNo, String reviewContent, int count, String imgSrc) {
		super();
		this.reviewNo = reviewNo;
		this.userNo = userNo;
		this.productNo = productNo;
		this.reviewContent = reviewContent;
		this.count = count;
		this.imgSrc = imgSrc;
	}

	public Review(int reviewNo, int userNo) {
		super();
		this.reviewNo = reviewNo;
		this.userNo = userNo;
	}

	public Review(int reviewNo, int userNo, String reviewContent, int count, String productName) {
		super();
		this.reviewNo = reviewNo;
		this.userNo = userNo;
		this.reviewContent = reviewContent;
		this.count = count;
		this.productName = productName;
	}

	public Review(int reviewNo, int userNo, int productNo, String reviewContent, int count, Date createDate,
			String status, String imgSrc, String productName, String userId) {
		super();
		this.reviewNo = reviewNo;
		this.userNo = userNo;
		this.productNo = productNo;
		this.reviewContent = reviewContent;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
		this.imgSrc = imgSrc;
		this.productName = productName;
		this.userId = userId;
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
	
	
	

	public String getTitleImg() {
		return titleImg;
	}


	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
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

	
	
	public String getImgSrc() {
		return imgSrc;
	}

	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", userNo=" + userNo + ", productNo=" + productNo + ", reviewContent="
				+ reviewContent + ", count=" + count + ", createDate=" + createDate + ", status=" + status + ", imgSrc="
				+ imgSrc + ", productName=" + productName + ", userId=" + userId + "]";
	}

	
	
	
	
}

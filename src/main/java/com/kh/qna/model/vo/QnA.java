package com.kh.qna.model.vo;

import java.sql.Date;

public class QnA {

	private int qnaNo;
	private String userId;
	private String category;
	private String qnaTitle;
	private String qnaContent;
	private int count;
	private Date createDate;
	private String status;

	
	private int userNo;
	private String categoryName;

	
	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	
	
	
	
	
	public QnA() {
		super();
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "QnA [qnaNo=" + qnaNo + ", userId=" + userId + ", category=" + category + ", qnaTitle=" + qnaTitle
				+ ", qnaContent=" + qnaContent + ", count=" + count + ", createDate=" + createDate + ", status="
				+ status + "]";
	}

	
	

	
	public QnA(int qnaNo, String qnaTitle, Date createDate) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.createDate = createDate;
	}
	
	
	public QnA(int qnaNo, String userId, String category, String qnaTitle, String qnaContent, int count,
			Date createDate, String status) {
		super();
		this.qnaNo = qnaNo;
		this.userId = userId;
		this.category = category;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
	}

	public QnA(int qnaNo, String category, String qnaTitle, String userId, int count, Date createDate) {
		super();
		this.qnaNo = qnaNo;
		this.category = category;
		this.qnaTitle = qnaTitle;
		this.userId = userId;
		this.count = count;
		this.createDate = createDate;
	}
	
	
	public QnA(int qnaNo, String categoryName, String qnaTitle, String userId, Date createDate) {
		super();
		this.qnaNo = qnaNo;
		this.categoryName = categoryName;
		this.qnaTitle = qnaTitle;
		this.userId = userId;
		this.createDate = createDate;
	}

	public QnA(String qnaTitle, Date createDate) {
		super();
		this.qnaTitle = qnaTitle;
		this.createDate = createDate;
	}



	public QnA(int qnaNo, int userNo, String qnaTitle, String qnaContent, int count, Date createDate, String status,
			String userId, String category) {
		super();
		this.qnaNo = qnaNo;
		this.userNo = userNo;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
		this.userId = userId;
		this.category = category;
	}

	
	
}

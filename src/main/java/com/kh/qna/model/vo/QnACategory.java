package com.kh.qna.model.vo;

public class QnACategory {

	private int categoryNo;
	private String categoryName;

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public QnACategory(int categoryNo, String categoryName) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "QnACategory [categoryNo=" + categoryNo + ", categoryName=" + categoryName + "]";
	}

}

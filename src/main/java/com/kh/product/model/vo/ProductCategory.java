package com.kh.product.model.vo;

public class ProductCategory {

	private int categoryNo;
	private int parentCategoryNo;
	private String categoryName;

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getParentCategoryNo() {
		return parentCategoryNo;
	}

	public void setParentCategoryNo(int parentCategoryNo) {
		this.parentCategoryNo = parentCategoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "ProductCategory [categoryNo=" + categoryNo + ", parentCategoryNo=" + parentCategoryNo
				+ ", categoryName=" + categoryName + "]";
	}

	public ProductCategory(int categoryNo, int parentCategoryNo, String categoryName) {
		super();
		this.categoryNo = categoryNo;
		this.parentCategoryNo = parentCategoryNo;
		this.categoryName = categoryName;
	}

}

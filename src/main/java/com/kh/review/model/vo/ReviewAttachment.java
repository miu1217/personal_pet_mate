package com.kh.review.model.vo;

import java.sql.Date;

public class ReviewAttachment {
	private int fileNo;
	private int reviewNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date createDate;
	private String status;
	
	
	
	public ReviewAttachment() {
		super();
	}



	public ReviewAttachment(int fileNo, int reviewNo, String originName, String changeName, String filePath,
			Date createDate, String status) {
		super();
		this.fileNo = fileNo;
		this.reviewNo = reviewNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.createDate = createDate;
		this.status = status;
	}



	public ReviewAttachment(int fileNo, String originName, String changeName, String filePath) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
	}



	public int getFileNo() {
		return fileNo;
	}



	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}



	public int getReviewNo() {
		return reviewNo;
	}



	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}



	public String getOriginName() {
		return originName;
	}



	public void setOriginName(String originName) {
		this.originName = originName;
	}



	public String getChangeName() {
		return changeName;
	}



	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}



	public String getFilePath() {
		return filePath;
	}



	public void setFilePath(String filePath) {
		this.filePath = filePath;
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
		return "ReviewAttachment [fileNo=" + fileNo + ", reviewNo=" + reviewNo + ", originName=" + originName
				+ ", changeName=" + changeName + ", filePath=" + filePath + ", createDate=" + createDate + ", status="
				+ status + "]";
	}
	
	
}

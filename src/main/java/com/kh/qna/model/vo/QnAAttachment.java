package com.kh.qna.model.vo;

import java.sql.Date;

public class QnAAttachment {
	private int fileNo;
	private int qnaNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date createDate;
	private int fileLevel;
	private String status;

	public QnAAttachment() {
		super();
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
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

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "QnAAttachment [fileNo=" + fileNo + ", qnaNo=" + qnaNo + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", createDate=" + createDate + ", fileLevel=" + fileLevel
				+ ", status=" + status + "]";
	}

	public QnAAttachment(int fileNo, String originName, String changeName, String filePath) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
	}

	public QnAAttachment(int fileNo, int qnaNo, String originName, String changeName, String filePath, Date createDate,
			int fileLevel, String status) {
		super();
		this.fileNo = fileNo;
		this.qnaNo = qnaNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.createDate = createDate;
		this.fileLevel = fileLevel;
		this.status = status;
	}

}

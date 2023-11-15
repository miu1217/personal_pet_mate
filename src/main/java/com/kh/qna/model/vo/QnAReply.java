package com.kh.qna.model.vo;

import java.sql.Date;

public class QnAReply {
	private int qnaReplyNo;
	private int qnaNo;
	private String qnaReplyWriter;
	private String qnaReplyContent;
	private Date creatDate;
	private int status;

	public int getQnaReplyNo() {
		return qnaReplyNo;
	}

	public void setQnaReplyNo(int qnaReplyNo) {
		this.qnaReplyNo = qnaReplyNo;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaReplyWriter() {
		return qnaReplyWriter;
	}

	public void setQnaReplyWriter(String qnaReplyWriter) {
		this.qnaReplyWriter = qnaReplyWriter;
	}

	public String getQnaReplyContent() {
		return qnaReplyContent;
	}

	public void setQnaReplyContent(String qnaReplyContent) {
		this.qnaReplyContent = qnaReplyContent;
	}

	public Date getCreatDate() {
		return creatDate;
	}

	public void setCreatDate(Date creatDate) {
		this.creatDate = creatDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public QnAReply() {
		super();
	}

	public QnAReply(int qnaReplyNo, int qnaNo, String qnaReplyWriter, String qnaReplyContent, Date creatDate) {
		super();
		this.qnaReplyNo = qnaReplyNo;
		this.qnaNo = qnaNo;
		this.qnaReplyWriter = qnaReplyWriter;
		this.qnaReplyContent = qnaReplyContent;
		this.creatDate = creatDate;
	}

	public QnAReply(int qnaReplyNo, int qnaNo, String qnaReplyWriter, String qnaReplyContent, Date creatDate,
			int status) {
		super();
		this.qnaReplyNo = qnaReplyNo;
		this.qnaNo = qnaNo;
		this.qnaReplyWriter = qnaReplyWriter;
		this.qnaReplyContent = qnaReplyContent;
		this.creatDate = creatDate;
		this.status = status;
	}

	@Override
	public String toString() {
		return "QnAReply [qnaReplyNo=" + qnaReplyNo + ", qnaNo=" + qnaNo + ", qnaReplyWriter=" + qnaReplyWriter
				+ ", qnaReplyContent=" + qnaReplyContent + ", creatDate=" + creatDate + ", status=" + status + "]";
	}

}

package com.kh.board.model.vo;

import java.sql.Date;

public class Reply {
	private int replyNo;
	private int boardNo;
	private String replyWriter;
	private String replyContent;
	private Date creatDate;
	private int status;
	
	public Reply() {
		super();
	}
	
	

	public Reply(int replyNo, int boardNo, String replyWriter, String replyContent, Date creatDate) {
		super();
		this.replyNo = replyNo;
		this.boardNo = boardNo;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.creatDate = creatDate;
	}



	public Reply(int replyNo, int boardNo, String replyWriter, String replyContent, Date creatDate,
			int status) {
		super();
		this.replyNo = replyNo;
		this.boardNo = boardNo;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.creatDate = creatDate;
		this.status = status;
	}



	public int getReplyNo() {
		return replyNo;
	}



	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}



	public int getBoardNo() {
		return boardNo;
	}



	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}



	public String getReplyWriter() {
		return replyWriter;
	}



	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}



	public String getReplyContent() {
		return replyContent;
	}



	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
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



	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", boardNo=" + boardNo + ", replyWriter=" + replyWriter + ", replyContent="
				+ replyContent + ", creatDate=" + creatDate + ", status=" + status + "]";
	}





	
	
}

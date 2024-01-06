package com.kh.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

import java.sql.Date;

public class Board {

	private int boardNo;
	private int userNo;
	private int boardType;
	private String boardTitle;
	private String boardContent;
	private int count;
	private Date createDate;
	private String status;
	
	private String boardWriter; //조회시엔 작성자명으로 조회
	private String imgsrc; //자유게시판 사진주소용 
	
	private String userId;
	
	
	
	public Board() {
		super();
	}

	public Board(int boardNo, String boardTitle, String boardWriter, int count, Date createDate) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardWriter = boardWriter;
		this.count = count;
		this.createDate = createDate;
	}

	public Board(int boardNo, String boardTitle, String boardContent, String boardWriter, int count, Date createDate) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.count = count;
		this.createDate = createDate;
	}

	public Board(int boardNo, int boardType, String boardTitle, String userId, Date createDate, int count) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.userId = userId;
		this.createDate = createDate;
		this.count = count;
	}
	
	public Board(int boardNo, int boardType, String boardTitle, String boardContent, String boardWriter, int count,
			Date createDate) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.count = count;
		this.createDate = createDate;
	}

	

	public Board(int boardNo, int userNo, int boardType, String boardTitle, String boardContent, int count,
			Date createDate, String status) {
		super();
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
	}


	
	
	
	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public String getImgsrc() {
		return imgsrc;
	}

	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}

	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getBoardType() {
		return boardType;
	}


	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}


	public String getBoardTitle() {
		return boardTitle;
	}


	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}


	public String getBoardContent() {
		return boardContent;
	}


	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
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
	
	
	
	
	public String getUserId() {
		return userId;
	}

	


	public void setUserId(String userId) {
		this.userId = userId;
	}




	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", userNo=" + userNo + ", boardType=" + boardType + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", count=" + count + ", createDate=" + createDate
				+ ", status=" + status + "]";
	}
	
	
	
	
}

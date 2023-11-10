package com.kh.board.model.vo;

import java.sql.Date;

public class Board {
	private int boardNo; //게시글번호
	private int boardType; //게시글 타입 (1 공지 / 2 자유)
	private String boardTitle; 
	private String boardContent;
	private String boardWriter; //조회시엔 작성자명으로 조회
	private int count; //조회수
	private Date createDate;
	private String status;
	
	private String imgsrc; //자유게시판 사진주소용 
	
	
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



	public Board(String boardTitle, String boardContent, String boardWriter, int count, Date createDate) {
		super();
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.count = count;
		this.createDate = createDate;
	}



	public Board(int boardNo, int boardType, String boardTitle, String boardContent, String boardWriter, int count,
			Date createDate, String status) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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


	public String getBoardWriter() {
		return boardWriter;
	}


	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
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

	

	public String getImgsrc() {
		return imgsrc;
	}


	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}


	@Override
	public String toString() {
		return "Board [게시글번호 : " + boardNo + ", 타입 : " + boardType + ", 제목 : " + boardTitle
				+ ", 내용 : " + boardContent + ", 작성자 : " + boardWriter + ", 조회수 : " + count
				+ ", 작성일 : " + createDate + ", 상태값 : " + status + "]";
	}
	
	
	
	
}

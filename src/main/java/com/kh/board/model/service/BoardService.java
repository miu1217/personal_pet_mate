package com.kh.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Board;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;

public class BoardService {

	

	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ내가 쓴 게시글 개수ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public int boardCount(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		int count =new BoardDao().boardCount(conn,userNo);
		
		JDBCTemplate.close(conn);
		
		return count;
		
	}


  // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ내가 쓴 게시글 페이징처리해서 목록 조회ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public ArrayList<Board> selectMyBoardList(PageInfo pi, int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Board> list = new BoardDao().selectMyBoardList(conn,pi,userNo); 
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	
	
 // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ최근 30일 게시글 5개 정보담기ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public ArrayList<Board> recentMyBoardList(int userNo) {
	
	Connection conn = JDBCTemplate.getConnection();
	ArrayList<Board> list = new BoardDao().recentMyBoardList(conn,userNo); 
	
	JDBCTemplate.close(conn);
	
	return list;
	
	
	}
}

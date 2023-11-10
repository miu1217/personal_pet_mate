package com.kh.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.vo.Board;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		try {
			String filePath = BoardDao.class.getResource("/db/sql/board-mapper.xml").getPath();
			prop.loadFromXML(new FileInputStream(filePath));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 내가 쓴 게시글 총 수 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public int boardCount(Connection conn, int userNo) {
		
		int count= 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("boardCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				count=rset.getInt("COUNT");
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return count;
		
	}

	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ페이징 처리 한 내가 쓴 게시글 정보목록 조회 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public ArrayList<Board> selectMyBoardList(Connection conn, PageInfo pi, int userNo) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectMyBoardList");
		ArrayList<Board> list =new ArrayList<>();
		
		
		int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit() +1;
		int endRow = pi.getCurrentPage()*pi.getBoardLimit();
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			System.out.println(userNo);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO")
						,rset.getInt("BOARD_TYPE")
						,rset.getString("BOARD_TITLE")
						,rset.getString("USER_ID")
						,rset.getDate("CREATE_DATE")
						,rset.getInt("COUNT")));
			}
			
			//System.out.println(list);
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}


		
		
		return list;
		
	}
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡ최근 30일동안 작성한 게시글 5개 정보 조회ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public ArrayList<Board> recentMyBoardList(Connection conn,int userNo) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("recentMyBoardList");
		ArrayList<Board> list =new ArrayList<>();
		
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);	
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO")
						,rset.getInt("BOARD_TYPE")
						,rset.getString("BOARD_TITLE")
						,rset.getString("USER_ID")
						,rset.getDate("CREATE_DATE")
						,rset.getInt("COUNT")));
			}
			
			//System.out.println(list);
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}


		
		
		return list;
	}
	
	
	
	
	
	
	
}


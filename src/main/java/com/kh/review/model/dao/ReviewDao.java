package com.kh.review.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.review.model.vo.Review;

public class ReviewDao {
	private Properties prop = new Properties();
	//review 매퍼파일 읽어오기
	public ReviewDao() {
		try {
			//경로 설정할때 /db로 안하고 db라 해서 오류남 why?뭔차이?
			String filePath = ReviewDao.class.getResource("/db/sql/review-mapper.xml").getPath();
			prop.loadFromXML(new FileInputStream(filePath));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	



	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ내가 쓴 리뷰 총 갯수ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public int reviewCount(Connection conn, int userNo) {
		
		int count=0;
		ResultSet rset =null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reviewCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT");
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



	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ페이징 처리 한 내가 쓴 리뷰 정보목록 조회 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public ArrayList<Review> selectMyReviewList(Connection conn, PageInfo pi, int userNo) {
		//내 회원번호를 가지고 리뷰번호를 조회하는거니깐 select문 
				ResultSet rset = null;
				PreparedStatement pstmt = null;
				String sql = prop.getProperty("selectMyReviewList");
				ArrayList<Review> list =new ArrayList<>();
				
				int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit() +1;
				int endRow = pi.getCurrentPage()*pi.getBoardLimit();
				
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, userNo);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, endRow);
					
					rset = pstmt.executeQuery();
					
					while(rset.next()) {
						list.add(new Review(rset.getString("TITLEIMG")
								,rset.getString("PRODUCT_NAME")
								,rset.getString("USER_ID")
								,rset.getDate("CREATE_DATE")));
					}

					//System.out.println("Dao");
				//	System.out.println(list);  //아무것도 담기지않았음
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally{
					JDBCTemplate.close(rset);
					JDBCTemplate.close(pstmt);
				}
				return list;
	}








	




	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡ최근 30일동안 작성한 게시글 5개 정보 조회ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public ArrayList<Review> recentMyReviewList(Connection conn, int userNo) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("recentMyReviewList");
		ArrayList<Review> list =new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(rset.getString("TITLEIMG")
						,rset.getString("PRODUCT_NAME")
						,rset.getString("USER_ID")
						,rset.getDate("CREATE_DATE")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}
	


}

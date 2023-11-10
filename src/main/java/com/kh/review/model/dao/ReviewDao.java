package com.kh.Review.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.Review.model.vo.Review;
import com.kh.common.JDBCTemplate;

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
	
	
	
	
	public ArrayList<Review> selectMyReviewList(Connection conn, int userNo) {
		//내 회원번호를 가지고 리뷰번호를 조회하는거니깐 select문 
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMyReviewList");
		ArrayList<Review> list =new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(rset.getString("TITLEIMG")
						,rset.getString("PRODUCT_NAME")
						,rset.getString("USER_ID")
						,rset.getDate("CREATE_DATE")
						,rset.getInt("COUNT")));
			}
			
			System.out.println(list);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

}

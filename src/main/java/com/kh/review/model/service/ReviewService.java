package com.kh.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.review.model.dao.ReviewDao;
import com.kh.review.model.vo.Review;

public class ReviewService {

	

	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ내가 쓴 리뷰 총 개수ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public int reviewCount(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		int count= new ReviewDao().reviewCount(conn,userNo);
		
		JDBCTemplate.close(conn);
		
		return count;
	}

	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ내가 쓴 리뷰 목록 조회
	public ArrayList<Review> selectMyReviewList(PageInfo pi, int userNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Review> list = new ReviewDao().selectMyReviewList(conn,pi,userNo);
		
		JDBCTemplate.close(conn);
		
		return list;
	}



	
	
	
	
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ최근 30일 리뷰 5개 정보담기
	public ArrayList<Review> recentMyReviewList(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Review> list = new ReviewDao().recentMyReviewList(conn,userNo); 
			
		JDBCTemplate.close(conn);
		
		
		return list;
	}


	

}

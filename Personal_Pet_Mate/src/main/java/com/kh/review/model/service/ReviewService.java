package com.kh.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.review.model.dao.ReviewDao;
import com.kh.review.model.vo.Review;
import com.kh.review.model.vo.ReviewAttachment;

public class ReviewService {

	

	public int insertReview(Review r, ReviewAttachment at) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		//리뷰 글 입력
		int result = new ReviewDao().insertReview(conn, r);
		
		int result2 = 1;
		if(at != null) {
			result2 = new ReviewDao().insertReviewAttachment(conn, at);
			
		}
		
		
		if(result*result2 > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result*result2;
	}

	public int increaseCount(int productNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ReviewDao().increaseCount(conn, productNo);
		
		
		JDBCTemplate.close(conn);
		return result;
	}

	public Review selectReview(int reviewNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		Review r = new ReviewDao().selectReview(conn, reviewNo);
		
		JDBCTemplate.close(conn);
		return r;
	}

	public ReviewAttachment selectRvAttachment(int reviewNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		ReviewAttachment ra = new ReviewDao().selectRvAttachment(conn, reviewNo);
		

		JDBCTemplate.close(conn);
		return ra;
	}

	
	//리뷰 작성한게 있는지 확인하는 용도
	public Review reviewValidate(int productNo, int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		Review r = new ReviewDao().reviewValidate(conn, productNo, userNo);
		
		JDBCTemplate.close(conn);
		return r;
	}

	public int updateReview(Review r, ReviewAttachment at) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ReviewDao().updateReview(conn, r);
		
		int result2 = 1;
		
		if(at.getFileNo() != 0) {
			
			result2 = new ReviewDao().updateReviewAttachment(conn, at);
		}else {
			result2 = new ReviewDao().insertNewAttachment(conn, at);
		}
		
		if(result*result2>0) { //둘중하나라도 0이면 0일테니 성공여부 확인가능 
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result*result2;
	}

	public Review selectUpdateReview(int reviewNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		Review r = new ReviewDao().selectUpdateReview(conn, reviewNo);
		
		JDBCTemplate.close(conn);
		return r;
	}

	public int deleteReview(int reviewNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ReviewDao().deleteReview(conn, reviewNo);
		
		int result2 = new ReviewDao().deleteReviewAttachment(conn, reviewNo);
		
		if(result*result2 > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		
		JDBCTemplate.close(conn);
		return result*result2;
	}

	public ArrayList<Review> selectReviewList(int pno, int startIndex, int reviewsPage) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Review> prList = new ReviewDao().selectReviewList(conn, pno, startIndex, reviewsPage);
		
		JDBCTemplate.close(conn);
		return prList;
	}

	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ마이페이지 영역ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
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

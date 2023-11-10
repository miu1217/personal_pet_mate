package com.kh.Review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.Review.model.dao.ReviewDao;
import com.kh.Review.model.vo.Review;
import com.kh.common.JDBCTemplate;

public class ReviewService {

	public ArrayList<Review> selectMyReviewList(int userNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Review> list =new ReviewDao().selectMyReviewList(conn,userNo);
		
		JDBCTemplate.close(conn);
		
		
		
		
		return list;
	}

	

}

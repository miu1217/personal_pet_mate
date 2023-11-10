package com.kh.qna.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.qna.model.dao.QnADao;
import com.kh.qna.model.vo.QnA;

public class QnAService {

	
	public int qnaCount(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		int count =new QnADao().qnaCount(conn,userNo);
		
		JDBCTemplate.close(conn);
		
		return count;
	}

	public ArrayList<QnA> selectMyQnAList(PageInfo pi, int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<QnA> list = new QnADao().selectMyQnAList(conn,pi,userNo); 
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	

}

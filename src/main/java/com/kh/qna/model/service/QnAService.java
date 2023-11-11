package com.kh.qna.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.qna.model.dao.QnADao;
import com.kh.qna.model.vo.QnA;
import com.kh.qna.model.vo.QnAAttachment;

public class QnAService {

	Connection conn = JDBCTemplate.getConnection();

	public int listCount() {

		int count = new QnADao().listCount(conn);

		JDBCTemplate.close(conn);

		return count;
	}

	public ArrayList<QnA> selectList(PageInfo pi, int cno) {

		ArrayList<QnA> qlist = new QnADao().selectList(conn, pi, cno);

		return qlist;

	}

	public ArrayList<QnA> selectListAll(PageInfo pi) {

		ArrayList<QnA> qlist = new QnADao().selectListAll(conn, pi);

		return qlist;

	}

	public int increaseCount(int qno) {

		int result = new QnADao().increaseCount(conn, qno);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return result;
	}

	public QnA selectQna(int qno) {
		
		QnA q = new QnADao().selectQna(conn, qno);

		return q;
	}

	public QnAAttachment selectQnaAttachment(int qno) {

		QnAAttachment at = new QnADao().selectQnaAttachment(conn, qno);

		JDBCTemplate.close(conn);

		return at;
	}

	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ마이페이지 영역ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	

	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ내가 쓴 QnA 수ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public int qnaCount(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		int count =new QnADao().qnaCount(conn,userNo);
		
		JDBCTemplate.close(conn);
		
		return count;
	}

	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ내가 쓴 QnA 페이징처리해서 목록 조회
	public ArrayList<QnA> selectMyQnAList(PageInfo pi, int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<QnA> list = new QnADao().selectMyQnAList(conn,pi,userNo); 
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ최근 30일 QnA 5개 정보담기ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public ArrayList<QnA> recentMyQnAList(int userNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<QnA> list = new QnADao().recentMyQnAList(conn,userNo); 
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	
	
	
	
}

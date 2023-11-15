package com.kh.qna.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.vo.Attachment;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.qna.model.dao.QnADao;
import com.kh.qna.model.vo.QnA;
import com.kh.qna.model.vo.QnAAttachment;
import com.kh.qna.model.vo.QnACategory;
import com.kh.qna.model.vo.QnAReply;

public class QnAService {

	Connection conn = JDBCTemplate.getConnection();

	public int listCount(int cno) {

		int count = new QnADao().listCount(conn, cno);

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
	
	public int insertQna(QnA q, Attachment at) {

		int result = new QnADao().insertQna(conn, q);

		int result2 = 1;

		if (at != null) {
			result2 = new QnADao().insertQnaAttachment(conn, at);
		}

		if (result * result2 > 0) {

			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		return result * result2;
	}

	public ArrayList<QnACategory> selectQnACategory() {
		ArrayList<QnACategory> qlist = new QnADao().selectQnACategory(conn);

		JDBCTemplate.close(conn);

		return qlist;
	}

	public int insertQnAReply(QnAReply qr) {

		int result = new QnADao().insertReply(conn, qr);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return result;
	}

	public ArrayList<QnAReply> selectReplyList(int qno) {

		ArrayList<QnAReply> qrlist = new QnADao().selectReplyList(conn, qno);

		JDBCTemplate.close(conn);

		return qrlist;
	}

	public int updateReply(int replyNo, String updateReply) {
		int result = new QnADao().updateReply(conn, replyNo, updateReply);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		return result;
	}

	public int deleteReply(int replyNo) {
		int result = new QnADao().deleteReply(conn, replyNo);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		return result;
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

	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ답변 달렸는지 확인버튼ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public int replyChk(int userNo,int qnaNo) {
		Connection conn = JDBCTemplate.getConnection();
		int replyChk=new QnADao().replyChk(conn,userNo,qnaNo);
		
		return replyChk;
	}
	//--------------QnA 답변 리스트 받아오기 -----------------------
	public ArrayList<QnA> getReplyQnAList(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<QnA> list = new QnADao().getReplyQnAList(conn,userNo);
		JDBCTemplate.close(conn);
		return list;
	}
	
	
	
	
	
}

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

}

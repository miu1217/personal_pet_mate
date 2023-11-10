package com.kh.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.PagingBar;
import com.kh.common.JDBCTemplate;

public class BoardService {

	// 페이징바 처리
	public int listCount() {
		Connection conn = JDBCTemplate.getConnection();

		int count = new BoardDao().listCount(conn);

		JDBCTemplate.close(conn);

		return count;
	}

	// 전체게시글 조회
	public ArrayList<Board> selectList(PagingBar pb) {
		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Board> list = new BoardDao().selectList(conn, pb);

		JDBCTemplate.close(conn);
		return list;
	}

	// 공지게시판 조회
	public ArrayList<Board> selecNtList(PagingBar pb) {
		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Board> nlist = new BoardDao().selecNtList(conn, pb);

		JDBCTemplate.close(conn);

		return nlist;
	}

//자유게시판 목록조회
	public ArrayList<Board> selecFList(PagingBar pb) {
		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Board> flist = new BoardDao().selecFList(conn, pb);

		JDBCTemplate.close(conn);

		return flist;
	}

//조회수증가
	public int increaseCount(int bno) {
		Connection conn = JDBCTemplate.getConnection();

		int result = new BoardDao().increaseCount(conn, bno);

		JDBCTemplate.close(conn);
		return result;
	}

//게시판상세보기
	public Board detailBoard(int bno) {
		Connection conn = JDBCTemplate.getConnection();

		Board b = new BoardDao().detailBoard(conn, bno);

		JDBCTemplate.close(conn);

		return b;
	}

//게시판 이미지 불러오기
	public Attachment selectAttachmentList(int bno) {
		Connection conn = JDBCTemplate.getConnection();

		Attachment at = new BoardDao().selectAttachment(conn, bno);

		// 조회구문이니 트랜잭션 처리는 필요하지 않다.
		// 자원반납 처리만 할것.
		JDBCTemplate.close(conn);

		return at; // 조회해온 첨부파일 정보
	}

	// 자유게시판 글작성
	public int insertBoard(Board b, Attachment at) {
		Connection conn = JDBCTemplate.getConnection();

		int result = new BoardDao().insertBoard(conn, b);

		int result2 = 1;

		if (at != null) {
			result2 = new BoardDao().insertAttachment(conn, at);
		}

		if (result * result2 > 0) {

			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		return result * result2;
	}

	// 공지사항 작성
	public int insertNotice(Board b) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().insertNotice(conn, b);

		JDBCTemplate.close(conn);

		return result;
	}

}

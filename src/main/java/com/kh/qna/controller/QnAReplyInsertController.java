package com.kh.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.qna.model.service.QnAService;
import com.kh.qna.model.vo.QnAReply;

/**
 * Servlet implementation class QnAReplyInsertController
 */
@WebServlet("/mate.insertQnaReply")
public class QnAReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QnAReplyInsertController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		int qno = Integer.parseInt(request.getParameter("qno"));
		String content = request.getParameter("content");
		Member loginUser = (Member) request.getSession().getAttribute("loginUser"); // 로그인 정보
		int replyWriter = loginUser.getUserNo();

		QnAReply qr = new QnAReply();
		qr.setQnaNo(qno);
		qr.setQnaReplyContent(content);
		qr.setQnaReplyWriter(String.valueOf(replyWriter));

		// INSERT (DML) - 처리된 결과 행수
		int result = new QnAService().insertQnAReply(qr);

		// 처리결과에 따른 화면요소는 view에서 결정하기
		response.getWriter().print(result);
	}

}

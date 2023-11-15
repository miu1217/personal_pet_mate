package com.kh.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.model.service.BoardService;
import com.kh.qna.model.service.QnAService;

/**
 * Servlet implementation class QnADeleteController
 */
@WebServlet("/mate.qnaDelete")
public class QnADeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QnADeleteController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int qno = Integer.parseInt(request.getParameter("qno"));

		int result = new QnAService().deleteBoard(qno);

		HttpSession session = request.getSession();

		String before = request.getHeader("referer");
		if (result > 0) {
			session.setAttribute("message", "게시글이 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/mate.qna?currentPage=1&category=0");
		} else {
			session.setAttribute("message", "게시글 삭제 실패");
			response.sendRedirect(before);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

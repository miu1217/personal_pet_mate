package com.kh.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.qna.model.service.QnAService;
import com.kh.qna.model.vo.QnA;
import com.kh.qna.model.vo.QnAAttachment;

/**
 * Servlet implementation class QnADetailController
 */
@WebServlet("/mate.qnaDetail")
public class QnADetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QnADetailController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int qno = Integer.parseInt(request.getParameter("qno"));
		
		int result = new QnAService().increaseCount(qno);
		
		if (result > 0) {
			QnA q = new QnAService().selectQna(qno);
			QnAAttachment at = new QnAService().selectQnaAttachment(qno);
		
			request.setAttribute("q", q);
			request.setAttribute("at", at);
			request.getRequestDispatcher("views/qna/qnaDetailView.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("alert", "게시글 조회 실패");
			response.sendRedirect(request.getHeader("referer"));
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

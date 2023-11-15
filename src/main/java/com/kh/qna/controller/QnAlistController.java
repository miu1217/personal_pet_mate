package com.kh.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.qna.model.service.QnAService;
import com.kh.qna.model.vo.QnA;

/**
 * Servlet implementation class QnAlistController
 */
@WebServlet("/mate.qna")
public class QnAlistController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QnAlistController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int listCount; // 총 게시글
		int currentPage; // 현재 페이지
		int pageLimit; // 페이징바 최대수
		int boardLimit; // 한페이지에 보여줄 글 수

		int maxPage; // 총 페이지 수
		int startPage; // 페이징 시작수
		int endPage; // 페이징 끝수

		int cno;

		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		try {
			cno = Integer.parseInt(request.getParameter("category"));

		} catch (NumberFormatException e) {
			e.printStackTrace();
			cno = 0;
		}

		listCount = new QnAService().listCount(cno);
		System.out.println(cno);

		pageLimit = 10;
		boardLimit = 10;

		maxPage = (int) Math.ceil((double) listCount / pageLimit);
		startPage = (currentPage - 1) / boardLimit * boardLimit + 1;

		endPage = startPage + boardLimit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		ArrayList<QnA> qlist = null;
		if (cno != 0) {
			qlist = new QnAService().selectList(pi, cno);
		} else {
			qlist = new QnAService().selectListAll(pi);
		}

		request.setAttribute("qlist", qlist);
		request.setAttribute("pi", pi);

		request.getRequestDispatcher("views/qna/qnaListView.jsp").forward(request, response);
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

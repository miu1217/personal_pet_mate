package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;

/**
 * Servlet implementation class NoticeInsertController
 */
@WebServlet("/pet.insertNo")
public class InsertNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertNoticeController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("views/board/noticeInsert.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

			int nType = 1;
			String nWriter = request.getParameter("userNo");
			String nTitle = request.getParameter("title");
			String nContent = request.getParameter("content");

			Board b = new Board();
			b.setBoardType(nType);
			b.setBoardWriter(nWriter);
			b.setBoardTitle(nTitle);
			b.setBoardContent(nContent);

			// 게시글 정보와 첨부파일 정보 전달
			int result = new BoardService().insertNotice(b);

			if (result > 0) { // 성공
				session.setAttribute("message", "게시글이 등록되었습니다.");

				response.sendRedirect(request.getContextPath() + "/pet.boardMain?currentPage=1");

			} else { // 실패
				session.setAttribute("message", "게시글 등록 실패");
				response.sendRedirect(request.getContextPath() + "/pet.boardMain?currentPage=1");
			}

		}

	}



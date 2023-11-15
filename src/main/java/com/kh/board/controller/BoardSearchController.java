package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;

/**
 * Servlet implementation class BoardSearchController
 */
@WebServlet("/pet.boardSearch")
public class BoardSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String searchType = request.getParameter("searchType");
			 ArrayList<Board> slist = null;
			
			
			HttpSession session = request.getSession();
			
			//System.out.println(searchText);
			if("title".equals(searchType)) {
				String titleKeyword = request.getParameter("searchInput");
				slist = new BoardService().searchByTitle(titleKeyword);
			
			}else if("content".equals(searchType)) {
				String contentKeyword = request.getParameter("searchInput");
				slist = new BoardService().searchByContent(contentKeyword);
			}else{
				String searchText = request.getParameter("searchInput");
				slist = new BoardService().boardSearch(searchText);
			}
			
			
			session.setAttribute("slist", slist);
			
			request.getRequestDispatcher("views/board/searchPage.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}

}

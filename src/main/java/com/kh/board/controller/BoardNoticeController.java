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
import com.kh.board.model.vo.PagingBar;

/**
 * Servlet implementation class BoardNoticeController
 */
@WebServlet("/pet.notice")
public class BoardNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardNoticeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount ; // 총 게시글 개수
		int currentPage ; // 현재 페이지
		int pageLimit ; //  페이징바의 최대 개수
		int boardLimit ; //한 페이지에 보여질 게시글 개수
		
		int maxPage ; // 가장 마지막 페이징바 (총 페이지 수)
		int startPage ; //페이지 하단에 보여질 페이징바의 시작수
		int endPage ; //페이지 하단에 보여질 페이징바의 끝수
		
		//listCount 현재 게시글 개수
		listCount = new BoardService().listCount(); //게시글 개수 조회해오기
		//현재페이지 정보(번호)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		//페이지 하단에 보여질 페이징바 개수
		pageLimit = 10;
		//한 페이지에 보여질 게시글 개수
		boardLimit = 10;
		//최대페이지
		maxPage = (int)Math.ceil((double)listCount/boardLimit);

		//시작페이지
		startPage = (currentPage - 1)/pageLimit * pageLimit + 1;
		
		//마지막 페이지
		endPage = startPage + pageLimit - 1;
		
		//끝페이지
		if(maxPage<endPage) { 
			endPage = maxPage;
		}
		
		PagingBar pb = new PagingBar(listCount, currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
		
		ArrayList<Board> nlist = new BoardService().selecNtList(pb);
		
		HttpSession session = request.getSession();
		session.setAttribute("nlist", nlist);
		session.setAttribute("pb", pb);
		
		
		request.getRequestDispatcher("views/board/noticePage.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

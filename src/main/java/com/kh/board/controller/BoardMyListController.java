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
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class BoardMyListController
 */
@WebServlet("/pet.myBoardList")
public class BoardMyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardMyListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//ㅡㅡㅡㅡㅡㅡㅡ게시물 관리에 페이징처리ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		int currentPage;    //현재페이지
		int startPage;      //첫페이지
		int endPage; 	    //끝페이지
		int boardCount;      //총 게시글 수
		int maxPage;        //가장 마지막 페이지
		int boardLimit=7;     //보여줄 게시물 갯수(몇개씩 보여줄건지)
		int pageLimit=5; 		//페이지 최대개수(몇페이지로 끊을건지)
		
		/*
		 * pageLimit이 5인경우
		 * currentPage     startPage
		 * 	1					1
		 *  2					1
		 *  3					1
		 *  4					1
		 *  5					1
		 *  6					6
		 *  7					6
		 *  8					6
		 *  9					6
		 *  10					6
		 *  11					11
		 *  
		 *  1~5     1
		 *  6~10    6
		 *  11~15   11
		 *  
		 *  0/5    0*pageLimit(5) = 0 + 1 = 1
		 *  5/5    1*pageLimit(5) = 5 + 1 = 6
		 *  10/5   2*pageLimit(5) = 10 + 1 = 11
		 *  15/5   3*pageLimit(5) = 15 + 1 = 16
		 *  ==> (currentPage - 1) / pageLimit(5) * pageLimit + 1
		 *  
		 *  startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		 *  
		 *  endPage 끝페이지
		 *  1  5  /  6  10  / 11  15 / 16  20
		 *  startPage + pageLimit(5) -1 == 5 10 15  
		 *  
		 *  
		 */
		
		
		
		
		
		
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		//System.out.println(userNo); //잘담김
		
		
		//-----내가 쓴 총 게시글 수 가져오기 (userNo를 전달해주기)
		boardCount = new BoardService().boardCount(userNo);
		//System.out.println(boardCount); //잘담김
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		//System.out.println(currentPage); 잘담김
		
		//가장 끝 페이지 : (총 게시글 개수 / 한페이지에서 보여줄 개수)의 나머지를 올림처리 
		maxPage = (int)Math.ceil((double)boardCount/boardLimit);
		
		
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit -1; 
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(boardCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
		
		ArrayList<Board> list= new BoardService().selectMyBoardList(pi,userNo);
		
//		System.out.println(list);
//		for(Board b : list) {
//			System.out.println(b);
//		}
		
		//내가 쓴 게시글들이 담긴 정보리스트를 Attribute영역에 담기
		request.setAttribute("bList", list);
		request.setAttribute("pi", pi);
		
		//마이페이지에서 아이콘 밑에 갯수 표현하기위해 작성
		session.setAttribute("boardCount", boardCount);
		
		//System.out.println(list);  //잘담김
		
		request.getRequestDispatcher("views/board/myBoardList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

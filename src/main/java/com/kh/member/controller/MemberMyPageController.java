package com.kh.member.controller;

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
import com.kh.member.model.vo.Member;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class MemberMyPageController
 */
@WebServlet("/pet.myPage")
public class MemberMyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMyPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		ArrayList<Board> bList= new BoardService().recentMyBoardList(userNo);
		ArrayList<Review> rList= new ReviewService().recentMyReviewList(userNo);
		
		
		//list에 최신게시글 잘담김
//		for(Board b : list) {
//			System.out.println(b);
//		}
	
		
//		for(Review r : rList) {
//			System.out.println(r);
//		}
		
		
		request.setAttribute("bList", bList);
		request.setAttribute("rList", rList);
		
		request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.kh.Review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.Review.model.service.ReviewService;
import com.kh.Review.model.vo.Review;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ReviewMyListController
 */
@WebServlet("/pet.myReview")
public class ReviewMyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewMyListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//내 리뷰만 검색하기위해서 select로 회원번호를 전달해서 내 리뷰만 검색하기 
		//회원번호 인풋에서 숨겨서 전달하기 or 세션에서 꺼내오기?
		
		
		
		
		
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		//System.out.println(userNo); userNo 잘가져옴
		
		ArrayList<Review> list= new ReviewService().selectMyReviewList(userNo);
		//리뷰리스트 : rList에다가 가져올 정보들을 저장함
		System.out.println(list);  // 아무것도 작성안했어서 빈공간이 뜸
		request.setAttribute("rList", list);   
		
		
		request.getRequestDispatcher("views/review/myReviewList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

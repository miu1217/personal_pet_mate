package com.kh.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.Member;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;

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

		
		
		//ㅡㅡㅡㅡㅡㅡㅡ리뷰 관리에 페이징처리ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		int currentPage;    //현재페이지
		int startPage;      //첫페이지
		int endPage; 	    //끝페이지
		int reviewCount;      //총 리뷰 수
		int maxPage;        //가장 마지막 페이지
		int reviewLimit=7;     //보여줄 리뷰 갯수(몇개씩 보여줄건지)
		int pageLimit=5; 		//페이지 최대개수(몇페이지로 끊을건지)
				
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		
		//System.out.println(userNo);
		//System.out.println("유저번호 : "+userNo); //userNo 잘가져옴
		
		//-----내가 쓴 총 리뷰 수 가져오기 (userNo를 전달해주기)
		reviewCount = new ReviewService().reviewCount(userNo);
	//	System.out.println("리뷰수 : "+reviewCount); //잘담김
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		//System.out.println("현재페이지 : "+currentPage); //잘담김
				
		//가장 끝 페이지 : (총 게시글 개수 / 한페이지에서 보여줄 개수)의 나머지를 올림처리 
		maxPage = (int)Math.ceil((double)reviewCount/reviewLimit);
		
				
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit -1; 
				
		if(maxPage<endPage) {
				endPage = maxPage;
			}
		PageInfo pi = new PageInfo(reviewCount,currentPage,pageLimit,reviewLimit,maxPage,startPage,endPage);
		//System.out.println("pageInfo 객체 : "+pi);
		
		
		
		
		ArrayList<Review> list= new ReviewService().selectMyReviewList(pi,userNo);
		//리뷰리스트 : rList에다가 가져올 정보들을 저장함

		//System.out.println("controller");

		System.out.println(list);
		for(Review r : list) {
			System.out.println("rlist는 : "+r);
		}
		
		request.setAttribute("rList", list);   
		request.setAttribute("pi", pi);
		
		session.setAttribute("reviewCount", reviewCount);
		
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


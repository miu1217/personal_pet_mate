package com.kh.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class ReviewListController
 */
@WebServlet("/pet.review")
public class ReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		
		int page = Integer.parseInt(request.getParameter("page"));
		  
		int reviewsPage = 2;
		
		
		int startIndex = (page - 1) * reviewsPage + 1;
		
			
		//상품리뷰가져오기
		// Fetch reviews based on the start index and number of reviews to display
		ArrayList<Review> prList = new ReviewService().selectReviewList(pno, startIndex, reviewsPage);
		System.out.println("오홍 오류 안났네 ");
		
		System.out.println(prList);
		 response.setContentType("application/json; charset=UTF-8");
		 new Gson().toJson(prList,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

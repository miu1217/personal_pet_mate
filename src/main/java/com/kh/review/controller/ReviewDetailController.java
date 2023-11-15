package com.kh.review.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;
import com.kh.review.model.vo.ReviewAttachment;

/**
 * Servlet implementation class ReviewDetailController
 */
@WebServlet("/pet.detail.r")
public class ReviewDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reviewNo = Integer.parseInt(request.getParameter("rno"));
		
		
		
		ReviewService rs = new ReviewService();
		
		
		int result = rs.increaseCount(reviewNo);
		
		HttpSession session = request.getSession();
		if(result > 0) {
			
			Review r  = rs.selectReview(reviewNo);
			

			ReviewAttachment ra = rs.selectRvAttachment(reviewNo);
			
			System.out.println(ra);
			request.setAttribute("r", r);
			request.setAttribute("ra", ra);
			
			request.getRequestDispatcher("views/review/reviewDetailView.jsp").forward(request, response);
		}else {
			session.setAttribute("message", "상품 상세페이지 접근 실패하셨습니다.");
			
			//이전페이지로
			response.sendRedirect(request.getHeader("referer"));
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

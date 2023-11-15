package com.kh.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.kh.admin.model.service.AdminService;
import com.kh.member.model.vo.Member;
import com.kh.product.model.vo.Product;
import com.kh.product.model.vo.ProductAttachment;

/**
 * Servlet implementation class AdminProductDetailController
 */
@WebServlet("/pet.admin.detail.pd")
public class AdminProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		if(userId.equals("admin")) {
		
			int productNo = Integer.parseInt(request.getParameter("pno"));
			
			AdminService aps = new AdminService();
			
			//조회수 증가 처리(update 구문일테니 int로 받기)
			int result = aps.increaseCount(productNo);
			
			if(result > 0) {
				Product p = aps.selectProduct(productNo);
				ArrayList<ProductAttachment> phList = aps.selectProductAttachmentList(productNo);
				
				
				request.setAttribute("p", p);
				request.setAttribute("phList", phList);
				
				request.getRequestDispatcher("views/admin/adminProductDetailView.jsp").forward(request, response);
			}else {
				session.setAttribute("message", "상품 상세페이지 접근 실패하셨습니다.");
				
				//이전페이지로
				response.sendRedirect(request.getHeader("referer"));
			}
		}else {
			request.setAttribute("message", "관리자만 들어올 수 있는 공간임 나가");
			response.sendRedirect(request.getContextPath());
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

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

/**
 * Servlet implementation class AdminProductListController
 */
@WebServlet("/pet.admin.list.pd")
public class AdminProductListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductListController() {
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
			
				
			ArrayList<Product> phList = new AdminService().selectListProduct();
	
			request.setAttribute("phList", phList);
			request.getRequestDispatcher("views/admin/adminProductListView.jsp").forward(request, response);
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

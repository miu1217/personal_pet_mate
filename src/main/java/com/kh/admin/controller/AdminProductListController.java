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
import com.kh.common.model.vo.PageInfo;
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
		int listCount; // 총 게시글 개수
		int currentPage; // 현재 페이지
		int pageLimit; // 페이지 하단에 보여질 페이징바의 최대 개수
		int boardLimit; // 한페이지에 보여질 게시글 개수

		int maxPage; // 가장 마지막 페이징바가 몇번인지 (총 페이지수)
		int startPage; // 페이지 하단에 보여질 페이징바의 시작수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝수

		// listCount 현재 게시글 개수
		listCount = new AdminService().listCount(); // 게시글 개수 조회해오기
		// 현재페이지 정보(번호)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		// 페이지 하단에 보여질 페이징바 개수
		pageLimit = 10;
		// 한 페이지에 보여질 게시글 개수
		boardLimit = 9;
		
		maxPage = (int) Math.ceil((double) listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		// endPage 페이징바 끝페이지
		// 1 10 / 11 20 / 21 30
		// startPage + pageLimit - 1
		endPage = startPage + pageLimit - 1;

		// 게시글 개수가 107 - maxPage == 20
		// startPage 11 + 10 -1 endPage == 21
		// 11 7
		//startPage11 ....... endPage 20
		// 현재 페이지의 페이징바 끝페이지(endPage)가 maxPage(총페이지 끝수)보다 클때
		// 끝페이지값을 maxPage값으로 바꾸기
		if (maxPage < endPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
			
				
			ArrayList<Product> phList = new AdminService().selectListProduct(pi);
	
			request.setAttribute("phList", phList);
			request.setAttribute("pi", pi);
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

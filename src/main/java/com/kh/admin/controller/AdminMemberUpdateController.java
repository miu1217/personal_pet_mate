package com.kh.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.admin.model.service.AdminService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberUpdateController
 */
@WebServlet("/pet.admin.update.m")
public class AdminMemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberUpdateController() {
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
			
			int userNo = Integer.parseInt(request.getParameter("uno"));
			
			Member m = new AdminService().selectMember(userNo);
			
			request.setAttribute("m", m);
			request.getRequestDispatcher("views/admin/adminMemberUpdateView.jsp").forward(request, response);
		}else {
			request.setAttribute("message", "관리자만 들어올 수 있는 공간임 나가");
			response.sendRedirect(request.getContextPath());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request  , HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		Member m = new Member();
		m.setUserNo(userNo);
		m.setUserId(userId);
		m.setUserName(userName);
		m.setGender(gender);
		m.setPhone(phone);
		m.setEmail(email);
		m.setAddress(address);
		
		Member updateMem = new AdminService().updateMember(m);
		

		HttpSession session = request.getSession();
		if(updateMem == null) {
			session.setAttribute("message","회원정보 수정에 실패했습니다."); 
			request.getRequestDispatcher("views/admin/adminMemberDetailView.jsp").forward(request, response);
		}else {
			
			request.setAttribute("m", updateMem);
			

			session.setAttribute("message","회원정보 수정에 성공했습니다.");
			request.getRequestDispatcher("views/admin/adminMemberDetailView.jsp").forward(request, response);
		}
		
		
	}

}

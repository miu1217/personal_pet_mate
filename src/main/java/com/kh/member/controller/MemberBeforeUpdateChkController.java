package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberBeforeUpdateChkController
 */
@WebServlet("/pet.beforeUpdateChk")  
public class MemberBeforeUpdateChkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberBeforeUpdateChkController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get방식에서 비밀번호 확인해서 회원정보변경해주는 페이지로 전달해주기
		request.getRequestDispatcher("views/member/beforeUpdateChk.jsp").forward(request, response);
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//페이지에서 비밀번호를 입력했으니깐 그 비밀번호가 현재로그인된 비밀번호가 일치하면 회원정보수정페이지로 이동시키기
//		String userPwd = request.getParameter("userPwd");
//		String loginUserPwd = request.getParameter("loginUser.userPwd");
//		
//		if(userPwd.equals(loginUserPwd)) {
//			request.getRequestDispatcher("views/member/updateForm.jsp");
//		}else {
//			request.setAttribute("message", "오류 발생");
//		}
		
		doGet(request, response);
		
	}
	

}

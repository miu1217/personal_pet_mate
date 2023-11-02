package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginController
 */
@WebServlet("/pet.login")
public class MemberLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/member/loginPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			request.setCharacterEncoding("UTF-8");
			
			String userId = request.getParameter("userId");
			String userPwd = request.getParameter("userPwd");
			String saveId = request.getParameter("saveId");
			Cookie cookie = null;
			
//			System.out.println(userId);
//			System.out.println(userPwd);
//			System.out.println(saveId); 
			
			//쿠키 체크가 되어 넘어왔다면
			if(saveId != null && saveId.equals("on")) {
				//쿠키의 이름과 값을 넣어서 생성하기
				cookie = new Cookie("userId", userId);
				//쿠키의 수명을 정해서 추가한다.
				cookie.setMaxAge(60*60*24); //하루 : 60*60*24 (초단위) (초*분*시간)
				//응답객체인 response에 쿠키 추가하기
				response.addCookie(cookie);
			}else { //체크되지 않았다면
				//쿠키 지워주기
				cookie = new Cookie("userId", null);
				//수명을 0으로 만들어주기
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				
			}
			
			Member loginUser = new MemberService().loginUser(userId, userPwd);
			
			//System.out.println(loginUser);
			
			HttpSession session = request.getSession();
			
			
			
			if(loginUser == null) {
				session.setAttribute("message", "로그인 실패");
				request.getRequestDispatcher("/views/member/loginPage.jsp").forward(request, response);
				
			}else {
				session.setAttribute("loginUser", loginUser);
				//session.setAttribute("message", "로그인 성공");
				response.sendRedirect(request.getContextPath());
				
				
			}
			
			
			
			
			
	
			
			
			
			
			
			
			
			
	}

}

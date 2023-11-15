package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/pet.delete")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//삭제하려면 update로 userNo와 비밀번호를 전해줘서 status를 N으로 바꿔주기
		//성공했으면 세션 loginUser 지워주기
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));  //아까 모달창에서 숨겨서 보냈음,parameter는 String 형태임
		String userPwd = request.getParameter("userPwd");
		
		
		int result = new MemberService().deleteMember(userNo,userPwd);
		
		if(result>0) {
			HttpSession session = request.getSession();
			session.setAttribute("message", "탈퇴하였습니다.");
			
			session.removeAttribute("loginUser");
			response.sendRedirect(request.getContextPath());
			
			
		}else {
			request.setAttribute("message", "탈퇴에 실패하였습니다.");
			request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);
			}
		
	}

}

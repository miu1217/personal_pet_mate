package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberChangePwdController
 */

/*
 * 비밀번호 변경 성공했으면
 * */


@WebServlet("/pet.changePwd")
public class MemberChangePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberChangePwdController() {
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
		//비밀번호를 변경하려면 아이디와 현재비밀번호가 이거일때 새 비밀번호로 변경하라는 sql문 작성해야함
		request.setCharacterEncoding("UTF-8");
		
		String nowPwd = request.getParameter("nowPwd");
		String newPwd = request.getParameter("newPwd");
		
		//System.out.println(nowPwd);
		//System.out.println(newPwd);
		//현재 비밀번호와 새비밀번호 잘 받아옴
		
		
		HttpSession session =  request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		Member updateMember = new MemberService().changePwd(userId,nowPwd,newPwd);
		if(updateMember != null) {
			session.setAttribute("loginUser", updateMember);
			session.setAttribute("message", "비밀번호 변경이 성공하였습니다.");
			response.sendRedirect(request.getContextPath()+"/pet.myPage");
			
		}else {  //업데이트 실패했으면 실패했다고 alert창 띄우기
			session.setAttribute("message", "현재 비밀번호가 다릅니다.");
			request.getRequestDispatcher("views/member/changePwd.jsp").forward(request, response);
		}
		
	}

}

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
 * Servlet implementation class MemberEnrollController
 */
@WebServlet("/pet.enrollPage")
public class MemberEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/member/enrollPage.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("enrollId"); //필수
		String userPwd = request.getParameter("userPwd"); //필수
		String userName = request.getParameter("userName"); //필수
		String[] gender = (String[])request.getParameterValues("gender");

		
		String emailId = request.getParameter("emailId");
		String domain = request.getParameter("domain");

		String firstP = request.getParameter("firstP");
		String middleP = request.getParameter("middleP");
		String lastP = request.getParameter("lastP");
		
		String address = request.getParameter("address");
		String[] foodInterest = (String[])request.getParameterValues("foodInterest");
		String[] cleanInterest = (String[])request.getParameterValues("cleanInterest");
		
		//이메일 주소 처리
		String email = null;
		if((emailId != "") && (domain != "")) {
			email = emailId + "@" + domain;
			
		}
		
		//전화번호 처리
		String phone = null;
		if(middleP != "" && lastP != "") {
			phone = firstP +"-"+ middleP +"-"+ lastP;
		}


		
		//성별, 관심분야 처리
		String gen = "";
		String foodIn = "";
		String cleanIn = "";
		
		if(gender != null) {
			gen = String.join(",", gender);
		}
		
		if(foodInterest != null) {
			foodIn = String.join(",", foodInterest);
		}
		
		if(cleanInterest != null) {
			cleanIn = String.join(",", cleanInterest);
		}
		
		Member m = new Member(userId, userPwd, userName, gen,phone,email,address, foodIn,cleanIn );
		
		int result = new MemberService().insertMem(m);
		
		HttpSession session = request.getSession();
		String before = request.getHeader("referer");
		if(result>0) { //회원가입 성공
		
			session.setAttribute("message", "회원가입 성공");
			response.sendRedirect(request.getContextPath());
		}else { //회원가입 실패
			session.setAttribute("message", "회원가입 실패");
			response.sendRedirect(before);
			
			
		}
		
	}

}

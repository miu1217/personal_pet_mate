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
 * Servlet implementation class MemberUpdateTest
 */
@WebServlet("/pet.updateTest")
public class MemberUpdateTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String foodInterest = request.getParameter("foodInterest");
		String cleanInterest = request.getParameter("cleanInterest");
		//System.out.println("foodInterest : "+foodInterest); 
		//System.out.println("cleanInterest : "+cleanInterest);
		//정보가 잘담김
		

		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
	
		
		
		//Member m = new Member(foodInterest,cleanInterest);
		Member m =new Member();
		m.setFoodInter(foodInterest);
		m.setCleanInter(cleanInterest);
		m.setUserId(userId);
		
		Member updateTestInfo = new MemberService().updateTestInfo(m);
		System.out.println("updateTestInfo : "+updateTestInfo);  //null이 담겨서 수정실패가 뜸
		
	
		if(updateTestInfo == null) {   //실패했으면
			session.setAttribute("message","진단테스트 수정에 실패했습니다.");   
	
			request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);
		}else {  //수정에 성공했으면 기존 loginUser를 updateMember로 전환
			
			session.setAttribute("loginUser", updateTestInfo);
			
			session.setAttribute("message","진단테스트 수정에 성공했습니다.");
			//response.sendRedirect(request.getContextPath()+"/pet/myPage");
			request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);
		}
		
	}

}

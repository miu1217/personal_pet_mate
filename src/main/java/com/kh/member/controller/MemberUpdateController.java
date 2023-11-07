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
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/pet.updateInfo")  //수정 서블렛이고 update처리를 다 한후에 수정된 회원정보를 다시 updateForm에다가 전달하기 
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
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
		
		//여기서 수정하는작업도 하고 수정다하고 updateMember를 updateform에다가 전달하기
		//수정할 정보들을 입력했음--> parameter영역에 저장되어있음 --> 꺼내오기
		//checkbox같은 경우에는 여러개를 선택하기때문에 배열형태라 문자열로 변환해주기
		//Member객체에 한번에 저장해서 수정된 정보들을 sql문에다 전달해주기 
		//service에서 update에 성공했으면 userId가 일치하면 수정된 회원정보 받아오기
		
		String passwordChk = request.getParameter("passwordChk");		
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String[] foodInters = request.getParameterValues("foodInterest");
		String[] cleanInters = request.getParameterValues("cleanInterest");
		
		String foodInter= "";
		String cleanInter="";
		
		if(foodInters!=null) {
			foodInter = String.join(",", foodInters);
		}
		if(cleanInters !=null) {
			cleanInter = String.join(",", cleanInters);
		}
		
//		System.out.println(userId);    
//		System.out.println(userName);
//		System.out.println(gender);
//		System.out.println(phone);
//		System.out.println(email);
//		System.out.println(address);
//		System.out.println(foodInter);
//		System.out.println(cleanInter);
//		확인결과 입력한 데이터 잘받아옴
		
		Member m = new Member(userId,userName,gender,phone,email,address,foodInter,cleanInter);
	//	System.out.println(m);
	// Member 객체에 정보가 잘전달됨
		
		//업데이트된 회원정보들을 가져옴
		Member updateMember = new MemberService().updateInfo(m);
		System.out.println(updateMember); //업데이트된 회원정보 잘전달됨
		
		HttpSession session = request.getSession();
		if(updateMember == null) {   //실패했으면
			session.setAttribute("message","회원정보 수정에 실패했습니다.");   //메시지를 Attribute영역에 저장
			//response.sendRedirect(request.getContextPath()+"/pet.myPage");
			request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);
		}else {  //수정에 성공했으면 기존 loginUser를 updateMember로 전환
			
			session.setAttribute("loginUser", updateMember);
			
			session.setAttribute("message","회원정보 수정에 성공했습니다.");
			//response.sendRedirect(request.getContextPath()+"/pet/myPage");
			request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);
		}
		
	}

}

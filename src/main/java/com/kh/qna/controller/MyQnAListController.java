package com.kh.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.Member;
import com.kh.qna.model.service.QnAService;
import com.kh.qna.model.vo.QnA;

/**
 * Servlet implementation class MyQnAListController
 */
@WebServlet("/pet.myQnA")
public class MyQnAListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyQnAListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;   
		int startPage;      
		int endPage; 	    
		int qnaCount;      
		int maxPage;        
		int qnaLimit=7;     
		int pageLimit=5;
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		
		//-----내가 쓴 총 QnA 수 가져오기 (userNo를 전달해주기)
		qnaCount = new QnAService().qnaCount(userNo);
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		maxPage = (int)Math.ceil((double)qnaCount/qnaLimit);
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit -1; 
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(qnaCount,currentPage,pageLimit,qnaLimit,maxPage,startPage,endPage);
		
		ArrayList<QnA> list= new QnAService().selectMyQnAList(pi,userNo);
		
//		for(QnA q : list) {
//		System.out.println(q);
//		}
		
		
	
		
		request.setAttribute("qList", list);
		request.setAttribute("pi", pi);
		
		session.setAttribute("qnaCount", qnaCount);
		request.getRequestDispatcher("views/qna/myQnAList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.member.model.vo.Member;
import com.kh.qna.model.service.QnAService;
import com.kh.qna.model.vo.QnA;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class MemberMyPageController
 */
@WebServlet("/pet.myPage")
public class MemberMyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMyPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		ArrayList<Board> bList= new BoardService().recentMyBoardList(userNo);
		ArrayList<Review> rList= new ReviewService().recentMyReviewList(userNo);
		ArrayList<QnA> qList = new QnAService().recentMyQnAList(userNo);  //최근 작성한 리스트
		ArrayList<QnA> replyList = new QnAService().getReplyQnAList(userNo);  //관리자로부터 답변받은 리스트
		
		//답변 받지 못한 리스트
		ArrayList<Integer> isNotReplyList = new ArrayList<>();
		

		
		//답변 받은 qna인가 아닌가 체크. 답변 받은 qna면 true, 아니면 false
		boolean isIncludeReply = false;
		for(int i=0;i<qList.size();i++) {
			for(int j=0;j<replyList.size();j++) {
				if(replyList.get(j).getQnaNo() == qList.get(i).getQnaNo()) {
					isIncludeReply = true;
				}
				
			}
			if(!isIncludeReply) {
				isNotReplyList.add(qList.get(i).getQnaNo());
			}else {
				isIncludeReply = false;
			}
		}

		request.setAttribute("bList", bList);
		request.setAttribute("rList", rList);
		request.setAttribute("qList", qList);
		request.setAttribute("replyList", replyList);
		request.setAttribute("isNotReplyList", isNotReplyList);
		request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

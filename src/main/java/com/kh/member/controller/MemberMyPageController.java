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
		ArrayList<QnA> qList = new QnAService().recentMyQnAList(userNo);
		ArrayList<QnA> replyList = new QnAService().getReplyQnAList(userNo);
		
		//답변 받지 못한 리스트
		ArrayList<Integer> isNotReplyList = new ArrayList<>();
		
		//list에 최신게시글 잘담김
//		for(Board b : list) {
//			System.out.println(b);
//		}
	
		
//		for(Review r : rList) {
//			System.out.println(r);
//		}
		
//		for(QnA q : qList) {
//			System.out.println(q);
//		}
//		
		//로그인 유저가 작성한 qnaNo를 전달받아야함
		//아직 qnaNo넘겨주는 작업안했기때문에 어딘가에서 데이터보내줘야함 세션에다가 담아야하나?  //그러면 qna 정보를 조회해서 세션에 받아와야할듯(로그인유저참고)
	//	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
	//	int replyChk = new QnAService().replyChk(userNo,qnaNo); 
	//	request.setAttribute("replyChk", replyChk);
//		
		
		//원래는 게시글을 클릭하면 해당 게시글 bno를 전달하는 함수를 script안에서 작성해서 controller로 보내줬잔항요
		//근데 그냥 로그인을 하면 거기에 qnaNo가 담겨져있어야함
		
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

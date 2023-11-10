package com.kh.review.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.model.vo.MyFileRenamePolicy;
import com.kh.member.model.vo.Member;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;
import com.kh.review.model.vo.ReviewAttachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ReviewUpdateController
 */
@WebServlet("/pet.update.r")
public class ReviewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reviewNo = Integer.parseInt(request.getParameter("rno"));
		
		ReviewService rs = new ReviewService();
		
		Review r  = rs.selectUpdateReview(reviewNo);
		
		
		ReviewAttachment ra = rs.selectRvAttachment(reviewNo);
		
		System.out.println(ra);
		request.setAttribute("r", r);
		request.setAttribute("ra", ra);
		
		request.getRequestDispatcher("views/review/reviewUpdateView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		if(ServletFileUpload.isMultipartContent(request)) {
			//전송 파일 용량 제한
			int maxSize = 10 * 1024 * 1024;
			
			//업로드된 파일 저장 위치 (물리적 경로 찾기)
			String savePath = request.getSession().getServletContext().getRealPath("/resources/reviewUploadFiles/");
			
			//MultipartRequest객체 만들기 (객체가 생성되며 넘어온 파일이 있다면 서버에 파일 업로드가 된다) 
			
			//변환된 multiRequest객체로 데이터 추출하기
			MultipartRequest multiRequest = new MultipartRequest(request, savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			String reviewContent = multiRequest.getParameter("reviewContent");
			
			int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
			
			int productNo = Integer.parseInt(multiRequest.getParameter("pno"));
					
			
			int reviewNo = Integer.parseInt(multiRequest.getParameter("rno"));
			Review r = new Review();
			r.setReviewNo(reviewNo);
			r.setReviewContent(reviewContent);
			r.setUserNo(userNo);
			
			//만약 새로운 첨부파일이 전달되었다면 
			ReviewAttachment at = null;
			
			//기존첨부파일이 있을때 새로운 첨부파일이 들어온경우 (기존 첨부파일 삭제해주기)
			boolean flag = false;
			
			//새로 전달된 파일명이 있을때
			if(multiRequest.getOriginalFileName("reUploadFile") != null) {
				at = new ReviewAttachment(); //객체 생성
				//전달된 파일명 
				at.setOriginName(multiRequest.getOriginalFileName("reUploadFile"));
				//서버에 업로드된 파일명
				at.setChangeName(multiRequest.getFilesystemName("reUploadFile"));
				//저장 경로 넣기
				at.setFilePath("/resources/reviewUploadFiles/");
				
				//만약 기존에도 파일이 있었다면 파일번호와 파일명을 전달받기 
				if(multiRequest.getParameter("originFileNo") != null) {
					//새로 첨부된 파일이 있고 기존 파일도 있다면 
					//파일정보가 등록된 데이터에서 변경작업을 한다 update
					//파일번호(식별자)를 이용하여 기존데이터에서 변경하기.(덮어쓰기)
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					
					//기존 첨부파일 삭제 플래그
					flag = true;
					
				}else {//새로 전달된 파일은 있지만 기존에는 파일이 없었을때 
					//데이터베이스에 Attachment정보를 추가해야한다.
					//참조 게시글 번호를 세팅 
					at.setReviewNo(reviewNo);
				}
				
			}
			
			
			//서비스로 요청보내기 
			//b,at 
			//새로운 첨부파일이 없는경우 b,at(null) - b : update 
			//새로운 첨부파일이 있고 기존에 첨부파일이 있는경우 b,at(fileNo) : b : update -at: update
			//새로운 첨부파일이 있고 기존에 첨부파일이 없는경우 b,at(refBno) : b : update -at: insert
			
			int result = new ReviewService().updateReview(r,at);
			//성공시에 상세페이지로 성공메세지와 함께
			if(result>0) {
				
				//기존에 있었던 파일이 지워져야한다면 
				if(flag) {
					
					//기존 파일 삭제 해주기 (저장경로 + 원본파일명)-원본파일명은 view에서 넘겨줌
					new File(savePath+multiRequest.getParameter("originFileName")).delete();
				}
				
				session.setAttribute("message", "리뷰 수정 성공하셨습니다.");
				
				response.sendRedirect(request.getContextPath()+"/pet.productDetail?pno="+productNo);
			}else {
				
				session.setAttribute("message", "리뷰 수정 실패하셨습니다.");
				
				response.sendRedirect(request.getContextPath()+"/pet.productDetail?pno="+productNo);
			}
			
	}

	}
}

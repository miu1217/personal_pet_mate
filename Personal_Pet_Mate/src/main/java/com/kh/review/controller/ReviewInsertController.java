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

import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;
import com.kh.review.model.vo.ReviewAttachment;
import com.kh.admin.model.service.AdminService;
import com.kh.common.model.vo.MyFileRenamePolicy;
import com.kh.member.model.vo.Member;
import com.kh.product.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ReviewInsertController
 */
@WebServlet("/pet.insert.r")
public class ReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productNo = Integer.parseInt(request.getParameter("pno"));

		HttpSession session = request.getSession();
		
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		System.out.println("맥북 언젠가 훔쳐갑니다 조심하세요 ");
		Review r  = new ReviewService().reviewValidate(productNo, userNo);
		
		if(r != null) {
			if(r.getUserNo() == userNo) {
			session.setAttribute("message", "작성하신 리뷰가 있어서 접근 실패하셨습니다.");
			
			response.sendRedirect(request.getContextPath() +"/pet.productDetail?pno=" + productNo);
			}
		}else{
			
			Product p =  new AdminService().selectProduct(productNo);
			
			
			
			request.setAttribute("p", p);
			request.getRequestDispatcher("views/review/reviewInsertView.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		HttpSession session = request.getSession();
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			//저장경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/reviewUploadFiles/");
			
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			String reviewContent = multiRequest.getParameter("reviewContent");
			
			int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
			
			int productNo = Integer.parseInt(multiRequest.getParameter("pno"));
			Review r = new Review();
			r.setProductNo(productNo);
			r.setReviewContent(reviewContent);
			r.setUserNo(userNo);
			
			ReviewAttachment at = null;
			
			
			if(multiRequest.getOriginalFileName("uploadFile") != null) {
				//원본파일명이 있다면 첨부파일정보 담아주기
				
				at = new ReviewAttachment();
				//원본파일명 담기
				at.setOriginName(multiRequest.getOriginalFileName("uploadFile"));
				//변경한 파일명 담기 (서버에 등록된 파일명)
				at.setChangeName(multiRequest.getFilesystemName("uploadFile"));
				//경로 담기
				at.setFilePath("/resources/reviewUploadFiles/");
				
			}
			int result = new ReviewService().insertReview(r ,at);
			
			if(result>0) { //성공
				session.setAttribute("message", "리뷰 작성 성공하셨습니다.");
				
				response.sendRedirect(request.getContextPath()+"/pet.productDetail?pno="+productNo);
			}else {//실패
				//게시글 등록에 실패했다면 서버에 업로드된 파일을 지워야한다.
				
				if(at!=null) {//첨부파일이 있다면 삭제 작업 
					//삭제하고자하는 파일경로로 파일객체 생성하여 delete메소드 수행
					new File(savePath+at.getChangeName()).delete();
				}
				

				session.setAttribute("message", "리뷰 작성 실패하셨습니다.");
				
				response.sendRedirect(request.getContextPath()+"/pet.productDetail?pno="+productNo);
			}
		}
		
		
	}

}

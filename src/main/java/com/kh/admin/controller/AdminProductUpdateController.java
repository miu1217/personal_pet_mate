package com.kh.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.admin.model.service.AdminService;
import com.kh.common.model.vo.MyFileRenamePolicy;
import com.kh.member.model.vo.Member;
import com.kh.product.model.vo.Product;
import com.kh.product.model.vo.ProductAttachment;
import com.kh.product.model.vo.ProductCategory;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminProductUpdateController
 */
@WebServlet("/pet.admin.update.pd")
public class AdminProductUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		if(userId.equals("admin")) {
			
			int productNo = Integer.parseInt(request.getParameter("pno"));
			
			AdminService aps = new AdminService();
			
			//수정페이지에 띄워줄 상품 조회 가져오기
			Product p = aps.selectProduct(productNo);
			
			ArrayList<ProductCategory> cList = new AdminService().selectCategoryList();
			ArrayList<ProductAttachment> phList = aps.selectProductAttachmentList(productNo);
			
			request.setAttribute("p", p);
			request.setAttribute("cList", cList);
			request.setAttribute("phList", phList);
			
			request.getRequestDispatcher("views/admin/adminProductUpdateView.jsp").forward(request, response);
		}else {
			request.setAttribute("message", "관리자만 들어올 수 있는 공간임 나가");
			response.sendRedirect(request.getContextPath());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			//저장경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/productUploadFiles/");
			
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			
			int productNo = Integer.parseInt(multiRequest.getParameter("productNo"));
			String productName = multiRequest.getParameter("productName");
			int categoryNo = Integer.parseInt(multiRequest.getParameter("categoryNo"));
			int price = Integer.parseInt(multiRequest.getParameter("productPrice"));
			String ingredient = multiRequest.getParameter("ingredient");
			String info = multiRequest.getParameter("info");
			String brand = multiRequest.getParameter("brand");
			
			Product p = new Product();
			p.setProductNo(productNo);
			p.setProductName(productName);
			p.setCategoryNo(categoryNo);
			p.setProductPrice(price);
			p.setProductIngredient(ingredient);
			p.setProductInfo(info);
			p.setProductBrand(brand);
			
			
			//만약 새로운 첨부파일이 전달되었다면
			ArrayList<ProductAttachment> phList = null;
			
			//기존 첨부파일이 있을 때 새로운 첨부파일 들어온 경우 (기존 첨부파일 삭제해주기)
			boolean flag = false;
			
			if(multiRequest.getOriginalFileName("file1") != null) {
				phList = new ArrayList<>();
				
				for(int i=1; i<=4; i++) {
					//키값 
					String key = "file"+i;
					
					//키값에 해당하는 요소가 있는지 확인하기 
					if(multiRequest.getOriginalFileName(key)!=null) {
						//해당 키값에 파일이 있다면 
						//Attachment 객체 생성후 데이터 담아주기 
						//여러개가 나올 수 있으니 Attachment객체를 list에 추가하기 
						//원본명,변경이름,파일경로,파일레벨(썸네일사진/상세사진)
						
						ProductAttachment at = new ProductAttachment();
						at.setOriginName(multiRequest.getOriginalFileName(key));
						at.setChangeName(multiRequest.getFilesystemName(key));
						at.setFilePath("/resources/productUploadFiles/");
						
						
						
						if(i==1) { //대표이미지 fileLevel == 1 
							at.setFileLevel(1);
						}else { //상세이미지 fileLevel == 2
							at.setFileLevel(2);
						}
						phList.add(at); //값 추출 끝났으니 리스트에 추가하기.

						
				
						//만약 기존에도 파일이 있었다면 파일번호와 파일명을 전달받기
						if(multiRequest.getParameter("originFileNo"+key) != null) {
							//새로 첨부된 파일이 있고 기존 파일도 있다면
							//파일 정보가 등록된 데이터에서 변경작업을 한다 update
							//파일번호(식별자)를 이용하여 기존 데이터 변경하기(덮어쓰기)

							at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo"+key)));
							
							//기존 첨부파일 삭제 플래그
							flag = true;
						}else {//새로 전달된 파일은 있지만 기존에는 파일이 없었을때
							//데이터베이스에 Attachment 정보를 추가해야한다.
							//참조 게시글 번호를 세팅
							at.setProductNo(productNo);
						}
					}
				}
			}
			
			
			int result = new AdminService().updateProduct(p, phList);
			HttpSession session = request.getSession();
			
			//성공 시에 상세 페이지로 성공메세지와 함께
			if(result > 0) {
				
				//기존에 있었던 파일이 지워져야한다면
				if(flag) {
					//기본파일 삭제해주기
					for(int i=1; i<=4; i++) {
						//키값 
						String key = "file"+i;
						
					
						new File(savePath + multiRequest.getParameter("originFileName"+key)).delete();
					}
				}
				session.setAttribute("message", "상품 수정을 성공했습니다.");
				response.sendRedirect(request.getContextPath() + "/pet.admin.detail.pd?pno="+ productNo);
			}else {
				//실패시에 상세페이지로 실패메시지와 함께
				session.setAttribute("message", "상품 수정을 실패했습니다.");
				response.sendRedirect(request.getContextPath() + "/pet.admin.detail.pd?pno="+ productNo);
			}
			
		}

	}
}

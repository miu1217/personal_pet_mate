package com.kh.admin.controller;

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
 * Servlet implementation class AdminProductInsertController
 */
@WebServlet("/pet.admin.insert.pd")
public class AdminProductInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductInsertController() {
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
			
		
			ArrayList<ProductCategory> cList = new AdminService().selectCategoryList();
			
			request.setAttribute("cList", cList);
			
			request.getRequestDispatcher("views/admin/adminProductInsertView.jsp").forward(request, response);
		}else {
			request.setAttribute("message", "관리자만 들어올 수 있는 공간임 나가");
			response.sendRedirect(request.getContextPath());
			
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated me
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			//저장경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/productUploadFiles/");
			
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			String productName = multiRequest.getParameter("productName");
			int categoryNo = Integer.parseInt(multiRequest.getParameter("categoryNo"));
			int price = Integer.parseInt(multiRequest.getParameter("price"));
			String ingredient = multiRequest.getParameter("ingredient");
			String info = multiRequest.getParameter("info");
			String brand = multiRequest.getParameter("brand");
			
			Product p = new Product();
			p.setProductName(productName);
			p.setCategoryNo(categoryNo);
			p.setProductPrice(price);
			p.setProductIngredient(ingredient);
			p.setProductInfo(info);
			p.setProductBrand(brand);
			
			ArrayList<ProductAttachment> pList = new ArrayList<>();
			
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
					pList.add(at); //값 추출 끝났으니 리스트에 추가하기.

//					System.out.println("controller");
//					System.out.println(at);
//					System.out.println(multiRequest.getOriginalFileName(key));
//					System.out.println(multiRequest.getFilesystemName(key));
				}
			}
			
			
			int result = new AdminService().insertProduct(p, pList);
			
				HttpSession session = request.getSession();
			
			
			if(result>0) { //성공
				//성공메세지와함께 사진게시판 목록 보여주기
				session.setAttribute("message", "상품 입력 성공하셨습니다.");
				
				response.sendRedirect(request.getContextPath()+"/pet.admin.list.pd?currentPage=1");
				
			}else {//실패
				//실패메세지와함께 사진게시판 목록 보여주기 
				session.setAttribute("message","상품 입력 실패하셨습니다.");
				response.sendRedirect(request.getContextPath()+"/pet.admin.list.pd?currentPage=1");
				
			}
			
		}

	}
	

}

package com.kh.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.admin.model.service.AdminService;
import com.kh.common.model.vo.PageInfo;
import com.kh.product.model.service.ProductService;
import com.kh.product.model.vo.Product;
import com.kh.product.model.vo.ProductAttachment;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class ProductDetailController
 */
@WebServlet("/pet.productDetail")
public class ProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		AdminService aps = new AdminService();
		
		//상품번호가져오기
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		
		
		 
		//상품정보가져오기
		Product p = new ProductService().selectProductDetail(pno);
					
		//상품사진가져오기
		ArrayList<ProductAttachment> phList = aps.selectProductAttachmentList(pno);
		
		//상품리뷰가져오기


		//상품정보담기
		request.setAttribute("p", p);
		//상품사진담기
		request.setAttribute("phList", phList);
	

		
		request.getRequestDispatcher("views/product/productDetailView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.kh.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminProductService;
import com.kh.product.model.service.ProductService;
import com.kh.product.model.vo.Product;
import com.kh.product.model.vo.ProductAttachment;
import com.kh.product.model.vo.ProductReview;

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
		
		AdminProductService aps = new AdminProductService();
		
		//상품번호가져오기
		int pno = Integer.parseInt(request.getParameter("pno"));
		 
		//상품정보가져오기
		Product p = new ProductService().selectProductDetail(pno);
					
		//상품사진가져오기
		ArrayList<ProductAttachment> phList = aps.selectProductAttachmentList(pno);
		
		//상품리뷰가져오기
		ArrayList<ProductReview> prList = new ProductService().selectProductReviewList(pno); 

		//상품정보담기
		request.setAttribute("p", p);
		//상품사진담기
		request.setAttribute("phList", phList);
		//상품리뷰리스트담기
		request.setAttribute("prList", prList);
		
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
package com.kh.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminService;
import com.kh.product.model.service.ProductService;
import com.kh.product.model.vo.Product;
import com.kh.product.model.vo.ProductAttachment;

/**
 * Servlet implementation class ProductCompareController
 */
@WebServlet("/pet.compare")
public class ProductCompareController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductCompareController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] productNumbers = request.getParameterValues("productNo");
		AdminService aps = new AdminService();

		try {
			int pno1 = Integer.parseInt(productNumbers[0]);
			int pno2 = Integer.parseInt(productNumbers[1]);
			int pno3 = Integer.parseInt(productNumbers[2]);

			// 상품정보가져오기
			Product p1 = new ProductService().selectProductDetail(pno1);

			// 상품사진가져오기
			ArrayList<ProductAttachment> phList1 = aps.selectProductAttachmentList(pno1);

			// 상품정보가져오기
			Product p2 = new ProductService().selectProductDetail(pno2);

			// 상품사진가져오기
			ArrayList<ProductAttachment> phList2 = aps.selectProductAttachmentList(pno2);

			// 상품정보가져오기
			Product p3 = new ProductService().selectProductDetail(pno3);

			// 상품사진가져오기
			ArrayList<ProductAttachment> phList3 = aps.selectProductAttachmentList(pno3);

			// 상품정보담기
			request.setAttribute("p1", p1);
			// 상품사진담기
			request.setAttribute("phList1", phList1);

			// 상품정보담기
			request.setAttribute("p2", p2);
			// 상품사진담기
			request.setAttribute("phList2", phList2);

			// 상품정보담기
			request.setAttribute("p3", p3);
			// 상품사진담기
			request.setAttribute("phList3", phList3);
			
			request.getRequestDispatcher("views/product/productCompareView.jsp").forward(request, response);

		} catch (ArrayIndexOutOfBoundsException e) {

			int pno1 = Integer.parseInt(productNumbers[0]);
			int pno2 = Integer.parseInt(productNumbers[1]);

			// 상품정보가져오기
			Product p1 = new ProductService().selectProductDetail(pno1);

			// 상품사진가져오기
			ArrayList<ProductAttachment> phList1 = aps.selectProductAttachmentList(pno1);

			// 상품정보가져오기
			Product p2 = new ProductService().selectProductDetail(pno2);

			// 상품사진가져오기
			ArrayList<ProductAttachment> phList2 = aps.selectProductAttachmentList(pno2);
			
			System.out.println(p1);

			// 상품정보담기
			request.setAttribute("p1", p1);
			// 상품사진담기
			request.setAttribute("phList1", phList1);

			// 상품정보담기
			request.setAttribute("p2", p2);
			// 상품사진담기
			request.setAttribute("phList2", phList2);
			
			request.getRequestDispatcher("views/product/productCompareView.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

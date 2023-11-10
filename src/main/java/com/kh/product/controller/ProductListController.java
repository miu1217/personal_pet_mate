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
import com.kh.product.model.vo.ProductCategory;

/**
 * Servlet implementation class ProductListController
 */
@WebServlet("/pet.products")
public class ProductListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductListController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int cno;

		ArrayList<ProductCategory> clist = new ProductService().selectProductCategoryList();
		ArrayList<Product> phList = null;

		try {
			cno = Integer.parseInt(request.getParameter("productCategory"));

		} catch (NumberFormatException e) {
			e.printStackTrace();
			cno = 0;
		}

		switch (cno) {
		case 1:
			phList = new ProductService().sortListCount();
			break;
		case 2:
			phList = new ProductService().sortListReviewCount();
			break;

		case 0:
			phList = new AdminService().selectListProduct();
		}

		request.setAttribute("productCategory", cno);
		request.setAttribute("phList", phList);
		request.setAttribute("clist", clist);
		request.getRequestDispatcher("views/product/productListView.jsp").forward(request, response);
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

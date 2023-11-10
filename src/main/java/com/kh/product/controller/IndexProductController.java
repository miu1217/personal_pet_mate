package com.kh.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.member.model.vo.Member;
import com.kh.product.model.service.ProductService;
import com.kh.product.model.vo.Product;
import com.kh.product.model.vo.ProductCategory;

/**
 * Servlet implementation class IndexProductController
 */
@WebServlet("/ajax1.do")
public class IndexProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		try {
			
			Member m = (Member)session.getAttribute("loginUser");
			
			ArrayList<String> mList = new ArrayList<>();
			mList.add(m.getFoodInter());
			mList.add(m.getCleanInter());
			//상품리스트조회메소드
			ArrayList<Product> ipList = new ProductService().selectIndexProductList();
			
			ArrayList<ProductCategory> pcList = new ProductService().selectProductCategoryList();
			
			Map<String, Object> dataMap = new HashMap<>();
			dataMap.put("ipList", ipList);
			dataMap.put("pcList", pcList);
			dataMap.put("mList", mList);
			
			response.setContentType("json/appliaction; charset=UTF-8");
			
			new Gson().toJson(dataMap,response.getWriter());
			
		} catch(NullPointerException e) {
			
			ArrayList<Product> ipList = new ProductService().selectIndexProductList();
			
			ArrayList<ProductCategory> pcList = new ProductService().selectProductCategoryList();
			ArrayList<String> mList = null;
			
			Map<String, Object> dataMap = new HashMap<>();
			dataMap.put("ipList", ipList);
			dataMap.put("pcList", pcList);
			dataMap.put("mList", mList);
			
			response.setContentType("json/appliaction; charset=UTF-8");
			
			new Gson().toJson(dataMap,response.getWriter());
		}
		
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

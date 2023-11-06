package com.kh.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.product.model.dao.ProductDao;
import com.kh.product.model.vo.Product;
import com.kh.product.model.vo.ProductAttachment;
import com.kh.product.model.vo.ProductCategory;

public class ProductService {

	Connection conn = JDBCTemplate.getConnection();

	public ArrayList<Product> selectProductList() {

		ArrayList<Product> plist = new ProductDao().selectProductList(conn);
		
		JDBCTemplate.close(conn);
		
		return plist;
	}

	public ArrayList<ProductCategory> selectProductCategoryList() {
		
		ArrayList<ProductCategory> clist = new ProductDao().selectProductCategoryList(conn);

		JDBCTemplate.close(conn);
		
		return clist;
	}
	
	

}

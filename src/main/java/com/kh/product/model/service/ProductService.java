package com.kh.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.product.model.dao.ProductDao;
import com.kh.product.model.vo.Product;

public class ProductService {

	Connection conn = JDBCTemplate.getConnection();

	public ArrayList<Product> selectProductList() {

		ArrayList<Product> plist = new ProductDao().selectProductList(conn);
		
		JDBCTemplate.close(conn);
		
		return plist;
	}

}

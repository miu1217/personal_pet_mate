package com.kh.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.model.dao.AdminProductDao;
import com.kh.common.JDBCTemplate;
import com.kh.product.model.vo.Product;
import com.kh.product.model.vo.ProductAttachment;
import com.kh.product.model.vo.ProductCategory;

public class AdminProductService {

	public ArrayList<ProductCategory> selectCategoryList() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<ProductCategory> cList = new AdminProductDao().selectCategoryList(conn);
		
		JDBCTemplate.close(conn);
		
		
		return cList;
	}

	//상품 추가 기능에서 상품 사진 넣는 메소드
	public int insertProdocut(Product p, ArrayList<ProductAttachment> pList) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new AdminProductDao().insertProdocut(conn, p);
		
		int result2 = new AdminProductDao().insertProdcutPhoto(conn, pList);
		
		if(result*result2 > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result*result2;
	}

}

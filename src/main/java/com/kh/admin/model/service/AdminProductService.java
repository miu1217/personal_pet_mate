package com.kh.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.model.dao.AdminProductDao;
import com.kh.common.JDBCTemplate;
import com.kh.product.model.dao.ProductDao;
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
	public int insertProduct(Product p, ArrayList<ProductAttachment> pList) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new AdminProductDao().insertProduct(conn, p);
		
		int result2 = new AdminProductDao().insertProductPhoto(conn, pList);
		
		if(result*result2 > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result*result2;
	}

	//상품 리스트 가져오는 메소드
	public ArrayList<Product> selectListProduct() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Product> pList = new AdminProductDao().selectListProduct(conn);
		
		JDBCTemplate.close(conn);
		
		
		return pList;
		
		
	}

	//조회수 증가 처리 메소드
	public int increaseCount(int productNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new AdminProductDao().increaseCount(conn, productNo);
	
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	//상품 조회 메소드
	public Product selectProduct(int productNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		Product p = new AdminProductDao().selectProduct(conn, productNo);
		
		JDBCTemplate.close(conn);
		
		return p;
	}

	
	//상품 상세 조회 시 사진 리스트 메소드
	public ArrayList<ProductAttachment> selectProductAttachmentList(int productNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<ProductAttachment> list = new AdminProductDao().selectProductAttachmentList(conn, productNo);
		
		
		JDBCTemplate.close(conn);
		return list;
	}

	//상품 수정 메소드
	public int updateProduct(Product p, ArrayList<ProductAttachment> phList) {
		Connection conn = JDBCTemplate.getConnection();
		
		System.out.println(p);
		System.out.println(phList);
		//상품 수정 메소드
		int result = new AdminProductDao().updateProduct(conn, p);
		
		
		int result2 = new AdminProductDao().updateAttachmentList(conn,phList);

		
		
		
		//게시글 수정과 첨부파일 수정 또는 추가 작업 중 하나라도 잘못되었다면
				//되돌리기 작업을 수행하여야한다.
				
		if(result*result2 >0) {
					JDBCTemplate.commit(conn);
		}else {
					JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result*result2;
	}

	
	//상품 삭제 메소드
	public int deleteProduct(int productNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new AdminProductDao().deleteProduct(conn, productNo);
		
		int result2 = new AdminProductDao().deleteProductAttachment(conn, productNo);
		
		if(result*result2 > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		
		JDBCTemplate.close(conn);
		return result*result2;
	}

}

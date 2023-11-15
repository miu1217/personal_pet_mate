package com.kh.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.product.model.dao.ProductDao;
import com.kh.product.model.vo.Product;
import com.kh.product.model.vo.ProductAttachment;
import com.kh.product.model.vo.ProductCategory;
import com.kh.product.model.vo.ProductReview;

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
	
	//상품상세조회
		public Product selectProductDetail(int pno) {
			
			Product p = new ProductDao().selectProductDetail(pno, conn);
			
			JDBCTemplate.close(conn);
			
			return p;
		}
		
		//상품사진조회
		public ArrayList<ProductAttachment> selectProductAttachmentList(int pno) {
			
			ArrayList<ProductAttachment> phList = new ProductDao().selectProductAttachmentList(pno,conn);
			
			JDBCTemplate.close(conn);
			
			return phList;
		}
		
		//상품리뷰조회
		public ArrayList<ProductReview> selectProductReviewList(int pno) {
			
			ArrayList<ProductReview> prList = new ProductDao().selectProductReviewList(pno,conn);
			
			JDBCTemplate.close(conn);
			
			return prList;
		}

		public ArrayList<Product> selectIndexProductList() {
			
			ArrayList<Product> ipList = new ProductDao().selectIndexProductList(conn);
			
			JDBCTemplate.close(conn);
			
			return ipList;
		}

		public ArrayList<Product> sortListCount() {

			ArrayList<Product> pList = new ProductDao().sortListCount(conn);

			JDBCTemplate.close(conn);

			return pList;
		}

		public ArrayList<Product> sortListReviewCount() {

			ArrayList<Product> pList = new ProductDao().sortListReviewCount(conn);

			JDBCTemplate.close(conn);

			return pList;
		}
		public ArrayList<Product> selectListProduct() {

			ArrayList<Product> pList = new ProductDao().selectListProduct(conn);

			JDBCTemplate.close(conn);

			return pList;
		}
}

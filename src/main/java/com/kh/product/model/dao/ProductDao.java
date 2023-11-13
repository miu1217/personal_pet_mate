package com.kh.product.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.product.model.vo.Product;
import com.kh.product.model.vo.ProductAttachment;
import com.kh.product.model.vo.ProductCategory;
import com.kh.product.model.vo.ProductReview;

public class ProductDao {

	private Properties prop = new Properties();
	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rset = null;

	public ProductDao() {

		String filePath = ProductDao.class.getResource("/db/sql/product-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public ArrayList<Product> selectProductList(Connection conn) {

		String sql = prop.getProperty("selectProductList");
		ArrayList<Product> plist = new ArrayList<>();

		try {
			stmt = conn.createStatement();

			rset = stmt.executeQuery(sql);

			while (rset.next()) {
				plist.add(new Product(rset.getInt("PRODUCT_NO")
								      	,rset.getInt("CATEGORY_NO")
								      	,rset.getString("PRODUCT_NAME")
								      	,rset.getInt("PRODUCT_PRICE")
								      	,rset.getString("PRODUCT_INFO")
								      	,rset.getString("PRODUCT_INGREDIENT")
								      	,rset.getString("PRODUCT_BRAND")
								      	,rset.getInt("COUNT")
								      	,rset.getDate("CREATE_DATE")
								      	,rset.getString("STATUS")
								      	,rset.getString("PRODUCT_TAG")));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}

		return plist;
	}

	public ArrayList<ProductCategory> selectProductCategoryList(Connection conn) {

		String sql = prop.getProperty("selectProductCategoryList");
		ArrayList<ProductCategory> clist = new ArrayList<>();

		try {
			stmt = conn.createStatement();

			rset = stmt.executeQuery(sql);

			while (rset.next()) {
				clist.add(new ProductCategory(rset.getInt("category_no"), rset.getInt("parent_category_no"),
						rset.getString("category_name")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return clist;
	}

	//제품상세조회
		public Product selectProductDetail(int pno,Connection conn) {
			
			String sql = prop.getProperty("selectProductDetail");
			Product p = new Product();
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pno);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					p = new Product(rset.getInt("PRODUCT_NO")
								   ,rset.getString("PRODUCT_NAME")
								   ,rset.getInt("PRODUCT_PRICE")
								   ,rset.getString("PRODUCT_INFO")
								   ,rset.getString("PRODUCT_INGREDIENT")
								   ,rset.getString("PRODUCT_BRAND"));
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return p;
		}
		
		//제품사진조회
		public ArrayList<ProductAttachment> selectProductAttachmentList(int pno, Connection conn) {
			
			String sql = prop.getProperty("selectProductAttachmentList");
			ArrayList<ProductAttachment> phList = new ArrayList<>();
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pno);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					phList.add(new ProductAttachment(rset.getInt("FILE_NO")
													,rset.getString("ORIGIN_NAME")
													,rset.getString("FILE_PATH")
													,rset.getString("CHANGE_NAME")));
													
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return phList;
		}
		
		//상품리뷰조회
		public ArrayList<ProductReview> selectProductReviewList(int pno, Connection conn) {
			
			ArrayList<ProductReview> prList = new ArrayList<>();
			String sql = prop.getProperty("selectProductReviewList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pno);
				
				rset = pstmt.executeQuery();
				while(rset.next()) {
					prList.add(new ProductReview(rset.getInt("REVIEW_NO")
												,rset.getInt("USER_NO")
												,rset.getString("REVIEW_CONTENT")));
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return prList;			
		}
		
		//인덱스상품리스트(상품번호,상품이름,사진)
		public ArrayList<Product> selectIndexProductList(Connection conn) {
			
			ArrayList<Product> ipList = new ArrayList<>();
			String sql = prop.getProperty("selectIndexProductList");
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(sql);
				
				while(rset.next()) {
					ipList.add(new Product(rset.getInt("PRODUCT_NO")
										  ,rset.getString("PRODUCT_NAME")
										  ,rset.getString("TITLEIMG")
										  ,rset.getString("CATEGORY_NAME")
										  ,rset.getInt("PARENT_CATEGORY_NO")));
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return ipList;
		}

		public ArrayList<Product> sortListCount(Connection conn) {

			ArrayList<Product> pList = new ArrayList<>();
			String sql = prop.getProperty("sortListProductCount");

			try {
				stmt = conn.prepareStatement(sql);

				rset = stmt.executeQuery(sql);

				while (rset.next()) {
					pList.add(new Product(rset.getInt("PRODUCT_NO"), rset.getInt("CATEGORY_NO"),
							rset.getString("PRODUCT_NAME"), rset.getInt("PRODUCT_PRICE"), rset.getString("TITLEIMG")));
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(stmt);
			}

			return pList;
		}

		public ArrayList<Product> sortListReviewCount(Connection conn) {
			ArrayList<Product> pList = new ArrayList<>();
			String sql = prop.getProperty("sortListProductReviewCount");

			try {
				stmt = conn.prepareStatement(sql);

				rset = stmt.executeQuery(sql);

				while (rset.next()) {
					pList.add(new Product(rset.getInt("PRODUCT_NO"), rset.getInt("CATEGORY_NO"),
							rset.getString("PRODUCT_NAME"), rset.getInt("PRODUCT_PRICE"), rset.getString("TITLEIMG")));
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(stmt);
			}

			return pList;
		}

	}
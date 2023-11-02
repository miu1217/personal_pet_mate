package com.kh.admin.model.dao;

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

public class AdminProductDao {
	private Properties prop = new Properties();
	
	public AdminProductDao() {
		
		try {
			String filePath = AdminProductDao.class.getResource("/db/sql/admin-mapper.xml").getPath();
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<ProductCategory> selectCategoryList(Connection conn) {
		 ArrayList<ProductCategory> cList = new  ArrayList<>();
		 ResultSet rset = null;
		 Statement stmt = null;
		 String sql =prop.getProperty("selectCategoryList");
		 
		 try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				cList.add(new ProductCategory(rset.getInt("CATEGORY_NO")
											,rset.getInt("PARENT_CATEGORY_NO")
											,rset.getString("CATEGORY_NAME")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		 
		return cList;
	}

	//상품 테이블에 상품 추가하는 메소
	public int insertProdocut(Connection conn, Product p) {
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProdocut");
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, p.getCategoryNo());
			pstmt.setString(2, p.getProductName());
			pstmt.setInt(3, p.getProductPrice());
			pstmt.setString(4, p.getProductInfo());
			pstmt.setString(5, p.getProductIngredient());
			pstmt.setString(6, p.getProductBrand());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}

	
	//상품 사진 테이블에 사진 추가하는 메소
	public int insertProdcutPhoto(Connection conn, ArrayList<ProductAttachment> pList) {
		int result = 1;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProdcutPhoto");
		
		try {
			pstmt = conn.prepareStatement(sql);
			System.out.print(pList);
			
			for(ProductAttachment at : pList) {
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());
				
				
				//실행후 받은 결과가 하나라도 0이 나오면 결과값을 0으로 만들기 
				result *= pstmt.executeUpdate();
				
				System.out.print(result);
			}
		} catch (SQLException e) {
			//try구문에서 첫번째 처리에 실패가된다면 result가 1로 전달되는것을 방지
			result =0;
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
          


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

import javax.naming.spi.DirStateFactory.Result;

import com.kh.common.JDBCTemplate;
import com.kh.product.model.vo.Product;
import com.kh.product.model.vo.ProductAttachment;
import com.kh.product.model.vo.ProductCategory;

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
				plist.add(new Product(rset.getInt("PRODUCT_NO"), rset.getInt("CATEGORY_NO"),
						rset.getString("PRODUCT_NAME"), rset.getInt("PRODUCT_PRICE"), rset.getString("PRODUCT_INFO"),
						rset.getString("PRODUCT_INGREDIENT"), rset.getString("PRODUCT_BRAND"), rset.getInt("COUNT"),
						rset.getDate("CREATE_DATE"), rset.getString("STATUS"), rset.getString("PRODUCT_TAG")));
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

}

package com.kh.product.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class ProductDao {

	private Properties prop = new Properties();
	
	public ProductDao() {
		
		//mapper 읽을수있게 준비
		String filePath = ProductDao.class.getResource("/db/sql/product-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
}//

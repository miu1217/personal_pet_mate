package com.kh.qna.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.qna.model.vo.QnA;

public class QnADao {
	
private Properties prop = new Properties();
	
	public QnADao() {
		try {
			String filePath = QnADao.class.getResource("/db/sql/qna-mapper.xml").getPath();
			prop.loadFromXML(new FileInputStream(filePath));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	public int qnaCount(Connection conn, int userNo) {
		int count= 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("qnaCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				count=rset.getInt("COUNT");
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return count;
	}




	public ArrayList<QnA> selectMyQnAList(Connection conn, PageInfo pi, int userNo) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectMyQnAList");
		ArrayList<QnA> list =new ArrayList<>();
		
		
		int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit() +1;
		int endRow = pi.getCurrentPage()*pi.getBoardLimit();
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			
			
			
			while(rset.next()) {
				list.add(new QnA(rset.getInt("QNA_NO")
						,rset.getString("CATEGORY_NAME")
						,rset.getString("QNA_TITLE")
						,rset.getString("USER_ID")
						,rset.getDate("CREATE_DATE")));
			}
			
			System.out.println(list);
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}


		
		
		return list;
	}

}

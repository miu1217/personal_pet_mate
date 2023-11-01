package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.vo.Member;

public class MemberDao {

	private Properties prop = new Properties(); // 쿼리구문 xml파일불러오기

	public MemberDao() {
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginUser(Connection conn, String userId, String userPwd) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("loginUser");
		Member m = new Member();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			

			if(rset.next()) {
				m = new Member(rset.getInt("USER_NO")
											,rset.getString("USER_ID")
											,rset.getString("USER_PWD")
											,rset.getString("USER_NAME")
											,rset.getString("GENDER")
											,rset.getString("PHONE")
											,rset.getString("EMAIL")
											,rset.getString("ADDRESS")
											,rset.getString("FOOD_INTEREST")
											,rset.getString("CLEAN_INTEREST")
											,rset.getDate("CREATE_DATE")
											,rset.getString("STATUS"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return m;
	}
	
	

}

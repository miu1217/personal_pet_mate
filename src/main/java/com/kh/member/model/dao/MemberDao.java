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
		Member m = null;
		
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

	public int insertMem(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMem");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId()); 
			pstmt.setString(2, m.getUserPwd()); 
			pstmt.setString(3, m.getUserName()); 
			pstmt.setString(4, m.getGender());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getAddress());
			pstmt.setString(8, m.getFoodInter());
			pstmt.setString(9, m.getCleanInter());
			
			result = pstmt.executeUpdate();
			
			if(result>0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(pstmt);
			
		}

		
		return result;
	}

	public int idCheck(Connection conn, String checkId) {
		ResultSet rset = null;
		PreparedStatement pstmt =null;
		String sql = prop.getProperty("idCheck"); 
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return count;
	}

	public Member findId(Connection conn, String useName, String usePhone) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("findId");
		Member m = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, useName);
			pstmt.setString(2, usePhone);
			
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
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return m;
	
		}

	public int findPwd(Connection conn, String useId, String usePhone) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("findPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, useId);
			pstmt.setString(2, usePhone);
			
			result = pstmt.executeUpdate();
			
			if(result>0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	

	
	
	
	
	
	
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ마이페이지 부분 시작 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ회원정보 수정ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
public int updateInfo(Connection conn, Member m) {
		
		int result =0;
		PreparedStatement pstmt= null;
		String sql = prop.getProperty("updateInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserName());
			pstmt.setString(2, m.getGender());	
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getAddress());
			pstmt.setString(6, m.getFoodInter());
			pstmt.setString(7, m.getCleanInter()); 
			pstmt.setString(8, m.getUserId());
			
			result= pstmt.executeUpdate();
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public Member selectMember(Connection conn, String userId) {
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMember");
		Member m = null;
		
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, userId);	  
			rset= pstmt.executeQuery();   
			
			
			if(rset.next()) {   
			m = new Member(rset.getInt("USER_NO"), rset.getString("USER_ID"),rset.getString("USER_PWD")
							,rset.getString("USER_NAME"),rset.getString("GENDER"),rset.getString("PHONE")
							,rset.getString("EMAIL"),rset.getString("ADDRESS"),rset.getString("FOOD_INTEREST")
							,rset.getString("CLEAN_INTEREST"),rset.getDate("CREATE_DATE"),rset.getString("STATUS"));
			
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
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ회원탈퇴하기ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public int deleteMember(Connection conn, int userNo, String userPwd) {
		
		//update니깐 dml구문 
		PreparedStatement pstmt= null;
		String sql = prop.getProperty("deleteMember");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userPwd);
			pstmt.setInt(2, userNo);
						
			result =pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ비밀번호 변경ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public int changePwd(Connection conn, String userId, String nowPwd, String newPwd) {
		int result= 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("changePwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, nowPwd);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}

	//비밀번호 변경했으면 변경한 회원의 정보들을 다 담아서 다시 세션 loginUser 수정해주기
	public Member updateSelectMember(Connection conn, String userId) {
	
		ResultSet rset = null;
		PreparedStatement pstmt= null;
		String sql = prop.getProperty("updateSelectMember");
		Member updateMember = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
			updateMember = new Member(rset.getInt("USER_NO"),rset.getString("USER_ID"),rset.getString("USER_PWD")
									,rset.getString("USER_NAME"),rset.getString("GENDER"),rset.getString("PHONE")
									,rset.getString("EMAIL"),rset.getString("ADDRESS"),rset.getString("FOOD_INTEREST")
									,rset.getString("CLEAN_INTEREST"),rset.getDate("CREATE_DATE"),rset.getString("STATUS"));
			
			
			
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
	
		return updateMember;
		
	}

	
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ테스트 정보 변경해주기ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public int updateTestInfo(Connection conn, Member m) {
		int result =0;
		PreparedStatement pstmt= null;
		String sql = prop.getProperty("updateTestInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getFoodInter());
			pstmt.setString(2, m.getCleanInter()); 
			pstmt.setString(3, m.getUserId());
			
			result= pstmt.executeUpdate();
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	
	}
	



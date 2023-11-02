package com.kh.member.model.service;

import java.sql.Connection;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {

	public Member loginUser(String userId, String userPwd) {

		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().loginUser(conn, userId, userPwd);
		
		JDBCTemplate.close(conn);
		
		return m;
	}

	public int insertMem(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().insertMem(conn, m);
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int idCheck(String checkId) {
		Connection conn = JDBCTemplate.getConnection();
		
		int count = new MemberDao().idCheck(conn, checkId);
		
		JDBCTemplate.close(conn);
		return count;
	}

}

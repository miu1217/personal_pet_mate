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

	public Member findId(String useName, String usePhone) {
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().findId(conn, useName, usePhone);
		
		JDBCTemplate.close(conn);
		return m;
	}

	public int findPwd(String useId, String usePhone) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().findPwd(conn, useId, usePhone);
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	
	
	
	
	
	
	
	
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ마이페이지ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	
	public Member updateInfo(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result=new MemberDao().updateInfo(conn,m);
		Member updateMember = null;
		
		if(result>0) {
			JDBCTemplate.commit(conn);
			 updateMember = new MemberDao().selectMember(conn,m.getUserId());
			
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return updateMember; 
	}

	
	public int deleteMember(int userNo, String userPwd) {
		Connection conn = JDBCTemplate.getConnection();
		int result= new MemberDao().deleteMember(conn,userNo,userPwd);
		
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	public Member changePwd(String userId, String nowPwd, String newPwd) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().changePwd(conn,userId,nowPwd,newPwd);
		Member updateMember = null;
		
		if(result>0) {
			//select문은 원래 트랜잭션처리할 필요없지만 이와같은 경우는 commit을 해야 정보가 업데이트돼서 트랜잭션처리했음 commit만 하기
			JDBCTemplate.commit(conn);
			//비밀번호 변경에 성공했으니깐 이제 업데이트된 회원을 가져와서 세션에 있는 로그인유저정보를 갱신해줘야함
			updateMember =new MemberDao().updateSelectMember(conn,userId);
			
		}else {
			JDBCTemplate.close(conn);
		}
		return updateMember;
	}

	public Member updateTestInfo(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result=new MemberDao().updateTestInfo(conn,m);
		
		Member updateTest = null;
		
		if(result>0) {
			JDBCTemplate.commit(conn);
			updateTest = new MemberDao().selectMember(conn,m.getUserId());
			System.out.println("upddateTest : "+updateTest);
			
		}else {
			System.out.println("실패함");
			JDBCTemplate.rollback(conn);
			
		}
		JDBCTemplate.close(conn);
		
		return updateTest; 


		
	}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

package com.kh.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.model.dao.AdminDao;
import com.kh.board.model.dao.BoardDao;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;
import com.kh.product.model.dao.ProductDao;
import com.kh.product.model.vo.Product;
import com.kh.product.model.vo.ProductAttachment;
import com.kh.product.model.vo.ProductCategory;

public class AdminService {

	public ArrayList<ProductCategory> selectCategoryList() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<ProductCategory> cList = new AdminDao().selectCategoryList(conn);
		
		JDBCTemplate.close(conn);
		
		
		return cList;
	}

	//상품 추가 기능에서 상품 사진 넣는 메소드
	public int insertProduct(Product p, ArrayList<ProductAttachment> pList) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new AdminDao().insertProduct(conn, p);
		
		int result2 = new AdminDao().insertProductPhoto(conn, pList);
		
		if(result*result2 > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result*result2;
	}

	//상품 리스트 가져오는 메소드
	public ArrayList<Product> selectListProduct(PageInfo pi) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Product> pList = new AdminDao().selectListProduct(conn, pi);
		
		JDBCTemplate.close(conn);
		
		
		return pList;
		
		
	}

	//조회수 증가 처리 메소드
	public int increaseCount(int productNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new AdminDao().increaseCount(conn, productNo);
	
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	//상품 조회 메소드
	public Product selectProduct(int productNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		Product p = new AdminDao().selectProduct(conn, productNo);
		
		JDBCTemplate.close(conn);
		
		return p;
	}

	
	//상품 상세 조회 시 사진 리스트 메소드
	public ArrayList<ProductAttachment> selectProductAttachmentList(int productNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<ProductAttachment> list = new AdminDao().selectProductAttachmentList(conn, productNo);
		
		
		JDBCTemplate.close(conn);
		return list;
	}

	//상품 수정 메소드
	public int updateProduct(Product p, ArrayList<ProductAttachment> phList) {
		Connection conn = JDBCTemplate.getConnection();
		
		//상품 수정 메소드
		int result = new AdminDao().updateProduct(conn, p);
		
		
		int result2 = new AdminDao().updateAttachmentList(conn,phList);

		
		
		
		//게시글 수정과 첨부파일 수정 또는 추가 작업 중 하나라도 잘못되었다면
				//되돌리기 작업을 수행하여야한다.
				
		if(result*result2 >0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result*result2;
	}

	
	//상품 삭제 메소드
	public int deleteProduct(int productNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new AdminDao().deleteProduct(conn, productNo);
		
		int result2 = new AdminDao().deleteProductAttachment(conn, productNo);
		
		if(result*result2 > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		
		JDBCTemplate.close(conn);
		return result*result2;
	}

	//회원 리스트 메소드
	public ArrayList<Member> selectMemberList() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> mList = new AdminDao().selectMemberList(conn);
		
		JDBCTemplate.close(conn);
		return mList;
	}

	//회원 조회 메소드 
	public Member selectMember(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new AdminDao().selectMember(conn, userNo);
		
		
		
		JDBCTemplate.close(conn);
		return m;
	}

	
	//회원 수정 메소드
	public Member updateMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new AdminDao().updateMember(conn, m);
		Member updateMem = null;
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
			
			updateMem = new AdminDao().selectMember(conn, m.getUserNo());
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return updateMem;
	}

	
	//회원 삭제 메소드
	public int deleteMember(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new AdminDao().deleteMember(conn, userNo);
		
		if(result >0 ) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	
	// 페이징바 처리
		public int listCount() {
			Connection conn = JDBCTemplate.getConnection();

			int count = new AdminDao().listCount(conn);

			JDBCTemplate.close(conn);

			return count;
		}

}

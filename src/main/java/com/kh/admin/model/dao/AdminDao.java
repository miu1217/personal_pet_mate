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
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.Member;
import com.kh.product.model.vo.Product;
import com.kh.product.model.vo.ProductAttachment;
import com.kh.product.model.vo.ProductCategory;

import oracle.jdbc.proxy.annotation.Pre;

public class AdminDao {
	private Properties prop = new Properties();
	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rset = null;
	
	
	public AdminDao() {
		
		try {
			String filePath = AdminDao.class.getResource("/db/sql/admin-mapper.xml").getPath();
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<ProductCategory> selectCategoryList(Connection conn) {
		 ArrayList<ProductCategory> cList = new  ArrayList<>();
		 
		 
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
	public int insertProduct(Connection conn, Product p) {
		int result = 0; 
		String sql = prop.getProperty("insertProduct");
		
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
	public int insertProductPhoto(Connection conn, ArrayList<ProductAttachment> pList) {
		int result = 1;
		String sql = prop.getProperty("insertProductPhoto");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			for(ProductAttachment at : pList) {
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());
				
				
				//실행후 받은 결과가 하나라도 0이 나오면 결과값을 0으로 만들기 
				result *= pstmt.executeUpdate();
				
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

	//상품 리스트 가져오는 메소드
	public ArrayList<Product> selectListProduct(Connection conn, PageInfo pi) {
		ArrayList<Product> pList = new ArrayList<>();
		String sql = prop.getProperty("selectListProduct");
		
		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		
		
	
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				pList.add(new Product(rset.getInt("PRODUCT_NO")
									,rset.getInt("CATEGORY_NO")
									,rset.getString("CATEGORY_NAME")
									,rset.getString("PRODUCT_NAME")
									,rset.getInt("PRODUCT_PRICE")
									,rset.getString("TITLEIMG")));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return pList;
	}

	public int increaseCount(Connection conn, int productNo) {
		int result = 0;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, productNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	
	//상품 조회 메소드
		public Product selectProduct(Connection conn, int productNo) {
			Product p = null;
			String sql = prop.getProperty("selectProduct");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, productNo);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					p = new Product(rset.getInt("PRODUCT_NO")
							      	,rset.getInt("CATEGORY_NO")
							      	,rset.getString("PRODUCT_NAME")
							      	,rset.getInt("PRODUCT_PRICE")
							      	,rset.getString("PRODUCT_INFO")
							      	,rset.getString("PRODUCT_INGREDIENT")
							      	,rset.getString("PRODUCT_BRAND")
							      	,rset.getInt("COUNT")
							      	,rset.getDate("CREATE_DATE"));
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

		
		//상품 상세 조회시 이미지 첨부 조회 메소드 
		public ArrayList<ProductAttachment> selectProductAttachmentList(Connection conn, int productNo) {
			ArrayList<ProductAttachment> list = new ArrayList<>();
			
			String sql = prop.getProperty("selectProductAttachmentList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, productNo);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new ProductAttachment(rset.getInt("FILE_NO")
							                       ,rset.getString("ORIGIN_NAME")
							                       ,rset.getString("CHANGE_NAME")
							                       ,rset.getString("FILE_PATH")));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			
			
			return list;
		}

		//상품 업데이트 메서드 
		public int updateProduct(Connection conn, Product p) {
			int result = 0;
			String sql = prop.getProperty("updateProduct");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, p.getProductName());
				pstmt.setInt(2, p.getCategoryNo());
				pstmt.setInt(3, p.getProductPrice());
				pstmt.setString(4, p.getProductInfo());
				pstmt.setString(5, p.getProductIngredient());
				pstmt.setString(6, p.getProductBrand());
				pstmt.setInt(7, p.getProductNo());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			
			return result;
		}

		//상품 이미지 업데이트
		public int updateAttachmentList(Connection conn, ArrayList<ProductAttachment> phList) {
			int result = 1;
			String sql = prop.getProperty("updateAttachmentList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				for(ProductAttachment at : phList) {
					
					pstmt.setString(1, at.getOriginName());
					pstmt.setString(2, at.getChangeName());
					pstmt.setString(3, at.getFilePath());
					pstmt.setInt(4, at.getFileLevel());
					pstmt.setInt(5, at.getFileNo());
					
					//실행후 받은 결과가 하나라도 0이 나오면 결과값을 0으로 만들기 
					result *= pstmt.executeUpdate();
					
				}
			} catch (SQLException e) {
				result =0;
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			
			return result;
		}

		//상품 삭제 메소드(상태값 N으로 변경)
		public int deleteProduct(Connection conn, int productNo) {
			int result = 0;
			String sql = prop.getProperty("deleteProduct");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, productNo);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			
			
			return result;
		}

		//상품 이미지 삭제 메소드(상태값 N으로 변경)
		public int deleteProductAttachment(Connection conn, int productNo) {
			int result = 0;
			String sql = prop.getProperty("deleteProductAttachment");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, productNo);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			
			return result;
		}

		//여기서부터 멤버~
		
		//멤버 가지고 오는 메소드
		public ArrayList<Member> selectMemberList(Connection conn) {
			ArrayList<Member> mList = new ArrayList<>();
			String sql = prop.getProperty("selectMemberList");
			
			try {
				stmt = conn.createStatement();
				
				rset = stmt.executeQuery(sql);
				
				while(rset.next()) {
					mList.add(new Member(rset.getInt("USER_NO")
										,rset.getString("USER_NAME")
							            ,rset.getString("USER_ID")
							            ,rset.getString("FOOD_INTEREST")
							            ,rset.getString("CLEAN_INTEREST")
							            ,rset.getDate("CREATE_DATE")));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(stmt);
			}
			return mList;
		}

		
		//회원 정보 조회 메소드
		public Member selectMember(Connection conn, int userNo) {
			Member m = null;
			String sql = prop.getProperty("selectMember");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, userNo);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					m = (new Member(rset.getInt("USER_NO")
									,rset.getString("USER_ID")
									,rset.getString("USER_PWD")
									,rset.getString("USER_NAME")
									,rset.getString("GENDER")
									,rset.getString("PHONE")
									,rset.getString("EMAIL")
									,rset.getString("ADDRESS")));
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

		
		//회원 정보 수정 메소드
		public int updateMember(Connection conn, Member m) {
			int result = 0;
			String sql = prop.getProperty("updateMember");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, m.getUserId());
				pstmt.setString(2, m.getUserName());
				pstmt.setString(3, m.getGender());
				pstmt.setString(4, m.getPhone());
				pstmt.setString(5, m.getEmail());
				pstmt.setString(6, m.getAddress());
				pstmt.setInt(7, m.getUserNo());
				
				result = pstmt.executeUpdate();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
				
			}
			
			
			
			return result;
		}

		
		
		public int deleteMember(Connection conn, int userNo) {
			int result = 0;
			String sql = prop.getProperty("deleteMember");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, userNo);
				
				result = pstmt.executeUpdate();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			return result;
		}

		//전체 게시글 조회
		public int listCount(Connection conn) {
			int count = 0;
			
			String sql = prop.getProperty("listCount");
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(sql);
				
				if(rset.next()) {
					count = rset.getInt("COUNT");
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				JDBCTemplate.close(rset);
				JDBCTemplate.close(stmt);
			}
			
			return count;
		}
		

		

		
}
          


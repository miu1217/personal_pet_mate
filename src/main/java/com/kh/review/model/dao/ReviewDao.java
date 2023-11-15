package com.kh.review.model.dao;

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
import com.kh.review.model.vo.Review;
import com.kh.review.model.vo.ReviewAttachment;

public class ReviewDao {
	private Properties prop = new Properties();
	private ResultSet rset = null;
	private PreparedStatement pstmt = null;
	//review 매퍼파일 읽어오기
	public ReviewDao() {
		try {
			//경로 설정할때 /db로 안하고 db라 해서 오류남 why?뭔차이?
			String filePath = ReviewDao.class.getResource("/db/sql/review-mapper.xml").getPath();
			prop.loadFromXML(new FileInputStream(filePath));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	

	public int insertReview(Connection conn, Review r) {
		int result = 0;
		String sql = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, r.getUserNo());
			pstmt.setInt(2, r.getProductNo());
			pstmt.setString(3, r.getReviewContent());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}




	public int insertReviewAttachment(Connection conn, ReviewAttachment at) {
		int result = 0;
		String sql = prop.getProperty("insertReviewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
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




	public Review selectReview(Connection conn, int reviewNo) {
		Review r = null;
		String sql = prop.getProperty("selectReview");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Review(rset.getInt("REVIEW_NO")
								,rset.getInt("USER_NO")
								,rset.getString("REVIEW_CONTENT")
								,rset.getInt("COUNT")
								,rset.getString("PRODUCT_NAME"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return r;
	}




	public ReviewAttachment selectRvAttachment(Connection conn, int reviewNo) {
		ReviewAttachment ra = null;
		String sql = prop.getProperty("selectRvAttachment");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ra = new ReviewAttachment(rset.getInt("FILE_NO")
							
	                       ,rset.getString("ORIGIN_NAME")
	                       ,rset.getString("CHANGE_NAME")
	                       ,rset.getString("FILE_PATH"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return ra;
	}




	//작성자가 리뷰를 적은게 있는지 확인하는 메소드
	public Review reviewValidate(Connection conn, int productNo, int userNo) {
		Review r = null;
		String sql = prop.getProperty("reviewValidate");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, productNo);
			pstmt.setInt(2, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Review(rset.getInt("REVIEW_NO")
								,rset.getInt("USER_NO"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return r;
	}




	public int updateReview(Connection conn, Review r) {
		int result = 0;
		String sql = prop.getProperty("udpateReview");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, r.getReviewContent());
			pstmt.setInt(2, r.getReviewNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}




	public int updateReviewAttachment(Connection conn, ReviewAttachment at) {
		int result = 0;
		String sql = prop.getProperty("updateReviewAttachment");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}




	public int insertNewAttachment(Connection conn, ReviewAttachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, at.getReviewNo());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
		
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}




	public Review selectUpdateReview(Connection conn, int reviewNo) {
		Review r = null;
		String sql = prop.getProperty("selectUpdateReview");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Review(rset.getInt("REVIEW_NO")
								,rset.getInt("USER_NO")
								,rset.getString("REVIEW_CONTENT")
								,rset.getInt("COUNT")
								,rset.getString("PRODUCT_NAME"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return r;
	}




	public int deleteReview(Connection conn, int reviewNo) {
		int result = 0;
		String sql = prop.getProperty("deleteReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}




	public int deleteReviewAttachment(Connection conn, int reviewNo) {
		int result = 0;
		String sql = prop.getProperty("deleteReviewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}




	public ArrayList<Review> selectReviewList(Connection conn, int pno, int startIndex, int reviewsPage) {
		ArrayList<Review> prList = new ArrayList<>();
		String sql = prop.getProperty("selectReviewList");
		
		reviewsPage = startIndex + reviewsPage -1;
		
		try {
			pstmt  = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pno);
			pstmt.setInt(2, startIndex);
			pstmt.setInt(3, reviewsPage);
			
			System.out.println(startIndex);
			System.out.println(reviewsPage);	
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				prList.add(new Review(rset.getInt("REVIEW_NO")
										,rset.getInt("USER_NO")
										,rset.getInt("PRODUCT_NO")
										,rset.getString("REVIEW_CONTENT")
										,rset.getInt("COUNT")
										,rset.getString("TITLEIMG")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return prList;
	}
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ마이페이지 영역ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ내가 쓴 리뷰 총 갯수ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		public int reviewCount(Connection conn, int userNo) {
			
			int count=0;
			ResultSet rset =null;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("reviewCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				
				rset=pstmt.executeQuery();
				
				if(rset.next()) {
					count = rset.getInt("COUNT");
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



		// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ페이징 처리 한 내가 쓴 리뷰 정보목록 조회 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		public ArrayList<Review> selectMyReviewList(Connection conn, PageInfo pi, int userNo) {
			//내 회원번호를 가지고 리뷰번호를 조회하는거니깐 select문 
					ResultSet rset = null;
					PreparedStatement pstmt = null;
					String sql = prop.getProperty("selectMyReviewList");
					ArrayList<Review> list =new ArrayList<>();
					
					int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit() +1;
					int endRow = pi.getCurrentPage()*pi.getBoardLimit();
					
					try {
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, userNo);
						pstmt.setInt(2, startRow);
						pstmt.setInt(3, endRow);
						
						rset = pstmt.executeQuery();
						
						while(rset.next()) {
							list.add(new Review(rset.getString("TITLEIMG")
									,rset.getString("PRODUCT_NAME")
									,rset.getString("USER_ID")
									,rset.getDate("CREATE_DATE")));
						}

						//System.out.println("Dao");
					//	System.out.println(list);  //아무것도 담기지않았음
						
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally{
						JDBCTemplate.close(rset);
						JDBCTemplate.close(pstmt);
					}
					return list;
		}








		




		
		//ㅡㅡㅡㅡㅡㅡㅡㅡㅡ최근 30일동안 작성한 게시글 5개 정보 조회ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		public ArrayList<Review> recentMyReviewList(Connection conn, int userNo) {
			ResultSet rset = null;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("recentMyReviewList");
			ArrayList<Review> list =new ArrayList<>();
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Review(rset.getString("TITLEIMG")
							,rset.getString("PRODUCT_NAME")
							,rset.getString("USER_ID")
							,rset.getDate("CREATE_DATE")));
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
	
	
	
}

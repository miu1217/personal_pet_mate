package com.kh.qna.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.vo.Attachment;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.qna.model.vo.QnA;
import com.kh.qna.model.vo.QnAAttachment;
import com.kh.qna.model.vo.QnACategory;
import com.kh.qna.model.vo.QnAReply;

public class QnADao {

	private Properties prop = new Properties();
	ResultSet rset = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;

	public QnADao() {
		String filePath = QnADao.class.getResource("/db/sql/qna-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int listCount(Connection conn, int cno) {

		int count = 0;

		String sql = "";

		if (cno == 0) {
			sql = prop.getProperty("listCount");

			try {
				stmt = conn.createStatement();

				rset = stmt.executeQuery(sql);

				if (rset.next()) {
					count = rset.getInt("count");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(stmt);
			}

		} else {
			sql = prop.getProperty("listCountCategory");

			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, cno);

				rset = pstmt.executeQuery();

				if (rset.next()) {
					count = rset.getInt("count");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
		}

		return count;
	}

	public ArrayList<QnA> selectList(Connection conn, PageInfo pi, int cno) {

		ArrayList<QnA> qlist = new ArrayList<>();
		String sql = prop.getProperty("selectQnAList");

		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, cno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				qlist.add(new QnA(rset.getInt("qna_no"), rset.getString("category_name"), rset.getString("qna_title"),
						rset.getString("user_id"), rset.getInt("count"), rset.getDate("create_date")));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return qlist;
	}

	public ArrayList<QnA> selectListAll(Connection conn, PageInfo pi) {

		ArrayList<QnA> qlist = new ArrayList<>();
		String sql = prop.getProperty("selectQnAListAll");

		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				qlist.add(new QnA(rset.getInt("qna_no"), rset.getString("category_name"), rset.getString("qna_title"),
						rset.getString("user_id"), rset.getInt("count"), rset.getDate("create_date")));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return qlist;
	}

	public int increaseCount(Connection conn, int qno) {

		String sql = prop.getProperty("increaseCount");

		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, qno);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public QnA selectQna(Connection conn, int qno) {

		String sql = prop.getProperty("selectQna");
		QnA q = null;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, qno);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				q = new QnA(rset.getInt("qna_no"), rset.getString("user_id"), rset.getString("category_name"),
						rset.getString("qna_title"), rset.getString("qna_content"), rset.getInt("count"),
						rset.getDate("create_date"), rset.getString("status"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return q;
	}

	public QnAAttachment selectQnaAttachment(Connection conn, int qno) {

		String sql = prop.getProperty("selectQnaAttachment");
		QnAAttachment at = null;

		System.out.println(qno);

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, qno);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				at = new QnAAttachment();
				at.setFileNo(rset.getInt("file_no"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
				at.setFilePath(rset.getString("file_path"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return at;
	}
	
	public int insertQna(Connection conn, QnA q) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertQna");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, q.getUserId());
			pstmt.setInt(2, Integer.parseInt(q.getCategory()));
			pstmt.setString(3, q.getQnaTitle());
			pstmt.setString(4, q.getQnaContent());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int insertQnaAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertQnAAttachment");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public ArrayList<QnACategory> selectQnACategory(Connection conn) {

		ArrayList<QnACategory> qlist = new ArrayList<>();
		String sql = prop.getProperty("selectQnACategory");

		try {
			stmt = conn.createStatement();

			rset = stmt.executeQuery(sql);

			while (rset.next()) {
				qlist.add(new QnACategory(rset.getInt("category_no"), rset.getString("category_name")));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}

		return qlist;
	}

	public int insertReply(Connection conn, QnAReply qr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertQnaReply");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qr.getQnaNo());
			pstmt.setInt(2, Integer.parseInt(qr.getQnaReplyWriter()));
			pstmt.setString(3, qr.getQnaReplyContent());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public ArrayList<QnAReply> selectReplyList(Connection conn, int qno) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectQnAReplyList");
		ArrayList<QnAReply> qrlist = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qno);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				qrlist.add(new QnAReply(rset.getInt("REPLY_NO"), rset.getInt("QNA_NO"), rset.getString("USER_ID"),
						rset.getString("REPLY_CONTENT"), rset.getDate("CREATE_DATE")));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return qrlist;
	}

	public int updateReply(Connection conn, int replyNo, String updateReply) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateQnAReply");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updateReply);
			pstmt.setInt(2, replyNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public int deleteReply(Connection conn, int replyNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteQnAReply");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public QnAAttachment selectOriginAttachment(Connection conn, int originFileNo) {
		String sql = prop.getProperty("selectQnaAttachment");
		QnAAttachment at = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, originFileNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {	
				at = new QnAAttachment(rset.getInt("FILE_NO"), rset.getString("ORIGIN_NAME"),
						rset.getString("CHANGE_NAME"), rset.getString("FILE_PATH"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return at;
	}

	public int updateBoard(Connection conn, QnA q) {
		int result = 0;
		String sql = prop.getProperty("updateQna");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, q.getQnaTitle());
			pstmt.setString(2, q.getQnaContent());
			pstmt.setInt(3, q.getQnaNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public int updateQnaAttachment(Connection conn, QnAAttachment at) {
		int result = 0;
		String sql = prop.getProperty("updateQnaAttachment");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public int insertNewQnaAttachment(Connection conn, QnAAttachment at) {
		int result = 0;
		String sql = prop.getProperty("insertNewQnaAttachment");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, at.getQnaNo());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public int deleteQna(Connection conn, int qno) {
		int result = 0;
		String sql = prop.getProperty("deleteQna");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qno);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ마이페이지 영역ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 내가 쓴 QnA 총 수 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
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



		// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ페이징 처리 한 내가 쓴 QnA 정보목록 조회 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
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
				
			//	System.out.println(list);
				
			} catch (SQLException e) {

				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}


			
			
			return list;
		}



		//ㅡㅡㅡㅡㅡㅡㅡㅡㅡ최근 30일동안 작성한 QnA 5개 정보 조회ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		public ArrayList<QnA> recentMyQnAList(Connection conn, int userNo) {
			ResultSet rset = null;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("recentMyQnAList");
			ArrayList<QnA> list =new ArrayList<>();
			
			
			
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);	
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new QnA(rset.getInt("QNA_NO"),
							rset.getString("QNA_TITLE")
							,rset.getDate("CREATE_DATE")));
				}
				
				//System.out.println(list);
				
			} catch (SQLException e) {

				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}


			
			
			return list;
		}
		
		// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ답변 달렸는지 확인버튼ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		public int replyChk(Connection conn, int userNo,int qnaNo) {
			int replyChk= 0;
			ResultSet rset = null;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("replyChk");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				pstmt.setInt(2, qnaNo);
				
				rset=pstmt.executeQuery();
				
				if(rset.next()) {
					replyChk=rset.getInt("COUNT");
				}
				
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return replyChk;
		}
			
		public ArrayList<QnA> getReplyQnAList(Connection conn, int userNo) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("getReplyQnAList");
			ArrayList<QnA> list = new ArrayList<>();
			try {
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();
				while(rset.next()) {
					QnA q = new QnA();
					q.setQnaNo(rset.getInt("QNA_NO"));
					list.add(q);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
				
			}
			
			return list;
		}
	
	

}

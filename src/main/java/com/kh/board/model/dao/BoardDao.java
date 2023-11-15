package com.kh.board.model.dao;

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
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.PagingBar;
import com.kh.board.model.vo.Reply;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;

public class BoardDao {
	private Properties prop = new Properties();

	// 매퍼파일 읽어오는 작업
	public BoardDao() {
		String filePath = BoardDao.class.getResource("/db/sql/board-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	//전체 게시글 조회
	public int listCount(Connection conn) {
		int count = 0;
		ResultSet rset = null;
		String sql = prop.getProperty("listCount");
		Statement stmt = null;
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		
		return count;
	}
	
	//전체 게시글 리스트 조회
	public ArrayList<Board> selectList(Connection conn, PagingBar pb) {
			ArrayList<Board> list = new ArrayList<>();
			ResultSet rset = null;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("selectAllList");
			
			int startRow = (pb.getCurrentPage()-1) * pb.getBoardLimit() + 1;
			int endRow = pb.getCurrentPage() * pb.getBoardLimit();
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1,  startRow);
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Board(rset.getInt("BOARD_NO")
													,rset.getString("BOARD_TITLE")
													,rset.getString("USER_ID")
													,rset.getInt("COUNT")
													,rset.getDate("CREATE_DATE")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
		return list;
	}
	
	//공지게시판 목록 조회
	public ArrayList<Board> selecNtList(Connection conn, PagingBar pn) {
		ArrayList<Board> nlist = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectNList");
		
		int startRow = (pn.getCurrentPage()-1) * pn.getBoardLimit() + 1;
		int endRow = pn.getCurrentPage() * pn.getBoardLimit();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,  startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				nlist.add(new Board(rset.getInt("BOARD_NO")
											,rset.getString("BOARD_TITLE")
											,rset.getString("USER_ID")
											,rset.getInt("COUNT")
											,rset.getDate("CREATE_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return nlist;
	}
	//자유게시판 목록 조회
	public ArrayList<Board> selecFList(Connection conn, PagingBar pf) {
		ArrayList<Board> flist = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectFList");
		
		int startRow = (pf.getCurrentPage()-1) * pf.getBoardLimit() + 1;
		int endRow = pf.getCurrentPage() * pf.getBoardLimit();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,  startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				flist.add(new Board(rset.getInt("BOARD_NO")
											,rset.getString("BOARD_TITLE")
											,rset.getString("USER_ID")
											,rset.getInt("COUNT")
											,rset.getDate("CREATE_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return flist;
	}
	//조회수 증가
	public int increaseCount(Connection conn, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	//게시글 상세보기
	public Board detailBoard(Connection conn, int bno) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("detailBoard");
		
		Board b = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt("BOARD_NO")
										,rset.getInt("BOARD_TYPE")
										,rset.getString("BOARD_TITLE")
										,rset.getString("BOARD_CONTENT")
										,rset.getString("USER_ID")
										,rset.getInt("COUNT")
										,rset.getDate("CREATE_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return b;
	}
	//첨부파일 조회
	public Attachment selectAttachment(Connection conn, int bno) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAttachment");
		Attachment at = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment(rset.getInt("FILE_NO")
												,rset.getString("ORIGIN_NAME")
												,rset.getString("CHANGE_NAME")
												,rset.getString("FILE_PATH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return at;
	}
	//게시글 작성
	public int insertBoard(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getBoardWriter());
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getBoardContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	//첨부파일 추가
	public int insertAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	//공지작성
	public int insertNotice(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBoardWriter());
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getBoardContent());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	//게시글삭제
	public int deleteBoard(Connection conn, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	//게시글 수정
	public int updateBoard(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardNo());
			
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	//첨부파일 수정
	public int updateAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2,  at.getChangeName());
			pstmt.setString(3,  at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	//글 수정 중 새로운 첨부파일 추가
	public int insertNewAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, at.getBoardNo());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4,  at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			 JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	//공지 수정
	public int updateNotice(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}
	
	//댓글조회
	public ArrayList<Reply> selectReplyList(Connection conn, int bno) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectReplyList");
		ArrayList<Reply> rlist = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				rlist.add(new Reply(rset.getInt("REPLY_NO")
						,rset.getInt("BOARD_NO")
						,rset.getString("USER_ID")
						,rset.getString("REPLY_CONTENT")
						,rset.getDate("CREATE_DATE")));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return rlist;
	}
	//댓글 추가
	public int insertReply(Connection conn, Reply r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getBoardNo());
			pstmt.setInt(2, Integer.parseInt(r.getReplyWriter()));
			pstmt.setString(3, r.getReplyContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	public int deleteReply(Connection conn, int replyNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	public int updateReply(Connection conn, int replyNo, String updateReply) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updateReply);
			pstmt.setInt(2, replyNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	public ArrayList<Board> boardSearch(Connection conn, String searchText) {
		ArrayList<Board> slist = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("searchBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchText);
			pstmt.setString(2, searchText);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				slist.add(new Board(rset.getInt("BOARD_NO")
						,rset.getString("BOARD_TITLE")
						,rset.getString("USER_ID")
						,rset.getInt("COUNT")
						,rset.getDate("CREATE_DATE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return slist;
	}
	public ArrayList<Board> searchByTitle(Connection conn, String titleKeyword) {
		ArrayList<Board> slist = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("searchByTitle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, titleKeyword);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				slist.add(new Board(rset.getInt("BOARD_NO")
						,rset.getString("BOARD_TITLE")
						,rset.getString("USER_ID")
						,rset.getInt("COUNT")
						,rset.getDate("CREATE_DATE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return slist;
	}
	public ArrayList<Board> searchByContent(Connection conn, String contentKeyword) {
		ArrayList<Board> slist = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("searchByContent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, contentKeyword);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				slist.add(new Board(rset.getInt("BOARD_NO")
						,rset.getString("BOARD_TITLE")
						,rset.getString("USER_ID")
						,rset.getInt("COUNT")
						,rset.getDate("CREATE_DATE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return slist;
	}
	public Attachment selectOriginAttachment(Connection conn, int originFileNo) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAttachment");
		Attachment at = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, originFileNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment(rset.getInt("FILE_NO")
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
		
		return at;
	}

	
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ마이페이지 영역ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 내가 쓴 게시글 총 수 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public int boardCount(Connection conn, int userNo) {
		
		int count= 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("boardCount");
		
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

	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ페이징 처리 한 내가 쓴 게시글 정보목록 조회 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public ArrayList<Board> selectMyBoardList(Connection conn, PageInfo pi, int userNo) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectMyBoardList");
		ArrayList<Board> list =new ArrayList<>();
		
		
		int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit() +1;
		int endRow = pi.getCurrentPage()*pi.getBoardLimit();
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			System.out.println(userNo);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO")
						,rset.getInt("BOARD_TYPE")
						,rset.getString("BOARD_TITLE")
						,rset.getString("USER_ID")
						,rset.getDate("CREATE_DATE")
						,rset.getInt("COUNT")));
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
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡ최근 30일동안 작성한 게시글 5개 정보 조회ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public ArrayList<Board> recentMyBoardList(Connection conn,int userNo) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("recentMyBoardList");
		ArrayList<Board> list =new ArrayList<>();
		
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);	
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO")
						,rset.getInt("BOARD_TYPE")
						,rset.getString("BOARD_TITLE")
						,rset.getString("USER_ID")
						,rset.getDate("CREATE_DATE")
						,rset.getInt("COUNT")));
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
	
	
	
	
	
	
	
}


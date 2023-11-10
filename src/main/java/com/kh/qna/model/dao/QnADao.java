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

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.qna.model.vo.QnA;
import com.kh.qna.model.vo.QnAAttachment;

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

	public int listCount(Connection conn) {

		int count = 0;
		String sql = prop.getProperty("listCount");

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

}

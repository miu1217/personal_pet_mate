package com.kh.qna.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.model.vo.MyFileRenamePolicy;
import com.kh.qna.model.service.QnAService;
import com.kh.qna.model.vo.QnA;
import com.kh.qna.model.vo.QnAAttachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class QnAUpdateController
 */
@WebServlet("/mate.qnaUpdate")
public class QnAUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QnAUpdateController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int qno = Integer.parseInt(request.getParameter("qno"));

		// 수정페이지에 띄워줄 데이터 조회해오기
		QnA q = new QnAService().selectQna(qno);

		QnAAttachment at = new QnAService().selectQnaAttachment(qno);
		request.setAttribute("q", q);
		request.setAttribute("at", at);
		request.getRequestDispatcher("views/qna/qnaUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;

			String savePath = request.getSession().getServletContext().getRealPath("/resources/qnaUploadFiles/");

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			int qno = Integer.parseInt(multiRequest.getParameter("qno"));
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String writer = multiRequest.getParameter("userNo");
			int originFileNo = Integer.parseInt(multiRequest.getParameter("originFileNo"));

			// System.out.println(originFileNo);

			QnA q = new QnA();
			q.setQnaNo(qno);
			q.setUserId(writer);
			q.setQnaTitle(title);
			q.setQnaContent(content);

			QnAAttachment at = null;

			// Attachment에 담을 데이터
			boolean flag = false;

			if (multiRequest.getOriginalFileName("refile") != null) {
				// 원본파일명이 있다면 첨부파일정보 담아주기
				at = new QnAAttachment();
				// 원본파일명 담기
				at.setOriginName(multiRequest.getOriginalFileName("refile"));
				// 변경한 파일명 담기 (서버에 등록된 파일명)
				at.setChangeName(multiRequest.getFilesystemName("refile"));
				// 경로 담기
				at.setFilePath("/resources/qnaUploadFiles/");

			} else {
				// 기존 첨부파일 있고, 첨부파일 변경하지 않는다면

				if (originFileNo != 0) {
					at = new QnAService().selectOriginAttachment(originFileNo);
				}

			}

			if (multiRequest.getParameter("originFileNo") != null) {
				// 새로 첨부된 파일이 있고 기존 파일도 있다면
				// 파일정보가 등록된 데이터에서 변경 작업을 한다. update
				at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));

				// 기존 첨부파일 삭제 플래그
				flag = true;
			} else {
				// 참조 게시글 번호를 세팅
				at.setQnaNo(qno);

			}

			// 게시글 정보와 첨부파일 정보 전달
			int result = new QnAService().updateBoard(q, at);

			// System.out.println(b.getBoardNo());

			if (result > 0) { // 성공
				session.setAttribute("message", "게시글이 수정되었습니다.");

				response.sendRedirect(request.getContextPath() + "/mate.qnaDetail?qno=" + q.getQnaNo());

			} else { // 실패
				// 게시글 등록에 실패했다면 서버에 업로드된 파일을 지우기
				if (at != null) { // 첨부파일이 있다면 삭제작업
					new File(savePath + at.getChangeName()).delete();
				}

				session.setAttribute("message", "게시글 수정 실패");
				response.sendRedirect(request.getContextPath() + "/mate.qna?currentPage=1&category=0");
			}

		}
	}

}

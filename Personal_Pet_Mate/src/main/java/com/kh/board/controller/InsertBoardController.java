package com.kh.board.controller;

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
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardInsertController
 */
@WebServlet("/pet.insertBo")
public class InsertBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/board/boardInsert.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/boardUploadFiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy()); 
			
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String writer = multiRequest.getParameter("userNo"); 
			int type = 2;
			Board b = new Board();
			b.setBoardType(type);
			b.setBoardWriter(writer);
			b.setBoardTitle(title);
			b.setBoardContent(content);
			
			//Attachment에 담을 데이터
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("file") != null) {
				//원본파일명이 있다면 첨부파일정보 담아주기
				at = new Attachment();
				//원본파일명 담기
				at.setOriginName(multiRequest.getOriginalFileName("file"));
				//변경한 파일명 담기 (서버에 등록된 파일명)
				at.setChangeName(multiRequest.getFilesystemName("file"));
				//경로 담기
				at.setFilePath("/resources/boardUploadFiles/"); 
				
			}
			
			//게시글 정보와 첨부파일 정보 전달
			int result = new BoardService().insertBoard(b,at);
			
			
			if(result>0) { //성공
				session.setAttribute("message", "게시글이 등록되었습니다.");
				
				response.sendRedirect(request.getContextPath()+"/pet.boardMain?currentPage=1");
				
			}else { //실패
				//게시글 등록에 실패했다면 서버에 업로드된 파일을 지워야한다.
				//파일객체 등록 후 delete하면 된다??
				if(at!=null) { //첨부파일이 있다면 삭제작업
					new File(savePath+at.getChangeName()).delete();
				}
				
				session.setAttribute("message", "게시글 등록 실패");
				response.sendRedirect(request.getContextPath()+"/pet.boardMain?currentPage=1");
			}
			
			
		}
		
		
	}

}

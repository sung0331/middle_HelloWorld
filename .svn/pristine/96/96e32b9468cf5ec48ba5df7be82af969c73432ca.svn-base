package kr.or.ddit.controller.manager;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.manager.IManagerBoardService;
import kr.or.ddit.service.manager.ManagerBoardServiceImpl;
import kr.or.ddit.vo.BoardVo;

@WebServlet("/managerAnnouncementUpdate.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 3, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 50)

public class ManagerAnnouncementUpdateController extends HttpServlet {
	IManagerBoardService boardService = ManagerBoardServiceImpl.getInstance();
	String upload_dir = "upload_img_board";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("관리자 공지사향 수정 페이지");
		HttpSession session = req.getSession();
		session.setAttribute("mangerPageCode", "managerAnnouncementUpdate");
		System.out.println(session.getAttribute("mangerPageCode"));

		int board_no = Integer.parseInt(req.getParameter("post_no"));
		BoardVo board = boardService.boardDetail(board_no);
		System.out.println("board"+board);
		req.setAttribute("board", board);
		
		req.getRequestDispatcher("/WEB-INF/mangerMyPage.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 업데이트 처리
		System.out.println("관리자 공지사향 수정 페이지");
		System.out.println(req.getParameter("title"));
		System.out.println(req.getParameter("content"));
		String title =  req.getParameter("title");
		String content =  req.getParameter("content");
		System.out.println(title);
		System.out.println(content);
		BoardVo board = new BoardVo();
		board.setPost_no(Integer.parseInt(req.getParameter("post_no")));
		board.setTitle(title);
		board.setContent(content);
		System.out.println("boardVo =>" + board);
		boardService.boardUpdate(board);

		
		resp.sendRedirect(req.getContextPath() + "/managerAnnouncementInfo.do");
	
	}
}

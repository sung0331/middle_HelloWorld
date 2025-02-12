package kr.or.ddit.controller.manager;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.manager.IManagerBoardService;
import kr.or.ddit.service.manager.ManagerBoardServiceImpl;
import kr.or.ddit.vo.BoardVo;

@WebServlet("/mangerBoardDelete.do")

public class ManagerBoardDeleteController extends HttpServlet {
	IManagerBoardService boardService = ManagerBoardServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("관리자 게시판 삭제 페이지");
		HttpSession session = req.getSession();
		session.setAttribute("mangerPageCode", "mangerBoardDetail");
		System.out.println(session.getAttribute("mangerPageCode"));

		int board_no = Integer.parseInt(req.getParameter("post_no"));
	boardService.boardDelete(board_no);
		
		
	resp.sendRedirect(req.getContextPath() + "/mangerBoardInfo.do");
	}
}

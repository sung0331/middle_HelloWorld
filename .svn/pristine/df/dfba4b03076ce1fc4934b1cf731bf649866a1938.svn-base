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

@WebServlet("/mangerBoardDetail.do")

public class ManagerBoardDetailController extends HttpServlet {
	IManagerBoardService boardService = ManagerBoardServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("관리자 게시판 세부 정보 페이지");
		HttpSession session = req.getSession();
		session.setAttribute("mangerPageCode", "mangerBoardDetail");
		System.out.println(session.getAttribute("mangerPageCode"));

		int board_no = Integer.parseInt(req.getParameter("post_no"));
		BoardVo board = boardService.boardDetail(board_no);
		System.out.println("board"+board);
		req.setAttribute("board", board);
		req.getRequestDispatcher("/WEB-INF/mangerMyPage.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 업데이트 처리
		System.out.println("관리자 게시판 수정 페이지");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		System.out.println(title);
		System.out.println(content);
		BoardVo board = new BoardVo();
		board.setPost_no(Integer.parseInt(req.getParameter("post_no")));
		board.setTitle(title);
		board.setContent(content);
		System.out.println("boardVo =>" + board);
		boardService.boardUpdate(board);

//		HttpSession session = req.getSession();
//		session.setAttribute("mangerPageCode", "mangerBoardInfo");
//		System.out.println(session.getAttribute("mangerPageCode"));
//
////		req.getRequestDispatcher("/WEB-INF/mangerMyPage.jsp").forward(req, resp);
		
		////////////////
//		HttpSession session = req.getSession();
//		session.setAttribute("mangerPageCode", "mangerBoardInfo");
//		System.out.println(session.getAttribute("mangerPageCode"));

		// 게시물 목록 정보 및 페이징 처리 정보 생성하기
//		int currentPage = 1;

//		String page = req.getParameter("page");
//		System.out.println(page);
//		currentPage = page == null ? 1 : Integer.parseInt(page);
		// 서비스 객체 얻기
//		IManagerBoardService service = ManagerBoardServiceImpl.getInstance();
		// 전체 글 갯수 조회하기
//		int totalCount = service.countList();
//		System.out.println(totalCount);
		// 화면에 표시될 페이지의 수
//		int perPage = 2;

		// 한 페이지당 출력할 글 갯수
//		int perList = 5;

		// 전체 페이지 수 = 전체 글 갯수(totalCount) / 페이지 당 글 갯수(perList)
//		int totalPage = (int) Math.ceil((double) totalCount / (double) perList);

		// 페이지 별 게시글 범위(start ~ end) 구하기

//		int start = (currentPage - 1) * perList + 1;
//
//		int end = start + perList - 1;
//		if (end > totalCount)
//			end = totalCount;
		// 페이지 범위(startPage ~ endPage) 구하기
		// startPage = ((currentPage - 1) / perPage * perPage) + 1;
//		for(int i=1; i<=10; i++) {
//			System.out.println( "현재페이지 " + i + "일 때 >> " + (((i - 1) / perPage * perPage) + 1)  );
//		}
//		int startPage = ((currentPage - 1) / perPage * perPage) + 1;

		// endPage = startPage + perPage - 1;
//		int endPage = startPage + perPage - 1;
//		if (endPage > totalPage)
//			endPage = totalPage;// 계산된 페이지가 실제 총 페이지 수보다 클때 값 수정

//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("start", start);
//		map.put("end", end);

		// 범위 별 게시물 조회
//		List<BoardVo> list = service.selectList(map);
//		System.out.println(list);
//		req.setAttribute("list", list);
//		req.setAttribute("cPage", currentPage);
//		req.setAttribute("sPage", startPage);
//		req.setAttribute("ePage", endPage);
//		req.setAttribute("tPage", totalPage);
		
//		req.getRequestDispatcher("/WEB-INF/mangerMyPage.jsp").forward(req, resp);
		
		resp.sendRedirect(req.getContextPath() + "/mangerBoardInfo.do");
	
	}
}

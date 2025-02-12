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
import kr.or.ddit.service.manager.IManagerCustomerService;
import kr.or.ddit.service.manager.IManagerProdService;
import kr.or.ddit.service.manager.ManagerBoardServiceImpl;
import kr.or.ddit.service.manager.ManagerCustomerServiceImpl;
import kr.or.ddit.service.manager.ManagerProdServiceImpl;
import kr.or.ddit.vo.BoardVo;
import kr.or.ddit.vo.BuyCartVo;
import kr.or.ddit.vo.CustomerVo;

@WebServlet("/mangerSellDetail.do")

public class ManagerSellDetailController extends HttpServlet {
	IManagerProdService prodservice = ManagerProdServiceImpl.getInstance();
	IManagerCustomerService customerService = ManagerCustomerServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("관리자 출고 세부 정보 페이지");
		HttpSession session = req.getSession();
		session.setAttribute("mangerPageCode", "mangerSellDetail");
		System.out.println(session.getAttribute("mangerPageCode"));
		int cust_no = Integer.parseInt(req.getParameter("cust_no"));
		CustomerVo customer = customerService.customerDetail(cust_no);
		int buy_no = Integer.parseInt(req.getParameter("buy_no"));
		int state = Integer.parseInt(req.getParameter("state"));

		List<BuyCartVo> cart = prodservice.prodDetail(buy_no);
//		System.out.println("board"+board);
		req.setAttribute("cart", cart);
		req.setAttribute("buy_no", buy_no);
		req.setAttribute("state", state);

		req.setAttribute("customer", customer);
		req.getRequestDispatcher("/WEB-INF/mangerMyPage.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 업데이트 처리
		System.out.println("관리자 출고 세부 정보 post 페이지");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		System.out.println(title);
		System.out.println(content);
		BoardVo board = new BoardVo();
		board.setPost_no(Integer.parseInt(req.getParameter("post_no")));
		board.setTitle(title);
		board.setContent(content);
		System.out.println("boardVo =>" + board);
//		boardService.boardUpdate(board);

		resp.sendRedirect(req.getContextPath() + "/mangerSellInfo.do");

	}
}

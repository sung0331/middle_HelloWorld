package kr.or.ddit.controller.manager;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.manager.IManagerCustomerService;
import kr.or.ddit.service.manager.IManagerEmpService;
import kr.or.ddit.service.manager.IManagerProdService;
import kr.or.ddit.service.manager.IManagerSheduleService;
import kr.or.ddit.service.manager.ManagerCustomerServiceImpl;
import kr.or.ddit.service.manager.ManagerEmpServiceImpl;
import kr.or.ddit.service.manager.ManagerProdServiceImpl;
import kr.or.ddit.service.manager.ManagerSheduleServiceImpl;
@WebServlet("/mangerSellUpdate.do")

public class ManagerSellUpdateController extends HttpServlet {
	IManagerProdService prodservice = ManagerProdServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("관리자 주문 업데이트 페이지");
		HttpSession session = req.getSession();
		System.out.println(session);
		session.setAttribute("mangerPageCode", "mangerSellUpdate");
		System.out.println(session.getAttribute("mangerPageCode"));
		int buy_no = Integer.parseInt(req.getParameter("buy_no"));
		System.out.println(buy_no);
		prodservice.sellUpdate(buy_no);
		
		resp.sendRedirect(req.getContextPath() + "/mangerSellInfo.do");
	}
}

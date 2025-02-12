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
import kr.or.ddit.service.manager.IManagerSheduleService;
import kr.or.ddit.service.manager.ManagerCustomerServiceImpl;
import kr.or.ddit.service.manager.ManagerEmpServiceImpl;
import kr.or.ddit.service.manager.ManagerSheduleServiceImpl;
@WebServlet("/ManagerSheduleDelete.do")

public class ManagerSheduleDeleteController extends HttpServlet {
	IManagerSheduleService sheduleService= ManagerSheduleServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("관리자 스케줄 삭제 페이지");
		HttpSession session = req.getSession();
		System.out.println(session);
		session.setAttribute("mangerPageCode", "managerSheduleInfo");
		System.out.println(session.getAttribute("mangerPageCode"));
		int shed_no = Integer.parseInt(req.getParameter("shed_no"));
		System.out.println(shed_no);
		sheduleService.deleteshedule(shed_no);
		
		resp.sendRedirect(req.getContextPath() + "/ManagerSheduleInfo.do");
	}
}

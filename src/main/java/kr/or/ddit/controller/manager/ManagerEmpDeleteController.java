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
import kr.or.ddit.service.manager.ManagerCustomerServiceImpl;
import kr.or.ddit.service.manager.ManagerEmpServiceImpl;
@WebServlet("/managerEmpDelete.do")

public class ManagerEmpDeleteController extends HttpServlet {
	IManagerEmpService empService=ManagerEmpServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("관리자 고객정보 삭제 페이지");
		HttpSession session = req.getSession();
		System.out.println(session);
		session.setAttribute("mangerPageCode", "mangerEmpInfo");
		System.out.println(session.getAttribute("mangerPageCode"));
		int cust_no = Integer.parseInt(req.getParameter("cust_no"));
		empService.deleteEmp(cust_no);
		
		resp.sendRedirect(req.getContextPath() + "/mangerEmpInfo.do");
	}
}

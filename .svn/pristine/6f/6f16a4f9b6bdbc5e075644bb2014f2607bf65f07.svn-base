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
import kr.or.ddit.dao.manager.IManagerCustomerDao;
import kr.or.ddit.service.manager.IManagerBoardService;
import kr.or.ddit.service.manager.IManagerCustomerService;
import kr.or.ddit.service.manager.IManagerEmpService;
import kr.or.ddit.service.manager.ManagerBoardServiceImpl;
import kr.or.ddit.service.manager.ManagerCustomerServiceImpl;
import kr.or.ddit.service.manager.ManagerEmpServiceImpl;
import kr.or.ddit.vo.BoardVo;
import kr.or.ddit.vo.CustomerVo;
import kr.or.ddit.vo.DepartmentVo;
import kr.or.ddit.vo.empVo;

@WebServlet("/managerDepartmentUpdate.do")

public class ManagerDepartmentUpdateController extends HttpServlet {
	IManagerEmpService empService=ManagerEmpServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("관리자 직원 조직도 업데이트 페이지");
		HttpSession session = req.getSession();
		System.out.println(session);
		session.setAttribute("mangerPageCode", "managerDepartmentInfo");
		System.out.println(session.getAttribute("mangerPageCode"));
		int emp_no = Integer.parseInt(req.getParameter("emp_no"));	
		int department_no=Integer.parseInt(req.getParameter("department"));	
		empVo emp=new empVo();
		emp.setEmp_no(emp_no);
		emp.setDepartment_no(department_no);
		empService.changeDepartment(emp);
		resp.sendRedirect(req.getContextPath() + "/managerDepartmentInfo.do");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}

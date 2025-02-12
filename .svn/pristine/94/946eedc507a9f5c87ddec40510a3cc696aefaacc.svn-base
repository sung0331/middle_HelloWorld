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
import kr.or.ddit.dao.manager.ManagerVacationDaoImpl;
import kr.or.ddit.service.manager.IManagerBoardService;
import kr.or.ddit.service.manager.IManagerCustomerService;
import kr.or.ddit.service.manager.IManagerEmpService;
import kr.or.ddit.service.manager.IManagerVacationService;
import kr.or.ddit.service.manager.ManagerBoardServiceImpl;
import kr.or.ddit.service.manager.ManagerCustomerServiceImpl;
import kr.or.ddit.service.manager.ManagerEmpServiceImpl;
import kr.or.ddit.service.manager.ManagerVacationServiceImpl;
import kr.or.ddit.vo.BoardVo;
import kr.or.ddit.vo.CustomerVo;
import kr.or.ddit.vo.VacationVo;
import kr.or.ddit.vo.empVo;

@WebServlet("/ManagerVacationState.do")

public class ManagerVacationStateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IManagerVacationService vacationService= ManagerVacationServiceImpl.getInstance();

		System.out.println("관리자 휴가 변경 페이지");
		HttpSession session = req.getSession();
		System.out.println(session);
		session.setAttribute("mangerPageCode", "mangerEmpInfo");
		System.out.println(session.getAttribute("mangerPageCode"));
		VacationVo vacation= new VacationVo();
		int vacation_no=Integer.parseInt(req.getParameter("vacation_no"));
		vacation.setVacation_no(vacation_no);
		int state_no=Integer.parseInt(req.getParameter("state_no"));
		vacation.setVaction_state(state_no);

		vacationService.changeState(vacation);
		
		resp.sendRedirect(req.getContextPath() + "/ManagerVacationInfo.do");
		}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}

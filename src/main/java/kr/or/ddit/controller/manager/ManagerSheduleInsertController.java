package kr.or.ddit.controller.manager;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.manager.IManagerEmpService;
import kr.or.ddit.service.manager.IManagerSheduleService;
import kr.or.ddit.service.manager.ManagerEmpServiceImpl;
import kr.or.ddit.service.manager.ManagerSheduleServiceImpl;
import kr.or.ddit.vo.RideVo;
import kr.or.ddit.vo.SheduleVo;
import kr.or.ddit.vo.empVo;

@WebServlet("/ManagerSheduleInsert.do")

public class ManagerSheduleInsertController extends HttpServlet {
	IManagerSheduleService shedService = ManagerSheduleServiceImpl.getInstance();
	IManagerEmpService empService = ManagerEmpServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("관리자 스케줄 추가 페이지");
		HttpSession session = req.getSession();
		List<empVo> list = empService.selectEmpAll();
		req.setAttribute("list", list);
		System.out.println(list);
		List<RideVo> ride = shedService.getRideAll();
		req.setAttribute("ride", ride);
		System.out.println(ride);

		session.setAttribute("mangerPageCode", "managerSheduleInsert");
		System.out.println(session.getAttribute("mangerPageCode"));
		req.getRequestDispatcher("/WEB-INF/mangerMyPage.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 업데이트 처리
		SheduleVo shedule = new SheduleVo();
		System.out.println("관리자 스케줄 추가 post 페이지");
		int name = Integer.parseInt(req.getParameter("name"));
		int ride = Integer.parseInt(req.getParameter("ride"));
		String time = req.getParameter("time");
		if (time != null) {

			String[] timeParts = time.split("-");
			shedule.setShed_start_time(timeParts[0]);
			System.out.println(timeParts[0]);
			shedule.setShed_end_time(timeParts[1]);
			System.out.println(timeParts[1]);

		}
//		SimpleDateFormat newFormat = new SimpleDateFormat("yyyy-MM-dd");
//		String formattedDate = newFormat.format(req.getParameter("date"));

		System.out.println("name=" + name);
		System.out.println("ride=" + ride);
		System.out.println("time=" + time);
//		HttpSession session = req.getSession();
//		CustomerVo customerVo = (CustomerVo) session.getAttribute("user");

		shedule.setEmp_no(name);
		shedule.setRide_no(ride);
		shedule.setShed_date(req.getParameter("date"));
//		shedule.setShed_date(formattedDate);
		System.out.println("shedule" + shedule);
		shedService.sheduleInsert(shedule);

		resp.sendRedirect(req.getContextPath() + "/ManagerSheduleInfo.do");

	}
}
package kr.or.ddit.controller.employee;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import kr.or.ddit.service.employee.EmpServicelmpl;
import kr.or.ddit.service.employee.IEmpService;
import kr.or.ddit.vo.CustomerVo;
import kr.or.ddit.vo.empVo;

@WebServlet("/empMain")
public class empController extends HttpServlet {
	
	IEmpService empService = EmpServicelmpl.getInstacne();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("직원 마이페이지");
		HttpSession session = req.getSession();

		CustomerVo a=(CustomerVo)session.getAttribute("user");
		System.out.println("user"+a);
		
        session.setAttribute("employeePageCode", "empMyPage");
		
//		주문 예약 날짜 -> 사용 날짜 , 구매날짜 -> 예약 날짜
//		List<empVo> empList = empService.cateList();
//		System.out.println(empList);
//
//		req.setAttribute("empList", empList); // cateList에 담아서 jsp 페이지 적용
		
		req.getRequestDispatcher("/WEB-INF/employeePage.jsp").forward(req, resp);
	}

}



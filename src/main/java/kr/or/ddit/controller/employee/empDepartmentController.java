package kr.or.ddit.controller.employee;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.employee.EmpServicelmpl;
import kr.or.ddit.service.employee.IEmpService;
import kr.or.ddit.vo.empVo;

@WebServlet("/Department")
public class empDepartmentController extends HttpServlet {
	
	IEmpService IEmpService = EmpServicelmpl.getInstacne();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("직원 조직도");
		
		HttpSession session = req.getSession();
        session.setAttribute("employeePageCode", "empDepartment");
		
//		주문 예약 날짜 -> 사용 날짜 , 구매날짜 -> 예약 날짜
		List<empVo> empDepartment = IEmpService.empDepartment();
		
		System.out.println(empDepartment);
		req.setAttribute("empDepartment", empDepartment);
		
		req.getRequestDispatcher("/WEB-INF/employeePage.jsp").forward(req, resp);
	}

}



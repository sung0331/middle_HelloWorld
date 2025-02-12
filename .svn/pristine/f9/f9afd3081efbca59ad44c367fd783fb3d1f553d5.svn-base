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

@WebServlet("/menu.do")
public class empMenuController extends HttpServlet {
	
	IEmpService iEmpService = EmpServicelmpl.getInstacne();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("직원 구내식당");
		
		  HttpSession session = req.getSession();
	        session.setAttribute("employeePageCode", "Menu"); // 소문자로 변경하여 일관성 유지
	 //       System.out.println(session.getAttribute("employeePageCode"));
	        
		req.getRequestDispatcher("/WEB-INF/employeePage.jsp").forward(req, resp);
	}

}

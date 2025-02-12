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
import kr.or.ddit.vo.CustomerVo;
import kr.or.ddit.vo.empVo;

@WebServlet("/empBoard")
public class empBoardController extends HttpServlet {
	
	IEmpService IEmpService = EmpServicelmpl.getInstacne();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("직원 공지사항");
		
		HttpSession session = req.getSession();
        session.setAttribute("employeePageCode", "empBoard");
        
        CustomerVo empvo = (CustomerVo) session.getAttribute("user");//10.07
  	   	int a= empvo.getCust_no();
  	   	System.out.println("empvo"+ empvo);
  	   	empVo Emp= new empVo();
  	   	Emp.setEmp_no(a);
        
  	   	// 직원 공지사항 정보를 가져옵니다.
  			List<empVo> empBoard = IEmpService.empBoard(Emp);
//		주문 예약 날짜 -> 사용 날짜 , 구매날짜 -> 예약 날짜
  			
  			
//		List<empVo> empBoard = IEmpService.empBoard();
		
		System.out.println(empBoard);
		req.setAttribute("empBoard", empBoard);
		
		req.getRequestDispatcher("/WEB-INF/employeePage.jsp").forward(req, resp);
	}

}



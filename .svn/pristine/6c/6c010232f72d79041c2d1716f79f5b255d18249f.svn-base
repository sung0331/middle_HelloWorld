package kr.or.ddit.controller.employee;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.service.employee.EmpServicelmpl;
import kr.or.ddit.service.employee.IEmpService;
import kr.or.ddit.vo.CustomerVo;
import kr.or.ddit.vo.empVo;

@WebServlet("/empDeailBoard.do")
public class empDeailBoardController extends HttpServlet {
	
	IEmpService iEmpService = EmpServicelmpl.getInstacne();
	
	@Override //empVacationController 부분
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("확인");
		List<empVo> empDeailBoard = iEmpService.empDeailBoard();
		

		
		System.out.println(empDeailBoard);
		req.setAttribute("empDeailBoard", empDeailBoard);
		
		req.getRequestDispatcher("/WEB-INF/view/employee/empBoardDetail.jsp").forward(req, resp);
	}
	
}


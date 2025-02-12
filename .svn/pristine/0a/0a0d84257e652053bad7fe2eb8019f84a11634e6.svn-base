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
import kr.or.ddit.vo.MakeVo;
import kr.or.ddit.vo.empVo;

@WebServlet("/empInformation.do")
public class empInformationController extends HttpServlet {
	
	IEmpService empService = EmpServicelmpl.getInstacne();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("직원개인정보페이지입니다.");
		
		HttpSession session = req.getSession();
        session.setAttribute("employeePageCode", "empInformation");
		
        CustomerVo empvo = (CustomerVo) session.getAttribute("user");//10.07
  	   	int a= empvo.getCust_no();
  	   	System.out.println("empvo"+ empvo);
  	   	empVo Emp= new empVo();
  	   	Emp.setEmp_no(a);
        
		req.getRequestDispatcher("/WEB-INF/employeePage.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("내용 수정 및 탈퇴");
	
		 // 클라이언트로부터 값 가져오기
		 String action = req.getParameter("action");
		 System.out.println("Action parameter: " + action);
		 
	     String custNoParam = req.getParameter("userNo");
	     System.out.println("userNo parameter: " + custNoParam);
	     
	     if (custNoParam == null || custNoParam.isEmpty()) {
	            req.setAttribute("message", "잘못된 요청입니다.");
	            req.getRequestDispatcher("/WEB-INF/employeePage.jsp").forward(req, resp);
	            return;
	        }
	        
	     		int custNo = Integer.parseInt(custNoParam);

	        if ("editProfile".equals(action)) {
	            // 수정 처리 로직
	            System.out.println("회원정보 수정 처리");
	            // 수정 로직 추가 후 성공 시 메시지 전달
	            req.setAttribute("message", "회원정보 수정이 완료되었습니다.");
	            req.getRequestDispatcher("/WEB-INF/employeePage.jsp").forward(req, resp);
	        } else if ("deleteAccount".equals(action)) {
	            // 탈퇴 처리 로직
	            System.out.println("회원 탈퇴 처리");
	            empVo emp = new empVo();
	            emp.setCust_no(custNo);

	   		 	int deleteResult = empService.deleteCustomer(custNo);
	            if (deleteResult > 0) {
	                System.out.println("탈퇴 성공");
	                resp.sendRedirect(req.getContextPath() + "/index.do");
	            } else {
	                System.out.println("탈퇴 실패");
	                req.setAttribute("message", "탈퇴에 실패했습니다.");
	                req.getRequestDispatcher("/WEB-INF/employeePage.jsp").forward(req, resp);
	            }
	        }
	    }

}



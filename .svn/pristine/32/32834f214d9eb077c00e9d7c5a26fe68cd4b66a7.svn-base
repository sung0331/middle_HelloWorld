package kr.or.ddit.controller.employee;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

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

@WebServlet("/insert.do")
public class insertVacationController extends HttpServlet {
   
   IEmpService IEmpService = EmpServicelmpl.getInstacne();
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      System.out.println("휴가신청페이지입니다.");
      
      
      req.getRequestDispatcher("/WEB-INF/view/employee/insertVacation.jsp").forward(req, resp);
   }

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
	   HttpSession session = req.getSession();
	   CustomerVo empvo = (CustomerVo) session.getAttribute("user");//10.07
	   
	   int custNo = empvo.getCust_no();
	   System.out.println("empvo : "+ empvo);
	   System.out.println("custNo : "+ custNo);
          
	   
	   // 폼 데이터 수집
        String vacationType = req.getParameter("vacation_type");
        String startDate = req.getParameter("start_date");
        String endDate = req.getParameter("end_date");
        
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        

        System.out.println("vacationType :"+vacationType);
        System.out.println("startDate :"+startDate);
        System.out.println("endDate :"+endDate);
        // 현재 시간 설정 (신청일)
        LocalDateTime now = LocalDateTime.now();
        
        // Vo 객체에 데이터 설정
        empVo emp = new empVo();
        emp.setEmp_no(custNo);
        emp.setVacation_type(vacationType);
        emp.setStart_date(startDate);
        emp.setEnd_date(endDate);
//        emp.setAppli_date(applicationDate);
        
        //세션에 데이터 설정
        session.setAttribute("emp", emp);
        session.setAttribute("custNo",custNo);
        session.setAttribute("vacation_type",emp.getVacation_type());
        session.setAttribute("start_date",emp.getVacation_type());
        session.setAttribute("end_date",emp.getVacation_type());
        
        System.out.println("custNo :"+custNo);
        
//        emp.setVacation_type(vacationType);
//        emp.setStart_date(startDate);
//        emp.setEnd_date(endDate);
//        emp.setAppli_date(applicationDate);
        
        // 서비스 호출하여 데이터 삽입
        boolean result = IEmpService.insertVacation(emp);
        
        if (result) {
            // 성공 시
            resp.sendRedirect(req.getContextPath() + "/empVacation");
        } else {
            // 실패 시 에러 메시지 표시
            req.setAttribute("errorMessage", "휴가 신청에 실패하였습니다.");
            req.getRequestDispatcher("/WEB-INF/view/employee/insertVacation.jsp").forward(req, resp);
        }
    }
}

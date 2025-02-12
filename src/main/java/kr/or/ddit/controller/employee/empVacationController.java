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

@WebServlet("/empVacation")
public class empVacationController extends HttpServlet {
   
    private static final long serialVersionUID = 1L;   //10-05
   IEmpService iEmpService = EmpServicelmpl.getInstacne();
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      System.out.println("직원 휴가홈");
      
      HttpSession session = req.getSession();
        session.setAttribute("employeePageCode", "empVacation");
      
//      String empNoParam = req.getParameter("cust_id"); //세션 지정해서 불려오기
//      // 로그인된 사용자 정보를 세션에서 가져옴
//        HttpSession session = req.getSession();
//        empVo loggedInUser = (empVo) session.getAttribute("user"); // 로그인 시 저장된 사용자 정보 가져오기
//        
//        if (loggedInUser == null) {
//            // 로그인이 되어 있지 않으면 로그인 페이지로 리다이렉트
//            resp.sendRedirect(req.getContextPath() + "/login.do");
//            return;
//        }
//        
//        // 현재 로그인한 사용자의 emp_no를 사용하여 해당 사용자의 정보를 가져옴
//        int empNo = loggedInUser.getEmp_no();
//
//        // 세션에 현재 페이지 코드 설정 (사용자 편의를 위해)
//        session.setAttribute("employeePageCode", "empVacation");
//
//        // 로그인된 사용자 정보를 사용하여 해당 직원의 휴가 정보를 조회
//        empVo emp = new empVo();
//        emp.setEmp_no(empNo);
        
 	   CustomerVo empvo = (CustomerVo) session.getAttribute("user");//10.07
 	   int a= empvo.getCust_no();
 	   System.out.println("empvo"+ empvo);
        

      empVo Emp= new empVo();
      Emp.setEmp_no(a);
//      Emp.setEmp_no(4);//???????
      
        // 상태에 따른 휴가 목록 조회
        List<empVo> stateVacation = iEmpService.stateVacation(Emp);
        
        // 휴가홈 목록
        List<empVo> empVacation = iEmpService.empVacation(Emp);
        System.out.println("empVo="+empVacation);

        // 콘솔 출력 (디버깅용)
        System.out.println("조회된 휴가 신청 목록 (상태 " + stateVacation + "): " + stateVacation);
        System.out.println("stateVacation"+stateVacation);
        
        
        // 요청 객체에 속성 추가하여 JSP로 전달
        req.setAttribute("stateVacation", stateVacation);
      req.setAttribute("empVacation", empVacation);

        // JSP로 포워딩
        req.getRequestDispatcher("/WEB-INF/employeePage.jsp").forward(req, resp);
   }
   
}



package kr.or.ddit.controller.employee;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

@WebServlet("/calendar.do")
public class empCalendarController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	IEmpService empService = EmpServicelmpl.getInstacne();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("직원 일정표");
		
		HttpSession session = req.getSession();
        session.setAttribute("employeePageCode", "empCalendar");
		
        CustomerVo empvo = (CustomerVo) session.getAttribute("user");//10.07
  	   	int a= empvo.getCust_no();
  	   	System.out.println("empvo"+ empvo);
  	   	empVo Emp= new empVo();
  	   	Emp.setEmp_no(a);
        
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 원하는 형식으로 변환
		
		// 직원 휴가 정보를 가져옵니다.
		List<empVo> vacation = empService.Vacation(Emp);
		if (vacation != null && !vacation.isEmpty()) {
		    System.out.println("Vacation List Size: " + vacation.size());
		    for (empVo emp : vacation) {
		        System.out.println("Start Date: " + emp.getStart_date() + ", End Date: " + emp.getEnd_date());
		    }
		} else {
		    System.out.println("Vacation List is null or empty");
		}

		//직원 일정 정보
		List<empVo> shedule= empService.Shedule(Emp);
		if (shedule != null && !shedule.isEmpty()) {
            System.out.println("Shedule List Size: " + shedule.size());
            for (empVo emp : shedule) {
                System.out.println("Event Title: " + emp.getTitle() + ", Start Date: " + emp.getStart_date() + ", End Date: " + emp.getEnd_date());
            }
        } else {
            System.out.println("Shedule List is null or empty");
        }
		
		// request에 데이터를 추가합니다.
		req.setAttribute("vacation", vacation);
		req.setAttribute("shedule", shedule);

		// 결과 페이지로 포워딩
        req.getRequestDispatcher("/WEB-INF/employeePage.jsp").forward(req, resp);
    }

//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        doGet(req, resp); // POST 요청도 GET 요청과 동일하게 처리합니다.
//    }
}

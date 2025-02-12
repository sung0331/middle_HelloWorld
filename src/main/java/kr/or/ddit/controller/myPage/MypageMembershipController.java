package kr.or.ddit.controller.myPage;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.myPage.IMyPageService;
import kr.or.ddit.service.myPage.MyPageServiceImpl;
import kr.or.ddit.vo.CustomerVo;
import kr.or.ddit.vo.GradeVo;

@WebServlet("/mypageMembership.do")
public class MypageMembershipController extends HttpServlet {
    
    IMyPageService myPageService = MyPageServiceImpl.getInstance();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	System.out.println("마이이페이지 - 나의 등급");
    	HttpSession session = req.getSession();
    	
        Integer userNo = (Integer) session.getAttribute("userNo"); // 세션에서 사용자 ID 가져오기
        session.setAttribute("myPageCode", "mypageMembership");

        // userNo가 null인 경우 처리
        if (userNo == null) {
            System.out.println("아이디가 없습니다.");
            resp.sendRedirect(req.getContextPath() + "/login.do"); // 로그인 페이지로 리다이렉트
            return;
        }
        
        CustomerVo userMembership = myPageService.getMembership(userNo);
        
        
        GradeVo userGrade = myPageService.getGradeByCustomer(userNo);
        if (userGrade == null) {
            // 등급 정보가 없는 경우, 예외 처리
            req.setAttribute("userName", userMembership.getCust_name());
            req.setAttribute("gradeName", "등급 정보 없음");
        } else {
            req.setAttribute("userName", userMembership.getCust_name());
            req.setAttribute("gradeName", userGrade.getGrade_name());
        }

        req.getRequestDispatcher("/WEB-INF/MyPage.jsp").forward(req, resp);
    }
    
}

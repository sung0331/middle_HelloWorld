package kr.or.ddit.controller.myPage;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.myPage.IMyPageService;
import kr.or.ddit.service.myPage.MyPageServiceImpl;
import kr.or.ddit.vo.PointVo;

@WebServlet("/mypagePoints.do")
public class MypagePointsController extends HttpServlet{
	
	IMyPageService myPageService = MyPageServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("마이페이지 - 포인트");
		HttpSession session = req.getSession();
        Integer userNo = (Integer) session.getAttribute("userNo");
        session.setAttribute("myPageCode", "mypagePoints");
        
        // userNo가 null인지 확인
        if (userNo == null) {
            // 로그인하지 않은 경우, 로그인 페이지로 리다이렉트
            resp.sendRedirect(req.getContextPath() + "/login.do"); // 로그인 페이지 경로 설정
            return;
        }
        
     // 포인트 목록 가져오기
        List<PointVo> pointList = myPageService.getPointList(userNo);
        req.setAttribute("pointList", pointList); // 포인트 목록을 JSP에 전달
        
        PointVo userPoint = myPageService.getuserPoint(userNo);
        req.setAttribute("userPoint", userPoint);

        req.getRequestDispatcher("/WEB-INF/MyPage.jsp").forward(req, resp);
    }
		
}

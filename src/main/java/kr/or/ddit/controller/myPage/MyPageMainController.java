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

@WebServlet("/mypageMain.do")
public class MyPageMainController extends HttpServlet {
	
	IMyPageService mypageService = MyPageServiceImpl.getInstance();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String myPageCode = req.getParameter("myPageCode");
        
        Integer userNo = (Integer) session.getAttribute("userNo"); // 세션에서 userNo 가져오기
        if (userNo == null) {
            resp.sendRedirect(req.getContextPath() + "/login.do"); // 로그인 페이지 경로 설정
            return;
        }

        // 마이페이지 메인에 처음 들어오면 기본 페이지를 설정
        if (myPageCode == null || myPageCode.isEmpty()) {
            myPageCode = "/login.do";  // 기본 페이지 설정
        }
        
        
     // userNo로 사용자 정보 조회
        CustomerVo user = mypageService.getUserInfo(userNo);
        if (user != null) {
            // 사용자 이름을 request에 저장
            req.setAttribute("userName", user.getCust_name());
        }
        // 세션에 myPageCode 저장 (어떤 페이지가 활성화 되었는지)
        session.setAttribute("myPageCode", "mypageMain");

        // 기본적으로 마이페이지 메인으로 이동
        req.getRequestDispatcher("/WEB-INF/MyPage.jsp").forward(req, resp);
    }
    
    
}


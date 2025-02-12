package kr.or.ddit.controller.myPage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.myPage.IMyPageService;
import kr.or.ddit.service.myPage.MyPageServiceImpl;
import kr.or.ddit.vo.CustomerVo;

import java.io.IOException;
import java.util.List;

@WebServlet("/mypageEditProfile.do") // URL 매핑
public class MypageEditProfileController extends HttpServlet {

    private static final long serialVersionUID = -905319146985437202L;

    IMyPageService myPageService = MyPageServiceImpl.getInstance();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	System.out.println("마이페이지 - 회원정보 수정/ 탈퇴");
        HttpSession session = req.getSession();
        session.setAttribute("myPageCode", "mypageEditProfile");

        Integer userNo = (Integer) session.getAttribute("userNo"); // 세션에서 userNo 가져오기
        if (userNo == null) {
            resp.sendRedirect(req.getContextPath() + "/login.do"); // 로그인 페이지 경로 설정
            return;
        }
        
        // 사용자 정보 가져오기
        CustomerVo userInfo = myPageService.getUserInfo(userNo);
        req.setAttribute("user", userInfo);

        // 모든 고객 정보 리스트 가져오기
        List<CustomerVo> customerList = myPageService.getCustomerList();
        req.setAttribute("customerList", customerList);

        // 프로필 수정 페이지로 포워딩
        req.getRequestDispatcher("/WEB-INF/MyPage.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        
        if ("editProfile".equals(action)) {
            editProfile(req, resp);
        } else if ("deleteAccount".equals(action)) {
            deleteAccount(req, resp);
        }
    }
    
    private void editProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Integer userNo = (Integer) session.getAttribute("userNo");

        if (userNo == null) {
            resp.sendRedirect(req.getContextPath() + "/login.do");
            return;
        }

        String name = req.getParameter("name");
        String currentPassword = req.getParameter("currentPassword");
        String newPassword = req.getParameter("newPassword");
        String address1 = req.getParameter("address1");

        String address2 = req.getParameter("address2");
        String email = req.getParameter("email");

        String storedPassword = myPageService.getPassword(userNo);
        
        // 비밀번호가 null인 경우 처리
        if (storedPassword == null) {
            req.setAttribute("updateMessage", "현재 비밀번호를 찾을 수 없습니다. 다시 시도해주세요.");
            req.getRequestDispatcher("/WEB-INF/MyPage.jsp").forward(req, resp);
            return;
        }
        
        // 현재 비밀번호가 일치하지 않을 때
        if (!storedPassword.equals(currentPassword)) {
            req.setAttribute("updateMessage", "현재 비밀번호가 맞지 않습니다. 다시 시도해주세요.");
            req.getRequestDispatcher("/WEB-INF/MyPage.jsp").forward(req, resp);
            return;
        }

        // 사용자 정보 업데이트
        CustomerVo user = new CustomerVo();
        user.setCust_no(userNo);
        user.setCust_name(name);
        user.setCust_address1(address1);

        user.setCust_address2(address2);
        user.setCust_mail(email);
        
        // 비밀번호 변경이 있는 경우 처리
        if (newPassword != null && !newPassword.isEmpty()) {
            user.setCust_pw(newPassword);
        }

        boolean isUpdated = myPageService.updateUserProfile(user);

        if (isUpdated) {
            req.setAttribute("updateMessage", "회원정보가 성공적으로 수정되었습니다.");
        } else {
            req.setAttribute("updateMessage", "회원정보 수정에 실패했습니다. 비밀번호를 확인하세요.");
        }

        
        System.out.println("Name: " + name);
        System.out.println("Current Password: " + currentPassword);
        System.out.println("New Password: " + newPassword);

        // 정보 수정 후 페이지 리로드
        req.getRequestDispatcher("/WEB-INF/MyPage.jsp").forward(req, resp);
    }
    
    private void deleteAccount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Integer userNo = (Integer) session.getAttribute("userNo");
        
        if (userNo == null) {
            resp.sendRedirect(req.getContextPath() + "/login.do");
            return;
        }
        
        boolean isDeleted = myPageService.deleteUser(userNo);
        System.out.println("탈퇴 요청된 회원 번호: " + userNo);
        System.out.println("탈퇴 성공 여부: " + isDeleted);

        if (isDeleted) {
            session.invalidate(); // 세션 무효화
            resp.sendRedirect(req.getContextPath() + "/index.do");
        } else {
            req.setAttribute("updateMessage", "회원 탈퇴에 실패했습니다.");
            req.getRequestDispatcher("/WEB-INF/MyPage.jsp").forward(req, resp);
        }
    }

}

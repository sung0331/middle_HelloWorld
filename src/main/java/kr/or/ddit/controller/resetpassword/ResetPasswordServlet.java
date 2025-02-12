package kr.or.ddit.controller.resetpassword;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.vo.CustomerVo;

@WebServlet("/resetPassword.do")
public class ResetPasswordServlet extends HttpServlet {
    private CustomerDao customerDao;

    @Override
    public void init() throws ServletException {
        super.init();
        customerDao = new CustomerDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/resetpassword.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");

        if (newPassword.length() < 8) {
            req.setAttribute("error", "비밀번호는 최소 8자리 이상이어야 합니다.");
            req.getRequestDispatcher("/WEB-INF/resetpassword.jsp").forward(req, resp);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            req.setAttribute("error", "새 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
            req.getRequestDispatcher("/WEB-INF/resetpassword.jsp").forward(req, resp);
            return;
        }

        CustomerVo customer = customerDao.findCustomer(username, name, email, phone);
        if (customer == null) {
            req.setAttribute("error", "일치하는 사용자 정보를 찾을 수 없습니다.");
            req.getRequestDispatcher("/WEB-INF/resetpassword.jsp").forward(req, resp);
            return;
        }

        boolean resetSuccess = customerDao.updatePassword(customer.getCust_no(), newPassword);

        if (resetSuccess) {
            req.setAttribute("message", "비밀번호가 성공적으로 재설정되었습니다.");
            req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
        } else {
            req.setAttribute("error", "비밀번호 재설정에 실패했습니다. 다시 시도해주세요.");
            req.getRequestDispatcher("/WEB-INF/resetpassword.jsp").forward(req, resp);
        }
    }
}
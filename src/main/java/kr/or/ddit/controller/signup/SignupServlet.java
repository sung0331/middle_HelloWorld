package kr.or.ddit.controller.signup;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.vo.CustomerVo;

@WebServlet("/signup.do")
public class SignupServlet extends HttpServlet {
    private CustomerDao customerDao = new CustomerDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/signup.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String birthdate = req.getParameter("birthdate");
        String phone = req.getParameter("phone");
        String telecom = req.getParameter("telecom");
        String address1 = req.getParameter("address1");
        String address2 = req.getParameter("address2");

        if (customerDao.isUsernameDuplicate(username)) {
            req.setAttribute("error", "이미 사용 중인 아이디입니다.");
            req.getRequestDispatcher("/WEB-INF/signup.jsp").forward(req, resp);
            return;
        }

        CustomerVo customer = new CustomerVo();
        customer.setCust_id(username);
        customer.setCust_name(name);
        customer.setCust_pw(password);
        customer.setCust_mail(email);
        customer.setCust_tel(phone);
        
        switch(telecom) {
            case "SKT": customer.setMobile_no(1); break;
            case "KT": customer.setMobile_no(2); break;
            case "LG": customer.setMobile_no(3); break;
            default: customer.setMobile_no(0);
        }
        
        customer.setCust_address1(address1);
        customer.setCust_address2(address2);

        int birthYear = Integer.parseInt(birthdate.substring(0, 4));
        int currentYear = java.time.LocalDate.now().getYear();
        customer.setCust_age(currentYear - birthYear);

        boolean success = customerDao.insertCustomer(customer);

        if (success) {
            req.getRequestDispatcher("/WEB-INF/signupSuccess.jsp").forward(req, resp);
        } else {
            req.setAttribute("error", "회원가입에 실패했습니다. 다시 시도해 주세요.");
            req.getRequestDispatcher("/WEB-INF/signup.jsp").forward(req, resp);
        }
    }
}
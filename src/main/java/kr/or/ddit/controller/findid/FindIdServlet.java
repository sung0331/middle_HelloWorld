package kr.or.ddit.controller.findid;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/findid.do")
public class FindIdServlet extends HttpServlet {
    private CustomerDao customerDao;

    @Override
    public void init() throws ServletException {
        super.init();
        customerDao = new CustomerDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/findid.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");

        System.out.println("Received parameters: name=" + name + ", email=" + email + ", phone=" + phone);

        if (name == null || email == null || phone == null) {
            System.out.println("One or more parameters are null");
            req.setAttribute("error", "모든 필드를 입력해주세요.");
            req.getRequestDispatcher("/WEB-INF/findid.jsp").forward(req, resp);
            return;
        }

        String foundId = customerDao.findIdByNameEmailAndPhone(name, email, phone);

        if (foundId != null) {
            System.out.println("ID found: " + foundId);
            req.setAttribute("foundId", foundId);
            req.getRequestDispatcher("/WEB-INF/findidresult.jsp").forward(req, resp);
        } else {
            System.out.println("No matching user found");
            req.setAttribute("error", "일치하는 사용자 정보를 찾을 수 없습니다.");
            req.getRequestDispatcher("/WEB-INF/findid.jsp").forward(req, resp);
        }
    }
}
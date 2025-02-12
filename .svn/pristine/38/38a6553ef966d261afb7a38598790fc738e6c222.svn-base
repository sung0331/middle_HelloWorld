package kr.or.ddit.controller.signup;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/checkUsername")
public class CheckUsernameServlet extends HttpServlet {
    private CustomerDao customerDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        customerDAO = new CustomerDao();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        
        boolean isDuplicate = customerDAO.isUsernameDuplicate(username);
        
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.print("{\"available\": " + !isDuplicate + "}");
        out.flush();
    }
}
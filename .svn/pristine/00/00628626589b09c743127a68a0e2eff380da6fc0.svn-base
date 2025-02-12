package kr.or.ddit.controller.info;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/infopage.do")
public class InfoPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("이용안내 페이지");
        System.out.println("test");
        req.getRequestDispatcher("/WEB-INF/infopage.jsp").forward(req, resp);
    }
}
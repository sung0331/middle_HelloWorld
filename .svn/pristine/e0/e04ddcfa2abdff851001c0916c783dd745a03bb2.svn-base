package kr.or.ddit.controller.main;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/index.do")
public class IndexController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("인덱스 페이지");
		System.out.println("test");
		HttpSession session = req.getSession();
		System.out.println(session);
		session.setAttribute("main", "mainPage");

		req.getRequestDispatcher("/WEB-INF/index.jsp").forward(req, resp);
	}
}
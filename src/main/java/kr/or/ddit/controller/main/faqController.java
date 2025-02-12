package kr.or.ddit.controller.main;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/faq.do")
public class faqController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("인덱스 페이지");
		System.out.println("test");
		HttpSession session = req.getSession();
		session.setAttribute("main", "faq");
		System.out.println(session);

		req.getRequestDispatcher("/WEB-INF/index.jsp").forward(req, resp);
	}
}
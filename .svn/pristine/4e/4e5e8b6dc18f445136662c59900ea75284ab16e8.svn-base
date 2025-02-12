package kr.or.ddit.controller.manager;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.vo.CustomerVo;

@WebServlet("/mangerMypage.do")

public class ManagerController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("관리자 마이 페이지");
		HttpSession session = req.getSession();
		System.out.println(session);
		session.setAttribute("mangerPageCode", "mangerMypage");
		System.out.println(session.getAttribute("mangerPageCode"));
		CustomerVo customerVo = (CustomerVo) session.getAttribute("user");
		System.out.println(customerVo);
		req.getRequestDispatcher("/WEB-INF/mangerMyPage.jsp").forward(req, resp);
	}
}

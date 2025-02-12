package kr.or.ddit.controller.main;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.board.EventServiceImpl;
import kr.or.ddit.service.board.IEventService;
import kr.or.ddit.vo.RideVo;

@WebServlet("/mainRide.do")
public class rideController extends HttpServlet {
	
	IEventService eventService = EventServiceImpl.getInstacne();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("헬로월드! 페이지 입니다");
		
		HttpSession session = req.getSession();
		session.setAttribute("main", "mainRide");

		List<RideVo> rideList = eventService.rideList();
		System.out.println(rideList);
		
		req.setAttribute("rideList", rideList);
		req.getRequestDispatcher("/WEB-INF/index.jsp").forward(req, resp);
	
	//사진+제목 글쓴이(x) 내용/6 
	}

}

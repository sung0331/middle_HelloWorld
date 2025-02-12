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

@WebServlet("/detailRide.do")
public class rideDetailController extends HttpServlet {
	
	IEventService eventService = EventServiceImpl.getInstacne();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("놀이기구 디테일 페이지");
		
		HttpSession session = req.getSession();
		session.setAttribute("main", "mainRideDetail");

		 // URL에서 파라미터로 전달된 rideName을 받음
        String rideName = req.getParameter("rideName");

        // 놀이기구 목록에서 선택된 놀이기구를 찾음
        List<RideVo> rideList = eventService.rideList(); // rideList에서 데이터를 조회
        RideVo selectedRide = null;

        for (RideVo ride : rideList) {
            if (ride.getRide_name().equals(rideName)) {
                selectedRide = ride;
                break;
            }
        }

        // 선택한 놀이기구를 JSP에 전달
        req.setAttribute("selectedRide", selectedRide);

        // 상세보기 페이지로 포워딩
		req.getRequestDispatcher("/WEB-INF/index.jsp").forward(req, resp);
	
	//사진+제목 글쓴이(x) 내용/6 
	}

}

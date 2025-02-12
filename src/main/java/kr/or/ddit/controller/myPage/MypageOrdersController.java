package kr.or.ddit.controller.myPage;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.myPage.IMyPageService;
import kr.or.ddit.service.myPage.MyPageServiceImpl;
import kr.or.ddit.vo.BuyCartVo;

@WebServlet("/mypageOrders.do")
public class MypageOrdersController extends HttpServlet{
	
	IMyPageService mypageService = MyPageServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    HttpSession session = req.getSession();
	    
	    session.setAttribute("myPageCode", "mypageOrders");
	    Integer userNo = (Integer) session.getAttribute("userNo");

	    if (userNo == null) {
	        resp.sendRedirect(req.getContextPath() + "/login.do");
	        return;
	    }

	    // 주문 내역 가져오기
	    List<BuyCartVo> orderList = mypageService.getOrderList(userNo);

	    if (orderList == null || orderList.isEmpty()) {
	        System.out.println("주문 내역이 없습니다.");
	    } else {
	        System.out.println("주문 내역 수: " + orderList.size());
	    }

	    // 주문 내역을 request에 설정
	    req.setAttribute("orderList", orderList);

	    // JSP로 포워딩
	    req.getRequestDispatcher("/WEB-INF/MyPage.jsp").forward(req, resp);
	}

}

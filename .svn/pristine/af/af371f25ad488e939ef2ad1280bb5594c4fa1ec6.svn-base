package kr.or.ddit.controller.myPage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.manager.IManagerProdService;
import kr.or.ddit.service.manager.ManagerProdServiceImpl;
import kr.or.ddit.service.myPage.IMyPageService;
import kr.or.ddit.service.myPage.MyPageServiceImpl;
import kr.or.ddit.vo.BuyVo;
import kr.or.ddit.vo.CartVo;
import kr.or.ddit.vo.CustomerVo;

@WebServlet("/mypageCart.do")
public class MypageCartController extends HttpServlet {
	IMyPageService mypageService = MyPageServiceImpl.getInstance();
	IManagerProdService prodservice = ManagerProdServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		CustomerVo customerVo = (CustomerVo) session.getAttribute("user");
		Integer userNo = (Integer) session.getAttribute("userNo");
		if (userNo == null) {
			resp.sendRedirect(req.getContextPath() + "/login.do");
			return;
		} else {
			System.out.println("세션에서 가져온 userNo: " + userNo);
		}

		// 장바구니 목록 가져오기
		List<CartVo> cartList = mypageService.getCartItems(userNo);

		if (cartList == null || cartList.isEmpty()) {
			System.out.println("장바구니에 담긴 항목이 없습니다.");
		} else {
			for (CartVo item : cartList) {
//                System.out.println("상품명: " + item.getProd_name() + ", 가격: " + item.getPrice());
			}
		}
        int cart_no=0;
        if (!cartList.isEmpty()) {
             cart_no = cartList.get(0).getCart_no();
        }
        
        req.setAttribute("cart_no", cart_no);
		req.setAttribute("cartItems", cartList);
		session.setAttribute("myPageCode", "mypageCarts");

		System.out.println("cartItems: " + cartList); // 데이터가 제대로 들어오는지 확인

		req.getRequestDispatcher("/WEB-INF/MyPage.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");

		if ("update".equals(action)) {
			// 수량 업데이트
			updateCartItem(req, resp);
		} else if ("delete".equals(action)) {
			// 장바구니 항목 삭제
			deleteCartItem(req, resp);
		}
	}

	// 수량 업데이트 메서드
	private void updateCartItem(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int cartNo = Integer.parseInt(req.getParameter("cartNo"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));

		CartVo cartItem = new CartVo();
		cartItem.setCart_no(cartNo);
		cartItem.setAmount(quantity);

		boolean isUpdated = mypageService.updateCartItemQuantity(cartItem);

		resp.setContentType("application/json");
		PrintWriter out = resp.getWriter();
		out.write("{\"success\": " + isUpdated + "}");
		out.flush();
	}

	// 장바구니 항목 삭제 메서드
	private void deleteCartItem(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int cartNo = Integer.parseInt(req.getParameter("cartNo"));

		CartVo cartItem = new CartVo();
		cartItem.setCart_no(cartNo);

		boolean isDeleted = mypageService.deleteCartItem(cartItem);

		resp.setContentType("application/json");
		PrintWriter out = resp.getWriter();
		out.write("{\"success\": " + isDeleted + "}");
		out.flush();
	}
}

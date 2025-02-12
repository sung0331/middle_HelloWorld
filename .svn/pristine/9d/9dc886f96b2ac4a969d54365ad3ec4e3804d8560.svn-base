package kr.or.ddit.controller.pay;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.manager.IManagerCustomerService;
import kr.or.ddit.service.manager.IManagerProdService;
import kr.or.ddit.service.manager.ManagerCustomerServiceImpl;
import kr.or.ddit.service.manager.ManagerProdServiceImpl;
import kr.or.ddit.service.product.ProductServiceImpl;
import kr.or.ddit.vo.BuyCartVo;
import kr.or.ddit.vo.BuyVo;
import kr.or.ddit.vo.CustomerVo;

@WebServlet("/pay.do")
public class PayController extends HttpServlet {
	IManagerProdService prodservice = ManagerProdServiceImpl.getInstance();
	IManagerCustomerService customerService = ManagerCustomerServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("결제 페이지");
		HttpSession session = req.getSession();
		session.setAttribute("main", "pay");
		System.out.println(session.getAttribute("main"));	
		int cust_no =(Integer) session.getAttribute("userNo");
		CustomerVo customer = customerService.customerDetail(cust_no);
		int buy_no= Integer.parseInt(req.getParameter("buy_no"));
		System.out.println(buy_no);
		List<BuyCartVo> cart = prodservice.prodDetail(buy_no);
		req.setAttribute("cart", cart);
		req.setAttribute("buy_no", buy_no);
		req.setAttribute("customer", customer);
		int totalPrice= prodservice.totalPrice(buy_no);
		System.out.println("tp"+totalPrice);
		req.setAttribute("totalPrice", totalPrice);
		
		BuyVo buy=prodservice.chkBuycartNo(cust_no);
		System.out.println(buy);
		req.setAttribute("address", buy.getBuy_address());

		req.getRequestDispatcher("/WEB-INF/index.jsp").forward(req, resp);
	}
	
	
	
}
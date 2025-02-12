package kr.or.ddit.controller.pay;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import kr.or.ddit.service.product.IProductService;
import kr.or.ddit.service.product.ProductServiceImpl;
import kr.or.ddit.vo.BuyVo;
import kr.or.ddit.vo.PayVo;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.product.IProductService;
import kr.or.ddit.service.product.ProductServiceImpl;

@WebServlet("/payEnd.do")
public class PayEndController extends HttpServlet {
	IProductService productService = ProductServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("결제완료 페이지");
		HttpSession session = req.getSession();
		session.setAttribute("main", "payEnd");
		System.out.println(session.getAttribute("main"));
		int buy_no=Integer.parseInt( req.getParameter("buy_no"));
		int totalPrice=Integer.parseInt( req.getParameter("totalPrice"));
		String address= req.getParameter("address");
		BuyVo buy=new BuyVo();
		buy.setBuy_no(buy_no);
		buy.setTotal_price(totalPrice);
		productService.updateTotalPrice(buy);
		
		PayVo pay=new PayVo();
		pay.setBuy_no(buy_no);
		pay.setPay_price(totalPrice);
		productService.putPayInfo(pay);
		
		req.setAttribute("pay", pay);
		req.getRequestDispatcher("/WEB-INF/index.jsp").forward(req, resp);
	}
	
	
	
}

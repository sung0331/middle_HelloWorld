package kr.or.ddit.controller.product;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.product.IProductService;
import kr.or.ddit.service.product.ProductServiceImpl;
import kr.or.ddit.vo.BuyCartVo;
import kr.or.ddit.vo.BuyVo;
import kr.or.ddit.vo.CustomerVo;
import kr.or.ddit.vo.ProductVo;

@WebServlet("/gotoCart.do")
public class ProductCartInputController extends HttpServlet {
	IProductService productService = ProductServiceImpl.getInstance();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    System.out.println("상점 페이지");
	    HttpSession session = req.getSession();
	    CustomerVo customer = (CustomerVo) session.getAttribute("user");
	    System.out.println(customer);

	    if (customer == null) {
	        resp.sendError(HttpServletResponse.SC_UNAUTHORIZED, "로그인 필요");
	        return;
	    }

	    session.setAttribute("main", "productMain");
	    System.out.println(session.getAttribute("main"));

	    int prod_no = Integer.parseInt(req.getParameter("prod_no"));
	    int amount = Integer.parseInt(req.getParameter("amount"));
	    int cate = Integer.parseInt(req.getParameter("cate"));
	    String address=customer.getCust_address1()+" "+customer.getCust_address2();
	    int cust_no = customer.getCust_no();

	    System.out.println("prod_no: " + prod_no);
	    System.out.println("amount: " + amount);

	    BuyVo buy = productService.selectBuycart(cust_no);
	    System.out.println("buy: " + buy);

	    if (buy == null) {
	        System.out.println("구매 정보가 없습니다.");
	        buy = new BuyVo(); // 적절한 초기화
	        buy.setCust_no(cust_no);
	        buy.setBuy_address(address);
	        productService.giveBuycart(buy);
	        buy = productService.selectBuycart(cust_no);
	        if (buy != null) {
	            session.setAttribute("buy_no", buy.getBuy_no());
	        } else {
	            // buy가 여전히 null인 경우
	            System.out.println("구매 정보 생성 실패");
	            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "구매 정보 생성 실패");
	            return;
	        }
	    } else {
	        System.out.println("구매 정보가 존재합니다.");
	    }

	    BuyCartVo buyCart = new BuyCartVo();
	    buyCart.setProd_no(prod_no);
	    buyCart.setAmount(amount);
	    buyCart.setBuy_no(buy.getBuy_no());

	    productService.putCart(buyCart);
	    System.out.println(buyCart);
		resp.sendRedirect(req.getContextPath() + "/productMain.do");

	}

}

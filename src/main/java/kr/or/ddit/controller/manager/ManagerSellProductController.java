package kr.or.ddit.controller.manager;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.manager.IManagerProdSaleService;
import kr.or.ddit.service.manager.ManagerProdSaleServiceimpl;
import kr.or.ddit.vo.BuyCartVo;
import kr.or.ddit.vo.ProdSalesVo;

@WebServlet("/mangerSellProductInfo.do")

public class ManagerSellProductController extends HttpServlet {
	IManagerProdSaleService prodSaleService = ManagerProdSaleServiceimpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    System.out.println("관리자 굿즈 판매 통계 페이지");
	    HttpSession session = req.getSession();
	    session.setAttribute("mangerPageCode", "mangerSellProductInfo");

	    String currentYearStr = req.getParameter("year");
	    String currentMonthStr = req.getParameter("month");
	    
	    System.out.println("Received year: " + currentYearStr);
	    System.out.println("Received month: " + currentMonthStr);
	    
	    Integer currentYear = null;
	    Integer currentMonth = null;
	    
	    if (currentYearStr != null && !currentYearStr.isEmpty()) {
	        currentYear = Integer.valueOf(currentYearStr);
	    }
	    if (currentMonthStr != null && !currentMonthStr.isEmpty()) {
	        currentMonth = Integer.valueOf(currentMonthStr);
	    }

	    if (currentYear == null && currentMonth == null) {
	        LocalDate currentDate = LocalDate.now();
	        currentYear = currentDate.getYear();
	        currentMonth = currentDate.getMonthValue();
	    }

	    HashMap<String, Integer> map = new HashMap<>();
	    map.put("year", currentYear);
	    map.put("month", currentMonth);
	    
	    List<BuyCartVo> prodSale = prodSaleService.selectGoods(map);
	    req.setAttribute("prodSale", prodSale);
	    req.setAttribute("yearAndMonth", map);
	    
	    req.getRequestDispatcher("/WEB-INF/mangerMyPage.jsp").forward(req, resp);
	}

}

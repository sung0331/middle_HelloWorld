package kr.or.ddit.controller.product;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.product.IProductService;
import kr.or.ddit.service.product.ProductServiceImpl;
import kr.or.ddit.vo.ProductVo;

@WebServlet("/productDetail.do")
public class ProductDetailController extends HttpServlet {

	IProductService productService = ProductServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 요청에서 상품 번호(prod_no) 파라미터를 가져오기
		String prodNoParam = req.getParameter("prod_no");
		System.out.println(prodNoParam);
		HttpSession session = req.getSession();
		session.setAttribute("main", "productDetail");
		
		
		if (prodNoParam != null && !prodNoParam.isEmpty()) {
			int prodNo = Integer.parseInt(prodNoParam);

			// 상품 상세 정보 조회
			ProductVo productDetail = productService.getProductDetail(prodNo);
System.out.println(productDetail);
			if (productDetail != null) {
				// 조회된 상품 정보를 request 객체에 담아 JSP로 전달
				req.setAttribute("productDetail", productDetail);

				// productDetail.jsp로 포워딩
				RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/index.jsp");
				dispatcher.forward(req, resp);
			}
		}
	}
}
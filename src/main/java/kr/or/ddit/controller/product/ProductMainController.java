package kr.or.ddit.controller.product;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.product.IProductService;
import kr.or.ddit.service.product.ProductServiceImpl;
import kr.or.ddit.vo.ProductVo;

/**
 * ProductMainController는 "/productMain.do" 요청을 처리하는 서블릿입니다. 사용자가 상품 메인 페이지에
 * 접근하면, 상품 목록을 조회하여 JSP에 전달하는 역할을 합니다.
 */

@WebServlet("/productMain.do")
public class ProductMainController extends HttpServlet {

	/**
	 * GET 요청을 처리하는 메소드입니다. 상품 목록을 조회하고, 해당 목록을 JSP로 전달하여 화면에 출력합니다.
	 *
	 * @param req  HttpServletRequest 객체로, 클라이언트의 요청 정보를 담고 있습니다.
	 * @param resp HttpServletResponse 객체로, 클라이언트에게 응답을 보내는 역할을 합니다.
	 */
	@Override // 상품정보 가져오는 메소드
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 테스트용 출력 (상품 메인 페이지 접근 여부 확인)
		System.out.println("상품메인 페이지");

		HttpSession session = req.getSession();
		System.out.println(session);
		session.setAttribute("main", "productMain");

		// 게시물 목록 정보 및 페이징 처리 정보 생성하기
		int currentPage = 1;
		String page = req.getParameter("page");
		currentPage = page == null ? 1 : Integer.parseInt(page);

		// 서비스 객체 얻기(상품 관련 비즈니스 로직 처리를 위한 서비스 객체)
		IProductService service = ProductServiceImpl.getInstance();
		System.out.println();
		// 전체 글 갯수 조회하기
		int totalCount = service.countList();
		System.out.println(totalCount);
		// 화면에 표시될 페이지의 수
		int perPage = 2;
		// 한 페이지당 출력할 글 갯수
		int perList = 9;
		// 전체 페이지 수 = 전체 글 갯수(totalCount) / 페이지 당 글 갯수(perList)
		int totalPage = (int) Math.ceil((double) totalCount / (double) perList);

		// 페이지 별 게시글 범위(start ~ end) 구하기
		int start = (currentPage - 1) * perList + 1;
		int end = start + perList - 1;
		if (end > totalCount)
			end = totalCount;
		// 페이지 범위(startPage ~ endPage) 구하기
		// startPage = ((currentPage - 1) / perPage * perPage) + 1;
//		for(int i=1; i<=10; i++) {
//			System.out.println( "현재페이지 " + i + "일 때 >> " + (((i - 1) / perPage * perPage) + 1)  );
//		}
		int startPage = ((currentPage - 1) / perPage * perPage) + 1;
		// endPage = startPage + perPage - 1;
		int endPage = startPage + perPage - 1;
		if (endPage > totalPage)
			endPage = totalPage;// 계산된 페이지가 실제 총 페이지 수보다 클때 값 수정
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		// 범위 별 게시물 조회
		List<ProductVo> list = service.selectList(map);
		System.out.println(list);
		req.setAttribute("list", list);
		req.setAttribute("cPage", currentPage);
		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("tPage", totalPage);
		req.getRequestDispatcher("/WEB-INF/index.jsp").forward(req, resp);
	}

	/*
	 * /** POST 요청을 처리하는 메소드입니다. (현재 주석 처리되어 있음. 필요한 경우 상품 수정이나 기타 POST 관련 로직을 추가할 수
	 * 있습니다.)
	 *
	 * @Override protected void doPost(HttpServletRequest req, HttpServletResponse
	 * resp) throws ServletException, IOException { // 상품 수정이나 다른 POST 처리 로직 작성 가능 }
	 */

}

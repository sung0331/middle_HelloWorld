package kr.or.ddit.controller.manager;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.dao.manager.IManagerCustomerDao;
import kr.or.ddit.dao.manager.ManagerVacationDaoImpl;
import kr.or.ddit.service.manager.IManagerBoardService;
import kr.or.ddit.service.manager.IManagerCustomerService;
import kr.or.ddit.service.manager.IManagerEmpService;
import kr.or.ddit.service.manager.IManagerVacationService;
import kr.or.ddit.service.manager.ManagerBoardServiceImpl;
import kr.or.ddit.service.manager.ManagerCustomerServiceImpl;
import kr.or.ddit.service.manager.ManagerEmpServiceImpl;
import kr.or.ddit.service.manager.ManagerVacationServiceImpl;
import kr.or.ddit.vo.BoardVo;
import kr.or.ddit.vo.CustomerVo;
import kr.or.ddit.vo.empVo;

@WebServlet("/ManagerVacationInfo.do")

public class ManagerVacationInfoController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("관리자 휴가 관리 페이지");
		HttpSession session = req.getSession();
		System.out.println(session);
		session.setAttribute("mangerPageCode", "mangerVacationInfo");
		System.out.println(session.getAttribute("mangerPageCode"));

		int currentPage = 1;

		String page = req.getParameter("page");
		
		currentPage = page == null ? 1 : Integer.parseInt(page);
		// 서비스 객체 얻기
		IManagerVacationService service= ManagerVacationServiceImpl.getInstance();
		// 전체 글 갯수 조회하기
		int totalCount = service.countVac();
		System.out.println(totalCount);
		// 화면에 표시될 페이지의 수
		int perPage = 2;

		// 한 페이지당 출력할 글 갯수
		int perList = 5;

		// 전체 페이지 수 = 전체 글 갯수(totalCount) / 페이지 당 글 갯수(perList)
		int totalPage = (int) Math.ceil((double) totalCount / (double) perList);
System.out.println();
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

		System.out.println(start);
		System.out.println(end);
		
		// 범위 별 게시물 조회
		List<empVo> list = service.selectVac(map);
		System.out.println(list);
		req.setAttribute("list", list);
		req.setAttribute("cPage", currentPage);
		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("tPage", totalPage);
		req.getRequestDispatcher("/WEB-INF/mangerMyPage.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}

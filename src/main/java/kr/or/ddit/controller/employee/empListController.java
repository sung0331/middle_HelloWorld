package kr.or.ddit.controller.employee;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.dao.employee.IEmpDao;
import kr.or.ddit.service.employee.EmpServicelmpl;
import kr.or.ddit.vo.CustomerVo;
import kr.or.ddit.vo.MakeVo;

@WebServlet("/empList")
public class empListController extends HttpServlet {

    EmpServicelmpl IEmpService = EmpServicelmpl.getInstacne();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("예약리스트");
        
        HttpSession session = req.getSession();
        session.setAttribute("employeePageCode", "empList");
        
        
        
    	// 검색어 처리
        String query = req.getParameter("query");
        List<MakeVo> empList = null;
        if (empList == null) {
            empList = new ArrayList<>();  // 비어있는 리스트로 초기화
        }
        
        //Query value: null
        System.out.println("Query value: " + query);
        req.setAttribute("query", query);

        // 페이지 관련 파라미터 처리
        int currentPage = 1;
        String page = req.getParameter("page");
        currentPage = (page == null) ? 1 : Integer.parseInt(page);
        int totalCount = IEmpService.countList();
		System.out.println("totalCount : " + totalCount);//7
        int perPage = 2;  // 화면에 표시될 페이지 수
        int perList = 5;  // 한 페이지당 출력할 글 갯수

        // 검색어가 있을 경우
        if (query != null && !query.trim().isEmpty()) {
            empList = IEmpService.searchCustomer(query);
            req.setAttribute("query", query); // 검색어 전달
        } else {
            // 전체 페이지 수 계산
            int totalPage = (int) Math.ceil((double) totalCount / (double) perList);

            // 페이지 별 게시글(start ~ end) 구하기
            int start = (currentPage - 1) * perList + 1;
            int end = start + perList - 1;
            if (end > totalCount) {
                end = totalCount;
            }

            // 페이지 범위(startPage ~ endPage) 구하기
            int startPage = ((currentPage - 1) / perPage * perPage) + 1;
            int endPage = startPage + perPage - 1;
            if (endPage > totalPage) {
                endPage = totalPage; // 계산된 페이지가 실제 총 페이지 수보다 클 때 값 수정
            }

            
            // 범위 별 게시물 조회
            HashMap<String, Object> map = new HashMap<String, Object>();
            map.put("start", start);
            map.put("end", end);
            empList = IEmpService.selectList(map);
            /*
            [
            MakeVo(make_no=5, cust_no=0, rsvt_date=2024-10-10 00:00:00, amount=2, prod_name=자이로드롭, make_state=1, cust_name=한가인), 
            MakeVo(make_no=7, cust_no=0, rsvt_date=2024-10-10 00:00:00, amount=2, prod_name=자이로드롭, make_state=1, cust_name=백유리), 
            MakeVo(make_no=6, cust_no=0, rsvt_date=2024-10-10 00:00:00, amount=2, prod_name=자이로드롭, make_state=2, cust_name=한훈이), 
            MakeVo(make_no=4, cust_no=0, rsvt_date=2024-10-09 00:00:00, amount=2, prod_name=자이로드롭, make_state=2, cust_name=한훈이), 
            MakeVo(make_no=3, cust_no=0, rsvt_date=2024-10-01 00:00:00, amount=2, prod_name=자이로드롭, make_state=2, cust_name=한가인
            ]
             */
            System.out.println("empList : " + empList);
            
            
            // 페이지 정보 설정
            List<MakeVo> selectList = IEmpService.searchCustomer(query);
    		System.out.println("selectList : " + selectList);//*****
    		req.setAttribute("selectList", selectList);
            req.setAttribute("cPage", currentPage);
            req.setAttribute("sPage", startPage);
            req.setAttribute("ePage", endPage);
            req.setAttribute("tPage", totalPage);
        }
        
        System.out.println("검색된 고객 리스트: " + empList);

        // 검색 결과 혹은 전체 목록 설정
        req.setAttribute("empList", empList);

        // 결과 페이지로 포워딩
        req.getRequestDispatcher("/WEB-INF/employeePage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	System.out.println("업데이트 처리 중");
    	
    	 // 클라이언트로부터 make_no 값 가져오기
        String makeNoParam = req.getParameter("make_no");

        int makeNo = Integer.parseInt(makeNoParam);

        // make_state를 고정값으로 설정
        int makeState = 2;

        // MakeVo 객체 생성 및 값 설정
        MakeVo makeVo = new MakeVo();
        makeVo.setMake_no(makeNo);
        makeVo.setMake_state(makeState);

        // 서비스 호출 후 업데이트 처리
        int isUpdated = IEmpService.makeUpdate(makeVo);

        if (isUpdated>0) {
            System.out.println("업데이트 성공");
            // 업데이트 성공 시 다시 목록 페이지로 리다이렉트
            resp.sendRedirect(req.getContextPath() + "/empList");
        } else {
            System.out.println("업데이트 실패");
            // 업데이트 실패 시 에러 페이지로 포워딩하거나, 에러 메시지를 설정하여 재시도하게 합니다.
            req.setAttribute("message", "업데이트 실패");
            req.getRequestDispatcher("/WEB-INF/employeePage.jsp").forward(req, resp);
        }
    }
}

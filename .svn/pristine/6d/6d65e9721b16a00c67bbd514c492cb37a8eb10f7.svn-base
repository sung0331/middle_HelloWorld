package kr.or.ddit.controller.myPage;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.myPage.IMyPageBoardService;
import kr.or.ddit.service.myPage.MyPageBoardServiceImpl;
import kr.or.ddit.vo.BoardVo;

@WebServlet("/mypagePosts.do")
public class MypagePostsController extends HttpServlet {
    
    IMyPageBoardService myPageBoardService = MyPageBoardServiceImpl.getInstance(); 
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("내가 쓴 게시물 페이지");
        HttpSession session = req.getSession();
        Integer userNo = (Integer) session.getAttribute("userNo"); // 세션에서 사용자 ID 가져오기
        session.setAttribute("myPageCode", "mypagePosts");

        // userNo가 null인 경우 처리
        if (userNo == null) {
            System.out.println("아이디가 없습니다.");
            resp.sendRedirect(req.getContextPath() + "/login.do"); // 로그인 페이지로 리다이렉트
            return;
        }

        // 현재 페이지 번호 가져오기
        int currentPage = 1;
        String page = req.getParameter("page");
        if (page != null) {
            currentPage = Integer.parseInt(page);
        }

        // 한 페이지에 표시할 게시글 수 설정
        int perList = 5;

        // 전체 게시글 개수 가져오기
        int totalCount = myPageBoardService.countMyPosts(userNo);
        int totalPage = (int) Math.ceil((double) totalCount / perList);

        // 페이지 범위 구하기
        int perPage = 5; // 페이지 네비게이션에 표시할 페이지 수
        int startPage = ((currentPage - 1) / perPage) * perPage + 1;
        int endPage = startPage + perPage - 1;
        if (endPage > totalPage) {
            endPage = totalPage;
        }

        // 페이지 별 게시글 범위(start ~ end) 구하기
        int start = (currentPage - 1) * perList + 1;
        int end = start + perList - 1;

        HashMap<String, Object> map = new HashMap<>();
        map.put("userNo", userNo);
        map.put("start", start);
        map.put("end", end);

        
        // 사용자 게시물 가져오기
        List<BoardVo> list = myPageBoardService.selectPostsPaging(map);
//        System.out.println("가져온 게시물 수: " + list.size());

        
        // JSP로 필요한 데이터를 전달
        req.setAttribute("list", list);
        req.setAttribute("cPage", currentPage);
        req.setAttribute("sPage", startPage);
        req.setAttribute("ePage", endPage);
        req.setAttribute("tPage", totalPage);

        req.getRequestDispatcher("/WEB-INF/MyPage.jsp").forward(req, resp); // 올바른 JSP 파일로 포워딩
    }
}


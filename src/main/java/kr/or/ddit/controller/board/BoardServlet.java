package kr.or.ddit.controller.board;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import kr.or.ddit.vo.boardCodeVo;
import kr.or.ddit.vo.BoardVo;

@WebServlet("/board.do")
public class BoardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("게시판 페이지");
        
        BoardDao dao = new BoardDao();
        List<boardCodeVo> boardNames = dao.getBoardNames();
        Map<Integer, List<BoardVo>> boardsWithPosts = dao.getBoardsWithPosts();
        
        req.setAttribute("boardNames", boardNames);
        req.setAttribute("boardsWithPosts", boardsWithPosts);
        req.getRequestDispatcher("/WEB-INF/board.jsp").forward(req, resp);
    }
}
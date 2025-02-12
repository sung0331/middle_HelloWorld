package kr.or.ddit.controller.board;

import kr.or.ddit.vo.boardCodeVo;
import kr.or.ddit.vo.BoardVo;
import kr.or.ddit.vo.CustomerVo;
import java.sql.*;
import java.util.*;

public class BoardDao {
    private static final String PROPERTIES_FILE = "/db.properties";
    
    static {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Oracle JDBC Driver not found", e);
        }
    }
    
    private Connection getConnection() throws SQLException {
        Properties props = new Properties();
        try (java.io.InputStream is = getClass().getResourceAsStream(PROPERTIES_FILE)) {
            if (is == null) {
                throw new RuntimeException("Cannot find " + PROPERTIES_FILE);
            }
            props.load(is);
        } catch (Exception e) {
            throw new SQLException("Failed to load database properties", e);
        }
        
        String url = props.getProperty("url");
        String user = props.getProperty("user");
        String password = props.getProperty("password");
        
        return DriverManager.getConnection(url, user, password);
    }
    
    public List<boardCodeVo> getBoardNames() {
        List<boardCodeVo> boardCodes = new ArrayList<boardCodeVo>();
        String sql = "SELECT BOARD_NO, BOARD_NAME FROM BOARD_CODE WHERE BOARD_NO IN (1, 2, 4) ORDER BY BOARD_NO";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            while (rs.next()) {
                boardCodeVo boardCode = new boardCodeVo();
                boardCode.setBoard_no(rs.getInt("BOARD_NO"));
                boardCode.setBoard_name(rs.getString("BOARD_NAME"));
                boardCodes.add(boardCode);
                System.out.println("Board Code: " + boardCode.getBoard_no() + ", Name: " + boardCode.getBoard_name());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return boardCodes;
    }
    
    public Map<Integer, List<BoardVo>> getBoardsWithPosts() {
        Map<Integer, List<BoardVo>> boardsWithPosts = new HashMap<Integer, List<BoardVo>>();
        String sql = "SELECT b.BOARD_NO, p.POST_NO, p.TITLE, p.CONTENT, p.BOARD_DATE, p.BOARD_STATE, p.CUST_NO, c.cust_name AS WRITER " +
                     "FROM BOARD_CODE b LEFT JOIN BOARD p ON b.BOARD_NO = p.BOARD_NO " +
                     "LEFT JOIN CUSTOMER c ON p.CUST_NO = c.cust_no " +
                     "WHERE b.BOARD_NO IN (1, 2, 4) " +
                     "ORDER BY b.BOARD_NO, p.POST_NO DESC";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            while (rs.next()) {
                int boardNo = rs.getInt("BOARD_NO");
                BoardVo post = new BoardVo();
                post.setPost_no(rs.getInt("POST_NO"));
                post.setTitle(rs.getString("TITLE"));
                post.setContent(rs.getString("CONTENT"));
                post.setBoard_date(rs.getString("BOARD_DATE"));
                post.setBoard_state(rs.getInt("BOARD_STATE"));
                post.setBoard_no(boardNo);
                post.setCust_no(rs.getInt("CUST_NO"));
                post.setWriter(rs.getString("WRITER"));
                
                if (!boardsWithPosts.containsKey(boardNo)) {
                    boardsWithPosts.put(boardNo, new ArrayList<BoardVo>());
                }
                boardsWithPosts.get(boardNo).add(post);
                System.out.println("Board No: " + boardNo + ", Post No: " + post.getPost_no() + ", Title: " + post.getTitle());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return boardsWithPosts;
    }
}
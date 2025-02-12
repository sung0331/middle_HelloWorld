package kr.or.ddit.controller.login;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.vo.CustomerVo;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 2025300713500838817L;
    private Properties dbProperties;

    @Override
    public void init() throws ServletException {
        super.init();
        dbProperties = new Properties();
        try {
            InputStream inputStream = getClass().getClassLoader().getResourceAsStream("db.properties");
            if (inputStream != null) {
                dbProperties.load(inputStream);
                System.out.println("db.properties 로드 성공");
            } else {
                throw new IOException("db.properties 파일을 찾을 수 없습니다.");
            }
        } catch (IOException e) {
            throw new ServletException("db.properties 로드 실패", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("로그인 페이지");
        req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName(dbProperties.getProperty("driver"));
            System.out.println("JDBC 드라이버 로드 성공");

            conn = DriverManager.getConnection(
                dbProperties.getProperty("url"),
                dbProperties.getProperty("user"),
                dbProperties.getProperty("password")
            );
            System.out.println("데이터베이스 연결 성공");

            String sql = "SELECT * FROM CUSTOMER WHERE CUST_ID = ? AND CUST_PW = ? AND STATE = 1";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                // 로그인 성공
                CustomerVo user = new CustomerVo();
                user.setCust_no(rs.getInt("cust_no"));
                user.setCust_name(rs.getString("cust_name"));

                user.setCust_type(rs.getInt("cust_type"));
                user.setCust_age(rs.getInt("cust_age"));
                user.setCust_address1(rs.getString("cust_address1"));
                user.setCust_address2(rs.getString("cust_address2"));
                
                HttpSession session = req.getSession();
                session.setAttribute("user", user);
                session.setAttribute("userNo", user.getCust_no());
                session.setAttribute("Cust_Name", user.getCust_name());  // 이 줄 추가
                
                resp.sendRedirect(req.getContextPath() + "/index.do");
            } else {
                // 로그인 실패
                req.setAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
                req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
            }
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC 드라이버를 찾을 수 없습니다: " + e.getMessage());
            e.printStackTrace();
            req.setAttribute("error", "데이터베이스 드라이버 오류가 발생했습니다.");
        } catch (SQLException e) {
            System.out.println("데이터베이스 연결 오류: " + e.getMessage());
            e.printStackTrace();
            req.setAttribute("error", "데이터베이스 연결 오류가 발생했습니다.");
        } catch (Exception e) {
            System.out.println("예상치 못한 오류 발생: " + e.getMessage());
            e.printStackTrace();
            req.setAttribute("error", "서버 오류가 발생했습니다.");
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println("리소스 정리 중 오류 발생: " + e.getMessage());
                e.printStackTrace();
            }
	        }
	        
        if (req.getAttribute("error") != null) {
            req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
        }
    }
}
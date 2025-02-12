package kr.or.ddit.controller.resetpassword;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.io.InputStream;
import java.io.IOException;

import kr.or.ddit.vo.CustomerVo;

public class CustomerDao {
    private Properties prop;

    public CustomerDao() {
        prop = new Properties();
        try (InputStream input = getClass().getClassLoader().getResourceAsStream("db.properties")) {
            prop.load(input);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws SQLException {
        try {
            Class.forName(prop.getProperty("driver"));
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(prop.getProperty("url"), prop.getProperty("user"), prop.getProperty("password"));
    }

    public CustomerVo findCustomer(String username, String name, String email, String phone) {
        String sql = "SELECT * FROM CUSTOMER WHERE CUST_ID = ? AND CUST_NAME = ? AND CUST_MAIL = ? AND CUST_TEL = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            pstmt.setString(2, name);
            pstmt.setString(3, email);
            pstmt.setString(4, phone);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    CustomerVo customer = new CustomerVo();
                    customer.setCust_no(rs.getInt("CUST_NO"));
                    customer.setCust_name(rs.getString("CUST_NAME"));
                    customer.setCust_id(rs.getString("CUST_ID"));
                    customer.setCust_pw(rs.getString("CUST_PW"));
                    customer.setCust_mail(rs.getString("CUST_MAIL"));
                    customer.setCust_tel(rs.getString("CUST_TEL"));
                    return customer;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updatePassword(int custNo, String newPassword) {
        String sql = "UPDATE CUSTOMER SET CUST_PW = ? WHERE CUST_NO = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, newPassword);
            pstmt.setInt(2, custNo);
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
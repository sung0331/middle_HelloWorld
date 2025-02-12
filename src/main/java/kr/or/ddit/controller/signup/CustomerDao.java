package kr.or.ddit.controller.signup;

import kr.or.ddit.vo.CustomerVo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.io.InputStream;
import java.io.IOException;

public class CustomerDao {
    private static final String PROPERTIES_FILE = "/db.properties";
    private Properties props;

    public CustomerDao() {
        props = new Properties();
        try (InputStream is = getClass().getResourceAsStream(PROPERTIES_FILE)) {
            props.load(is);
            Class.forName(props.getProperty("driver"));
        } catch (IOException | ClassNotFoundException e) {
            throw new RuntimeException("Could not load database properties or driver", e);
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(
            props.getProperty("url"),
            props.getProperty("user"),
            props.getProperty("password")
        );
    }

    public boolean isUsernameDuplicate(String username) {
        String sql = "SELECT COUNT(*) FROM CUSTOMER WHERE CUST_ID = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean insertCustomer(CustomerVo customer) {
        String sql = "INSERT INTO CUSTOMER (cust_no, cust_name, cust_age, cust_id, cust_pw, cust_mail, cust_tel, cust_address1, cust_address2, state, mobile_no, grade_no, cust_type) " +
                     "VALUES ((SELECT NVL(MAX(cust_no), 0) + 1 FROM CUSTOMER), ?, ?, ?, ?, ?, ?, ?, ?, 1, ?, 1, 1)";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, customer.getCust_name());
            pstmt.setInt(2, customer.getCust_age());
            pstmt.setString(3, customer.getCust_id());
            pstmt.setString(4, customer.getCust_pw());
            pstmt.setString(5, customer.getCust_mail());
            pstmt.setString(6, customer.getCust_tel());
            pstmt.setString(7, customer.getCust_address1());
            pstmt.setString(8, customer.getCust_address2());
            pstmt.setInt(9, customer.getMobile_no());

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
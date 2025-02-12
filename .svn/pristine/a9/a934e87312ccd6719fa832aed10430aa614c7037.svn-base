package kr.or.ddit.dao;

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
        } catch (IOException e) {
            throw new RuntimeException("Could not load database properties", e);
        }
    }

    private Connection getConnection() throws SQLException {
        try {
            Class.forName(props.getProperty("driver"));
        } catch (ClassNotFoundException e) {
            throw new SQLException("Database driver not found", e);
        }
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
}
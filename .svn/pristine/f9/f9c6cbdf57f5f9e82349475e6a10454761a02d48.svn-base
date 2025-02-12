package kr.or.ddit.controller.findid;

import java.sql.*;
import java.util.Properties;
import java.io.InputStream;
import java.io.IOException;

public class CustomerDao {
    private String driver;
    private String url;
    private String user;
    private String password;

    public CustomerDao() {
        loadProperties();
    }

    private void loadProperties() {
        Properties prop = new Properties();
        try (InputStream input = getClass().getClassLoader().getResourceAsStream("db.properties")) {
            prop.load(input);
            driver = prop.getProperty("driver");
            url = prop.getProperty("url");
            user = prop.getProperty("user");
            password = prop.getProperty("password");
            Class.forName(driver);
            System.out.println("Database properties loaded successfully.");
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public String findIdByNameEmailAndPhone(String name, String email, String phone) {
        String sql = "SELECT CUST_ID FROM CUSTOMER WHERE CUST_NAME = ? AND CUST_MAIL = ? AND CUST_TEL = ?";
        System.out.println("Executing SQL: " + sql);
        System.out.println("Parameters: name=" + name + ", email=" + email + ", phone=" + phone);
        
        try (Connection conn = DriverManager.getConnection(url, user, password);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, phone);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String foundId = rs.getString("CUST_ID");
                    System.out.println("Found ID: " + foundId);
                    return foundId;
                } else {
                    System.out.println("No matching user found in the database.");
                }
            }
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
}
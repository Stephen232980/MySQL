package com.codegym.dao;

import com.codegym.model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO {
    // Khai báo các thông tin kết nối và phương thức cũ giữ nguyên...
    
    // Triển khai hàm gọi Stored Procedure: get_user_by_id
    @Override
    public User getUserById(int id) {
        User user = null;
        String query = "{CALL get_user_by_id(?)}"; // Cú pháp chuẩn gọi Procedure

        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(query)) {
            
            callableStatement.setInt(1, id);
            ResultSet rs = callableStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // Triển khai hàm gọi Stored Procedure: insert_user
    @Override
    public void insertUserStore(User user) throws SQLException {
        String query = "{CALL insert_user(?, ?, ?)}"; // 3 dấu ? tương ứng 3 tham số IN

        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(query)) {
            
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
        }
    }
}
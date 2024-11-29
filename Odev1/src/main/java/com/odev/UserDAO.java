package com.odev;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    public List<User> getAllUsers() throws SQLException, ClassNotFoundException {
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM public.\"Users\"";
        
        try (Connection connection = DatabaseConnection.connect();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getString("Id"));
                user.setEmail(resultSet.getString("Email"));
                user.setName(resultSet.getString("Name"));
                user.setGender(resultSet.getString("Gender"));
                user.setCity(resultSet.getString("City"));
                user.setPassword(resultSet.getString("Password"));
                user.setRole(resultSet.getString("Role"));
                
                users.add(user);
            }
        }
        return users;
    }
}

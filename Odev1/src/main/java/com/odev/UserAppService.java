package com.odev;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.odev.application.DatabaseConnection;
import com.odev.entities.User;

public class UserAppService {

	public User validateUser(String email, String password) throws SQLException, ClassNotFoundException {
		User user = null;

		String query = "SELECT * FROM public.\"Users\" WHERE \"Email\" = ? AND \"Password\" = ?";

		try (Connection connection = DatabaseConnection.connect();
				PreparedStatement statement = connection.prepareStatement(query)) {

			statement.setString(1, email);
			statement.setString(2, password);

			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next()) {
					user = new User();
					user.setId(resultSet.getString("Id"));
					user.setEmail(resultSet.getString("Email"));
					user.setName(resultSet.getString("Name"));
					user.setGender(resultSet.getString("Gender"));
					user.setCity(resultSet.getString("City"));
					user.setPassword(resultSet.getString("Password"));
					user.setRole(resultSet.getString("Role"));
				}
			}
		}

		return user;
	}

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

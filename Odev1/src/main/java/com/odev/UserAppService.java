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
					
					user.setId(resultSet.getString("Id") == null ? "" : resultSet.getString("Id"));
					user.setEmail(resultSet.getString("Email") == null ? "" : resultSet.getString("Email"));
					user.setName(resultSet.getString("Name") == null ? "" : resultSet.getString("Name"));
					user.setHobies(resultSet.getString("Hobies") == null ? "" : resultSet.getString("Hobies"));
					user.setCity(resultSet.getString("City") == null ? "" : resultSet.getString("City"));
					user.setPassword(resultSet.getString("Password") == null ? "" : resultSet.getString("Password"));
					user.setLinkName(resultSet.getString("LinkName") == null ? "" : resultSet.getString("LinkName"));
					user.setAddress(resultSet.getString("Address") == null ? "" : resultSet.getString("Address"));
					user.setPhone(resultSet.getString("Phone") == null ? "" : resultSet.getString("Phone"));
					user.setSchoolName(resultSet.getString("SchoolName") == null ? "" : resultSet.getString("SchoolName"));
					user.setBusiness(resultSet.getString("Business") == null ? "" : resultSet.getString("Business"));
					user.setWebSite(resultSet.getString("WebSite") == null ? "" : resultSet.getString("WebSite"));
					user.setFacebookName(resultSet.getString("FacebookName") == null ? "" : resultSet.getString("FacebookName"));
					user.setTwitterName(resultSet.getString("TwitterName") == null ? "" : resultSet.getString("TwitterName"));
					user.setGender(resultSet.getString("Gender") == null ? "" : resultSet.getString("Gender"));
					user.setRole(resultSet.getString("Role") == null ? "" : resultSet.getString("Role"));
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

				user.setId(resultSet.getString("Id") == null ? "" : resultSet.getString("Id"));
				user.setEmail(resultSet.getString("Email") == null ? "" : resultSet.getString("Email"));
				user.setName(resultSet.getString("Name") == null ? "" : resultSet.getString("Name"));
				user.setHobies(resultSet.getString("Hobies") == null ? "" : resultSet.getString("Hobies"));
				user.setCity(resultSet.getString("City") == null ? "" : resultSet.getString("City"));
				user.setPassword(resultSet.getString("Password") == null ? "" : resultSet.getString("Password"));
				user.setLinkName(resultSet.getString("LinkName") == null ? "" : resultSet.getString("LinkName"));
				user.setAddress(resultSet.getString("Address") == null ? "" : resultSet.getString("Address"));
				user.setPhone(resultSet.getString("Phone") == null ? "" : resultSet.getString("Phone"));
				user.setSchoolName(resultSet.getString("SchoolName") == null ? "" : resultSet.getString("SchoolName"));
				user.setBusiness(resultSet.getString("Business") == null ? "" : resultSet.getString("Business"));
				user.setWebSite(resultSet.getString("WebSite") == null ? "" : resultSet.getString("WebSite"));
				user.setFacebookName(resultSet.getString("FacebookName") == null ? "" : resultSet.getString("FacebookName"));
				user.setTwitterName(resultSet.getString("TwitterName") == null ? "" : resultSet.getString("TwitterName"));
				user.setGender(resultSet.getString("Gender") == null ? "" : resultSet.getString("Gender"));
				user.setRole(resultSet.getString("Role") == null ? "" : resultSet.getString("Role"));

				users.add(user);
			}
		}

		return users;
	}

}

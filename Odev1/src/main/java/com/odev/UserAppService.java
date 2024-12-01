package com.odev;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import com.odev.application.DatabaseConnection;
import com.odev.entities.ListUserAndRowCount;
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

					Array hobbiesArray = resultSet.getArray("Hobbies");
					if (hobbiesArray != null) {
						user.setHobbies(Arrays.asList((String[]) hobbiesArray.getArray()));
					}

					user.setId(UUID.fromString(resultSet.getString("Id")));
					user.setEmail(resultSet.getString("Email") == null ? "" : resultSet.getString("Email"));
					user.setName(resultSet.getString("Name") == null ? "" : resultSet.getString("Name"));
					user.setCity(resultSet.getString("City") == null ? "" : resultSet.getString("City"));
					user.setPassword(resultSet.getString("Password") == null ? "" : resultSet.getString("Password"));
					user.setLinkName(resultSet.getString("LinkName") == null ? "" : resultSet.getString("LinkName"));
					user.setAddress(resultSet.getString("Address") == null ? "" : resultSet.getString("Address"));
					user.setPhone(resultSet.getString("Phone") == null ? "" : resultSet.getString("Phone"));
					user.setSchoolName(
							resultSet.getString("SchoolName") == null ? "" : resultSet.getString("SchoolName"));
					user.setBusiness(resultSet.getString("Business") == null ? "" : resultSet.getString("Business"));
					user.setWebSite(resultSet.getString("WebSite") == null ? "" : resultSet.getString("WebSite"));
					user.setFacebookName(
							resultSet.getString("FacebookName") == null ? "" : resultSet.getString("FacebookName"));
					user.setTwitterName(
							resultSet.getString("TwitterName") == null ? "" : resultSet.getString("TwitterName"));
					user.setGender(resultSet.getInt("Gender"));
					user.setRole(resultSet.getString("Role") == null ? "" : resultSet.getString("Role"));
					user.setPicture(resultSet.getString("Picture") == null ? "" : resultSet.getString("Picture"));
				}
			}
		}

		return user;
	}

	public User getUser(String id) throws SQLException, ClassNotFoundException {
		User user = null;

		String query = "SELECT * FROM public.\"Users\" WHERE \"Id\" = ? ";

		try (Connection connection = DatabaseConnection.connect();
				PreparedStatement statement = connection.prepareStatement(query)) {

			statement.setObject(1, UUID.fromString(id), java.sql.Types.OTHER);
			
			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next()) {
					user = new User();

					Array hobbiesArray = resultSet.getArray("Hobbies");
					if (hobbiesArray != null) {
						user.setHobbies(Arrays.asList((String[]) hobbiesArray.getArray()));
					}

					user.setId(UUID.fromString(resultSet.getString("Id")));
					user.setEmail(resultSet.getString("Email") == null ? "" : resultSet.getString("Email"));
					user.setName(resultSet.getString("Name") == null ? "" : resultSet.getString("Name"));
					user.setCity(resultSet.getString("City") == null ? "" : resultSet.getString("City"));
					user.setPassword(resultSet.getString("Password") == null ? "" : resultSet.getString("Password"));
					user.setLinkName(resultSet.getString("LinkName") == null ? "" : resultSet.getString("LinkName"));
					user.setAddress(resultSet.getString("Address") == null ? "" : resultSet.getString("Address"));
					user.setPhone(resultSet.getString("Phone") == null ? "" : resultSet.getString("Phone"));
					user.setSchoolName(
							resultSet.getString("SchoolName") == null ? "" : resultSet.getString("SchoolName"));
					user.setBusiness(resultSet.getString("Business") == null ? "" : resultSet.getString("Business"));
					user.setWebSite(resultSet.getString("WebSite") == null ? "" : resultSet.getString("WebSite"));
					user.setFacebookName(
							resultSet.getString("FacebookName") == null ? "" : resultSet.getString("FacebookName"));
					user.setTwitterName(
							resultSet.getString("TwitterName") == null ? "" : resultSet.getString("TwitterName"));
					user.setGender(resultSet.getInt("Gender"));
					user.setRole(resultSet.getString("Role") == null ? "" : resultSet.getString("Role"));
					user.setPicture(resultSet.getString("Picture") == null ? "" : resultSet.getString("Picture"));
				}
			}
		}

		return user;
	}
	
	public int getTotalUsers(String searchName) throws SQLException, ClassNotFoundException{
		String query = "SELECT COUNT(\"Id\") AS total FROM public.\"Users\" WHERE 1=1";

		if (searchName != null && !searchName.isEmpty()) {
	        query += " AND LOWER(\"Name\") LIKE LOWER(?)";
	    }
		
	    try (Connection connection = DatabaseConnection.connect();
    		PreparedStatement statement = connection.prepareStatement(query)) {

	    	if (searchName != null && !searchName.isEmpty()) {
				statement.setString(1, "%" + searchName + "%");
	        }
	    	
        	ResultSet rs = statement.executeQuery();
	        if (rs.next()) {
	            return rs.getInt("total");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return 0;
	}
	
	public ListUserAndRowCount getAllUsers(String searchName, int page, int pageSize) throws SQLException, ClassNotFoundException {
		List<User> users = new ArrayList<>();
		int i = 0;
		
		String query = "SELECT * FROM public.\"Users\" WHERE 1=1";

		if (searchName != null && !searchName.isEmpty()) {
	        query += " AND LOWER(\"Name\") LIKE LOWER(?)";
	    }
		
		query += " ORDER BY \"Id\" LIMIT ? OFFSET ?";
		
		try (Connection connection = DatabaseConnection.connect();
				PreparedStatement statement = connection.prepareStatement(query)) {

				if (searchName != null && !searchName.isEmpty()) {
					i++;
					statement.setString(i, "%" + searchName + "%");
		        }
				
				i++;
				statement.setInt(i, pageSize);
				i++;
				statement.setInt(i, (page - 1) * pageSize);
				
				try (ResultSet resultSet = statement.executeQuery()) {
				while (resultSet.next()) {
					User user = new User();
	
					Array hobbiesArray = resultSet.getArray("Hobbies");
					if (hobbiesArray != null) {
					    user.setHobbies(Arrays.asList((String[]) hobbiesArray.getArray()));
					}
					
					user.setId(resultSet.getString("Id") == null ? null : UUID.fromString(resultSet.getString("Id")));
					user.setEmail(resultSet.getString("Email") == null ? "" : resultSet.getString("Email"));
					user.setName(resultSet.getString("Name") == null ? "" : resultSet.getString("Name"));
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
					user.setGender(resultSet.getInt("Gender"));
					user.setRole(resultSet.getString("Role") == null ? "" : resultSet.getString("Role"));
					user.setPicture(resultSet.getString("Picture") == null ? "" : resultSet.getString("Picture"));
					
					users.add(user);
				}
			}
		}

		int totalCount = getTotalUsers(searchName);
		
		return new ListUserAndRowCount(users, totalCount);
	}

	public boolean updateProfile(User user) {
		String query = "UPDATE public.\"Users\" SET \"Name\" = ?, \"Email\" = ?, \"Password\" = ?, \"Phone\" = ?, \"City\" = ?, \"Address\" = ?, "
				+ "\"SchoolName\" = ?, \"Business\" = ?, \"Hobbies\" = ?, \"WebSite\" = ?, \"FacebookName\" = ?, \"TwitterName\" = ?, "
				+ "\"Role\" = ?, \"Gender\" = ? WHERE \"Id\" = ?";

		try (Connection connection = DatabaseConnection.connect();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {

			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getEmail());
			preparedStatement.setString(3, user.getPassword());
			preparedStatement.setString(4, user.getPhone());
			preparedStatement.setString(5, user.getCity());
			preparedStatement.setString(6, user.getAddress());
			preparedStatement.setString(7, user.getSchoolName());
			preparedStatement.setString(8, user.getBusiness());

			if (user.getHobbies() != null) {
				preparedStatement.setArray(9,
						connection.createArrayOf("text", user.getHobbies().toArray(new String[0])));
			} else {
				preparedStatement.setNull(9, java.sql.Types.ARRAY);
			}

			preparedStatement.setString(10, user.getWebSite());
			preparedStatement.setString(11, user.getFacebookName());
			preparedStatement.setString(12, user.getTwitterName());
			preparedStatement.setString(13, user.getRole());
			preparedStatement.setInt(14, user.getGender());
			preparedStatement.setObject(15, user.getId(), java.sql.Types.OTHER);
			// user.setId(UUID.fromString("799a746c-3f90-4d83-b46c-9f5375645f44"));

			int rowsAffected = preparedStatement.executeUpdate();
			return rowsAffected > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateProfilePicture(String Id, String picturePath) {
		String query = "UPDATE public.\"Users\" SET \"Picture\" = ? WHERE \"Id\" = ?";

		try (Connection connection = DatabaseConnection.connect();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {

			preparedStatement.setString(1, picturePath);
			preparedStatement.setObject(2, UUID.fromString(Id), java.sql.Types.OTHER);

			int rowsUpdated = preparedStatement.executeUpdate();
			return rowsUpdated > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}

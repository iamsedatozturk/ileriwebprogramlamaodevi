package com.odev;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import com.odev.application.DatabaseConnection;
import com.odev.entities.Users_Comments;
import com.odev.entities.Users_CommentsListDto;
import com.odev.entities.Forum;
import com.odev.entities.Forum_ListDto;
import com.odev.entities.Users;

public class ForumAppService {
	public boolean insertForum(Forum forum) {
        String query = "INSERT INTO public.\"Forum\" (\"Id\", \"UserId\", \"Title\", \"Comment\") " +
    					"VALUES (?, ?, ?, ?)";

		try (Connection connection = DatabaseConnection.connect();
				PreparedStatement statement = connection.prepareStatement(query)) {

			statement.setObject(1, forum.getId());
			statement.setObject(2, forum.getUserId());
			statement.setString(3, forum.getTitle());
			statement.setObject(4, forum.getComment());

			int rowsAffected = statement.executeUpdate();
			return rowsAffected > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean deleteForum(UUID id) {
		String query = "DELETE FROM public.\"Forum\" WHERE \"Id\" = ?";

		try (Connection connection = DatabaseConnection.connect();
				PreparedStatement statement = connection.prepareStatement(query)) {

			statement.setObject(1, id);

			int rowsAffected = statement.executeUpdate();
			return rowsAffected > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public Forum_ListDto getAllForums(String searchName, int page, int pageSize) throws SQLException, ClassNotFoundException {
		List<Forum> forums = new ArrayList<>();
		int i = 0;
		
		String query = "SELECT * FROM public.\"Forum\" WHERE 1=1";

		if (searchName != null && !searchName.isEmpty()) {
	        query += " AND LOWER(\"Comment\") LIKE LOWER(?)";
	    }
		
		query += " ORDER BY \"CreateTime\" DESC LIMIT ? OFFSET ?";
		
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
					Forum forum = new Forum();
	
					forum.setId(resultSet.getString("Id") == null ? null : UUID.fromString(resultSet.getString("Id")));
					forum.setUserId(resultSet.getString("UserId") == null ? null : UUID.fromString(resultSet.getString("UserId")));
					forum.setCreateTime(resultSet.getTimestamp("CreateTime") == null ? null : resultSet.getTimestamp("CreateTime"));
					forum.setTitle(resultSet.getString("Title") == null ? "" : resultSet.getString("Title"));
					forum.setComment(resultSet.getString("Comment") == null ? "" : resultSet.getString("Comment"));
					forum.setUserName(resultSet.getString("UserId") == null ? null : UUID.fromString(resultSet.getString("UserId")));
					forum.setUserPicture(resultSet.getString("UserId") == null ? null : UUID.fromString(resultSet.getString("UserId")));
					
					forums.add(forum);
				}
			}
		}

		int totalCount = getTotalForums(searchName);
		
		return new Forum_ListDto(forums, totalCount);
	}
	
	public int getTotalForums(String searchName) throws SQLException, ClassNotFoundException{
		String query = "SELECT COUNT(\"Id\") AS total FROM public.\"Forum\" WHERE 1=1";

		if (searchName != null && !searchName.isEmpty()) {
	        query += " AND LOWER(\"Comment\") LIKE LOWER(?)";
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

}

package com.odev;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.odev.application.DatabaseConnection;
import com.odev.entities.Forum_Comments;
import com.odev.entities.Forum_CommentsListDto;

public class ForumCommentsAppService {
	public boolean insertComment(Forum_Comments comments) {
        String query = "INSERT INTO public.\"Forum_Comments\" (\"Id\", \"ForumId\", \"CreatorId\", \"Message\") " +
        		"VALUES (?, ?, ?, ?)";

		try (Connection connection = DatabaseConnection.connect();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {

			preparedStatement.setObject(1, comments.getId());
			preparedStatement.setObject(2, comments.getForumId());
			preparedStatement.setObject(3, comments.getCreatorId());
			preparedStatement.setString(4, comments.getMessage());

			int rowsAffected = preparedStatement.executeUpdate();
			return rowsAffected > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean deleteMessage(UUID messageId) {
		String query = "DELETE FROM public.\"Forum_Comments\" WHERE \"Id\" = ?";

		try (Connection connection = DatabaseConnection.connect();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {

			preparedStatement.setObject(1, messageId);

			int rowsAffected = preparedStatement.executeUpdate();
			return rowsAffected > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public Forum_CommentsListDto getAllComments(UUID forumId, int page, int pageSize) throws SQLException, ClassNotFoundException {
		List<Forum_Comments> comments = new ArrayList<>();
		int i = 1;
		
		String query = "SELECT * FROM public.\"Forum_Comments\" WHERE \"ForumId\" = ? ";

		query += " ORDER BY \"CreateTime\" ASC LIMIT ? OFFSET ?";
		
		try (Connection connection = DatabaseConnection.connect();
				PreparedStatement statement = connection.prepareStatement(query)) {

				statement.setObject(1, forumId);
				
				i++;
				statement.setInt(i, pageSize);
				i++;
				statement.setInt(i, (page - 1) * pageSize);
				
				
				try (ResultSet resultSet = statement.executeQuery()) {
				while (resultSet.next()) {
					Forum_Comments comment = new Forum_Comments();
	
					comment.setId(resultSet.getString("Id") == null ? null : UUID.fromString(resultSet.getString("Id")));
					comment.setForumId(resultSet.getString("ForumId") == null ? null : UUID.fromString(resultSet.getString("ForumId")));
					comment.setCreateTime(resultSet.getTimestamp("CreateTime") == null ? null : resultSet.getTimestamp("CreateTime"));
					comment.setCreatorId(resultSet.getString("CreatorId") == null ? null : UUID.fromString(resultSet.getString("CreatorId")));				
					comment.setMessage(resultSet.getString("Message") == null ? "" : resultSet.getString("Message"));
					comment.setCreatorName(resultSet.getString("CreatorId") == null ? null : UUID.fromString(resultSet.getString("CreatorId")));
					comment.setCreatorPicture(resultSet.getString("CreatorId") == null ? null : UUID.fromString(resultSet.getString("CreatorId")));
					
					comments.add(comment);
				}
			}
		}

		int totalCount = getTotalForumComments(forumId);
		
		return new Forum_CommentsListDto(comments, totalCount);
	}
	
	public int getTotalForumComments(UUID forumId) throws SQLException, ClassNotFoundException{
		String query = "SELECT COUNT(\"Id\") AS total FROM public.\"Forum_Comments\" WHERE \"ForumId\" = ?";

	    try (Connection connection = DatabaseConnection.connect();
    		PreparedStatement statement = connection.prepareStatement(query)) {

	    	statement.setObject(1, forumId);
	    	
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

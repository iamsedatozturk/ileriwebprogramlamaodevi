package com.odev;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import com.odev.application.DatabaseConnection;
import com.odev.entities.Comment;
import com.odev.entities.CommentListDto;
import com.odev.entities.User;

public class CommentAppService {
	public boolean insertComment(Comment comment) {
        String query = "INSERT INTO public.\"Users_Comments\" (\"Id\", \"UserId\", \"Type\", \"Media\", \"CreatorId\", \"Comment\") " +
        		"VALUES (?, ?, ?, ?, ?, ?)";

		try (Connection connection = DatabaseConnection.connect();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {

			preparedStatement.setObject(1, comment.getId());
			preparedStatement.setObject(2, comment.getUserId());
			preparedStatement.setString(3, comment.getType());
			preparedStatement.setString(4, comment.getMedia());
			preparedStatement.setObject(5, comment.getCreatorId());
			preparedStatement.setString(6, comment.getComment());

			int rowsAffected = preparedStatement.executeUpdate();
			return rowsAffected > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean deleteComment(UUID commentId) {
		String query = "DELETE FROM public.\"Users_Comments\" WHERE \"Id\" = ?";

		try (Connection connection = DatabaseConnection.connect();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {

			preparedStatement.setObject(1, commentId);

			int rowsAffected = preparedStatement.executeUpdate();
			return rowsAffected > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public CommentListDto getAllComments(UUID UserId, int page, int pageSize) throws SQLException, ClassNotFoundException {
		List<Comment> comments = new ArrayList<>();
		
		String query = "SELECT * FROM public.\"Users_Comments\" WHERE \"UserId\" = ? ORDER BY \"CreateTime\" DESC LIMIT ? OFFSET ?";

		try (Connection connection = DatabaseConnection.connect();
				PreparedStatement statement = connection.prepareStatement(query)) {

				statement.setObject(1, UserId);
				statement.setInt(2, pageSize);
				statement.setInt(3, (page - 1) * pageSize);
				
				try (ResultSet resultSet = statement.executeQuery()) {
				while (resultSet.next()) {
					Comment comment = new Comment();
	
					comment.setId(resultSet.getString("Id") == null ? null : UUID.fromString(resultSet.getString("Id")));
					comment.setCreateTime(resultSet.getTimestamp("CreateTime") == null ? null : resultSet.getTimestamp("CreateTime"));
					comment.setUserId(resultSet.getString("UserId") == null ? null : UUID.fromString(resultSet.getString("UserId")));
					comment.setType(resultSet.getString("Type") == null ? "" : resultSet.getString("Type"));
					comment.setMedia(resultSet.getString("Media") == null ? "" : resultSet.getString("Media"));
					comment.setCreatorId(resultSet.getString("CreatorId") == null ? null : UUID.fromString(resultSet.getString("CreatorId")));
					comment.setComment(resultSet.getString("Comment") == null ? "" : resultSet.getString("Comment"));
					comment.setCreatorName(resultSet.getString("CreatorId") == null ? null : UUID.fromString(resultSet.getString("CreatorId")));
					comment.setCreatorPicture(resultSet.getString("CreatorId") == null ? null : UUID.fromString(resultSet.getString("CreatorId")));
					
					comments.add(comment);
				}
			}
		}

		int totalCount = getTotalComments(UserId);
		
		return new CommentListDto(comments, totalCount);
	}
	
	public int getTotalComments(UUID UserId) throws SQLException, ClassNotFoundException{
		String query = "SELECT COUNT(\"Id\") AS total FROM public.\"Users_Comments\" WHERE \"UserId\" = ?";

	    try (Connection connection = DatabaseConnection.connect();
    		PreparedStatement statement = connection.prepareStatement(query)) {

			statement.setObject(1, UserId);
	    	
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

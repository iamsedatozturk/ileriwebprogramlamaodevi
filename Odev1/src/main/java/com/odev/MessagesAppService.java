package com.odev;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.odev.application.DatabaseConnection;
import com.odev.entities.Messages;

public class MessagesAppService {
	public boolean insertMessage(Messages messages) {
        String query = "INSERT INTO public.\"Users_Messages\" (\"Id\", \"CommentId\", \"CreatorId\", \"Message\") " +
        		"VALUES (?, ?, ?, ?)";

		try (Connection connection = DatabaseConnection.connect();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {

			preparedStatement.setObject(1, messages.getId());
			preparedStatement.setObject(2, messages.getCommentId());
			preparedStatement.setObject(3, messages.getCreatorId());
			preparedStatement.setString(4, messages.getMessage());

			int rowsAffected = preparedStatement.executeUpdate();
			return rowsAffected > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean deleteMessage(UUID messageId) {
		String query = "DELETE FROM public.\"Users_Messages\" WHERE \"Id\" = ?";

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
	
	public List<Messages> getAllMessages(UUID CommentId) throws SQLException, ClassNotFoundException {
		List<Messages> messages = new ArrayList<>();
		
		String query = "SELECT * FROM public.\"Users_Messages\" WHERE \"CommentId\" = ? ORDER BY \"CreateTime\" ";

		try (Connection connection = DatabaseConnection.connect();
				PreparedStatement statement = connection.prepareStatement(query)) {

				statement.setObject(1, CommentId);
				
				try (ResultSet resultSet = statement.executeQuery()) {
				while (resultSet.next()) {
					Messages message = new Messages();
	
					message.setId(resultSet.getString("Id") == null ? null : UUID.fromString(resultSet.getString("Id")));
					message.setCreateTime(resultSet.getTimestamp("CreateTime") == null ? null : resultSet.getTimestamp("CreateTime"));
					message.setCommentId(resultSet.getString("CommentId") == null ? null : UUID.fromString(resultSet.getString("CommentId")));
					message.setCreatorId(resultSet.getString("CreatorId") == null ? null : UUID.fromString(resultSet.getString("CreatorId")));				
					message.setMessage(resultSet.getString("Message") == null ? "" : resultSet.getString("Message"));
					message.setCreatorName(resultSet.getString("CreatorId") == null ? null : UUID.fromString(resultSet.getString("CreatorId")));
					message.setCreatorPicture(resultSet.getString("CreatorId") == null ? null : UUID.fromString(resultSet.getString("CreatorId")));
					
					messages.add(message);
				}
			}
		}

		return messages;
	}
}

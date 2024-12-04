package com.odev;

import com.odev.entities.Users_Messages;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.*;

@SuppressWarnings("serial")
@WebServlet("/InsertMessagesServlet")
public class InsertMessagesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	UUID id = UUID.randomUUID();
        String creatorId = request.getParameter("creatorId");
        String commentId = request.getParameter("commentId");
        String userId = request.getParameter("userId");
        String message = request.getParameter("message");
    	
    	Users_Messages newMessage= new Users_Messages();
    	newMessage.setId(id);
    	newMessage.setCreatorId(UUID.fromString(creatorId));
    	newMessage.setCommentId(UUID.fromString(commentId));
    	newMessage.setMessage(message);
        
        UsersMessagesAppService messageAppService = new UsersMessagesAppService();
        boolean isSave = false;
        
		isSave = messageAppService.insertMessage(newMessage);

        if (isSave) {
            response.sendRedirect("User.jsp?Id=" + userId);
        } else {
        	response.sendRedirect("Error.jsp");
        }
    }
}


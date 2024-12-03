package com.odev;

import com.odev.entities.Comment;
import com.odev.entities.Messages;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.*;

@SuppressWarnings("serial")
@WebServlet("/MessagesServlet")
public class MessagesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	UUID id = UUID.randomUUID();
        String creatorId = request.getParameter("creatorId");
        String commentId = request.getParameter("commentId");
        String userId = request.getParameter("userId");
        String message = request.getParameter("message");
    	
    	Messages newMessage= new Messages();
    	newMessage.setId(id);
    	newMessage.setCreatorId(UUID.fromString(creatorId));
    	newMessage.setCommentId(UUID.fromString(commentId));
    	newMessage.setMessage(message);
        
        MessagesAppService messageAppService = new MessagesAppService();
        boolean isSave = false;
        
		isSave = messageAppService.insertMessage(newMessage);

        if (isSave) {
            response.sendRedirect("User.jsp?Id=" + userId);
        } else {
        	response.sendRedirect("Error.jsp");
        }
    }
}


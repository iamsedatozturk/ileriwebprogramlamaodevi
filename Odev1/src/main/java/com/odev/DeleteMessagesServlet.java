package com.odev;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.*;

@SuppressWarnings("serial")
@WebServlet("/DeleteMessagesServlet")
public class DeleteMessagesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String messageId = request.getParameter("messageId");
    	String userId = request.getParameter("userId");

        UsersMessagesAppService messageAppService = new UsersMessagesAppService();
        boolean isSave = false;
        
		isSave = messageAppService.deleteMessage(UUID.fromString(messageId));

        if (isSave) {
            response.sendRedirect("User.jsp?Id=" + userId);
        } else {
        	response.sendRedirect("Error.jsp");
        }
    }
}


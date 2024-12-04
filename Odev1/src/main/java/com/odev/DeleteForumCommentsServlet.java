package com.odev;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.*;

@SuppressWarnings("serial")
@WebServlet("/DeleteForumCommentsServlet")
public class DeleteForumCommentsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String id = request.getParameter("Id");
    	String forumId = request.getParameter("forumId");

    	ForumCommentsAppService forumCommentsAppService = new ForumCommentsAppService();
        boolean isSave = false;
        
		isSave = forumCommentsAppService.deleteMessage(UUID.fromString(id));

        if (isSave) {
            response.sendRedirect("Forum.jsp?Id=" + forumId);
        } else {
        	response.sendRedirect("Error.jsp");
        }
    }
}


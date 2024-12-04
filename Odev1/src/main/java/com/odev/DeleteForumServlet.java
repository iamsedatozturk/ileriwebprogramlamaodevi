package com.odev;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.*;

@SuppressWarnings("serial")
@WebServlet("/DeleteForumServlet")
public class DeleteForumServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String id = request.getParameter("Id");

    	ForumAppService forumCommentsAppService = new ForumAppService();
        boolean isSave = false;
        
		isSave = forumCommentsAppService.deleteForum(UUID.fromString(id));

        if (isSave) {
            response.sendRedirect("Forums.jsp");
        } else {
        	response.sendRedirect("Error.jsp");
        }
    }
}


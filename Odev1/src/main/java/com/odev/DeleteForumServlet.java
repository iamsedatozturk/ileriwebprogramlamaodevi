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
    	String type = request.getParameter("type");
    	
    	ForumAppService forumCommentsAppService = new ForumAppService();
        boolean isSave = false;
        
		isSave = forumCommentsAppService.deleteForum(UUID.fromString(id));

        if (isSave) {
        	if ("text".contains(type))
        		response.sendRedirect("Forums.jsp");
        	else if ("video".contains(type))
        		response.sendRedirect("Videos.jsp");
        	else if ("image".contains(type))
        		response.sendRedirect("Images.jsp");
        } else {
        	response.sendRedirect("Error.jsp");
        }
    }
}


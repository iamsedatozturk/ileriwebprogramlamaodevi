package com.odev;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.*;

@SuppressWarnings("serial")
@WebServlet("/DeleteCommentServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
			maxFileSize = 1024 * 1024 * 10, // 10MB
			maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class DeleteCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String commentId = request.getParameter("commentId");
    	String userId = request.getParameter("userId");

        CommentAppService commentAppService = new CommentAppService();
        boolean isSave = false;
        
		isSave = commentAppService.deleteComment(UUID.fromString(commentId));

        if (isSave) {
            response.sendRedirect("User.jsp?Id=" + userId);
        } else {
        	response.sendRedirect("Error.jsp");
        }
    }
}


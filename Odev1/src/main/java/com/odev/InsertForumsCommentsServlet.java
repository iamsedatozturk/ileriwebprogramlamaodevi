package com.odev;

import com.odev.entities.Forum_Comments;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.*;

@SuppressWarnings("serial")
@WebServlet("/InsertForumsCommentsServlet")
public class InsertForumsCommentsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	UUID id = UUID.randomUUID();
        String forumId = request.getParameter("forumId");
        String creatorId = request.getParameter("creatorId");
        String message = request.getParameter("message");
        String type = request.getParameter("type");

        Forum_Comments newForumComment = new Forum_Comments();
        newForumComment.setId(id);
        newForumComment.setForumId(UUID.fromString(forumId));
        newForumComment.setCreatorId(UUID.fromString(creatorId));
        newForumComment.setMessage(message);
        
        ForumCommentsAppService forumCommentsAppService = new ForumCommentsAppService();
        boolean isSave = false;
        
		isSave = forumCommentsAppService.insertComment(newForumComment);

        if (isSave) {
        	if ("text".contains(type))
        		response.sendRedirect("Forum.jsp?Id=" + forumId);
        	else if ("video".contains(type))
        		response.sendRedirect("Video.jsp?Id=" + forumId);
        	else if ("image".contains(type))
        		response.sendRedirect("Image.jsp?Id=" + forumId);        	
        } else {
        	response.sendRedirect("Error.jsp");
        }
    }
}


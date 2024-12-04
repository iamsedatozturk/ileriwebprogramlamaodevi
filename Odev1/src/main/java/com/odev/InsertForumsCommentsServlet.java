package com.odev;

import com.odev.entities.Forum;
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

        Forum_Comments newForumComment = new Forum_Comments();
        newForumComment.setId(id);
        newForumComment.setForumId(UUID.fromString(forumId));
        newForumComment.setCreatorId(UUID.fromString(creatorId));
        newForumComment.setMessage(message);
        
        ForumCommentsAppService forumCommentsAppService = new ForumCommentsAppService();
        boolean isSave = false;
        
		isSave = forumCommentsAppService.insertComment(newForumComment);

        if (isSave) {
            response.sendRedirect("Forum.jsp?Id=" + forumId);
        } else {
        	response.sendRedirect("Error.jsp");
        }
    }
}


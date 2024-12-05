package com.odev;

import com.odev.entities.Forum;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.*;

@SuppressWarnings("serial")
@WebServlet("/InsertForumsServlet")
public class InsertForumsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	UUID id = UUID.randomUUID();
        String userId = request.getParameter("userId");
        String title = request.getParameter("title");
        String comment = request.getParameter("comment");
        String type = request.getParameter("type");
        
        Forum newForum = new Forum();
        newForum.setId(id);
        newForum.setUserId(UUID.fromString(userId));
        newForum.setTitle(title);
        newForum.setComment(comment);
        newForum.setType(type);
        
        List<String> medias = new ArrayList<>();
        String[] selectedMedias = request.getParameterValues("video");
        if (selectedMedias != null) {
        	medias.addAll(Arrays.asList(selectedMedias));
        }

        newForum.setMedias(medias);
        
        
        ForumAppService forumAppService = new ForumAppService();
        boolean isSave = false;
        
		isSave = forumAppService.insertForum(newForum);

        if (isSave) {
        	if (type == "text")
        		response.sendRedirect("Forums.jsp");
        	else if (type == "video")
        		response.sendRedirect("Videos.jsp");
        	else if (type == "image")
        		response.sendRedirect("Images.jsp");
        } else {
        	response.sendRedirect("Error.jsp");
        }
    }
}


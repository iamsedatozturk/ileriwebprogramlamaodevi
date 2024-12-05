package com.odev;

import com.odev.entities.Forum;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.*;

@SuppressWarnings("serial")
@WebServlet("/InsertForumsServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
						maxFileSize = 1024 * 1024 * 10, // 10MB
						maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class InsertForumsServlet extends HttpServlet {
	String UPLOAD_DIR = "Uploads";

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
        
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}    
        
    	List<String> medias = new ArrayList<>();
    	if ("video".contains(type)) {
            String[] selectedMedias = request.getParameterValues("video");
            if (selectedMedias != null) {
            	medias.addAll(Arrays.asList(selectedMedias));
            }

            newForum.setMedias(medias);	
        }
    	else if ("image".contains(type)) {
    		Collection<Part> parts = request.getParts(); 
    		
    		for (Part part : parts) {
    	        if (part.getName().equals("picture")) {
    	            String fileName = part.getSubmittedFileName();
    	            if (fileName != null && !fileName.trim().isEmpty()) {
    	            	String fileExtension = "";
    	                int dotIndex = fileName.lastIndexOf('.');
    	                if (dotIndex > 0) {
    	                    fileExtension = fileName.substring(dotIndex);
    	                }

    	                String clearFileName = id + "_" + System.currentTimeMillis() + fileExtension;
    	                String filePath = uploadPath + File.separator + clearFileName;

    	                part.write(filePath);

    	                medias.add(UPLOAD_DIR + "/" + clearFileName);
    	            }
    	        }
    	    }

    		newForum.setMedias(medias);	
    	}
        
        ForumAppService forumAppService = new ForumAppService();
        boolean isSave = false;
        
		isSave = forumAppService.insertForum(newForum);

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


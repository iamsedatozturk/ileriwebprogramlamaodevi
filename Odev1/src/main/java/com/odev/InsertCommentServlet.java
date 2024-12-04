package com.odev;

import com.odev.entities.Users_Comments;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.*;

@SuppressWarnings("serial")
@WebServlet("/InsertCommentServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
			maxFileSize = 1024 * 1024 * 10, // 10MB
			maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class InsertCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String UPLOAD_DIR = "Uploads";
    	
    	UUID id = UUID.randomUUID();
        String userId = request.getParameter("userId");
        String creatorId = request.getParameter("creatorId");
        String type = request.getParameter("type");
        String videoPath = request.getParameter("video");
        String comment = request.getParameter("comment");

        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		String picturePath = "";
		Part part = request.getPart("picture");
		
		if (part != null) {
			String fileName = part.getSubmittedFileName();
			if (fileName != null && !fileName.trim().isEmpty()) {
				String fileExtension = "";
				int dotIndex = fileName.lastIndexOf('.');
				if (dotIndex > 0) {
					fileExtension = fileName.substring(dotIndex);
				}

				String sanitizedFileName = id + fileExtension;
				String filePath = uploadPath + File.separator + sanitizedFileName;

				part.write(filePath);
				picturePath = UPLOAD_DIR + "/" + sanitizedFileName;
			}
		}

        Users_Comments newComment = new Users_Comments();
        newComment.setId(id);
        newComment.setUserId(UUID.fromString(userId));
        newComment.setCreatorId(UUID.fromString(creatorId));
        newComment.setType(type);
        if (type.equals("image"))
        {
        	newComment.setMedia(picturePath);
        }
        else 
        {
        	newComment.setMedia(videoPath);
        }
        newComment.setComment(comment);
        
        UsersCommentsAppService commentAppService = new UsersCommentsAppService();
        boolean isSave = false;
        
		isSave = commentAppService.insertComment(newComment);

        if (isSave) {
            response.sendRedirect("User.jsp?Id=" + userId);
        } else {
        	response.sendRedirect("Error.jsp");
        }
    }
}


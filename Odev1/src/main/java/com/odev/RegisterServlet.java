package com.odev;

import com.odev.entities.Users;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.*;

@SuppressWarnings("serial")
@WebServlet("/RegisterServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
			maxFileSize = 1024 * 1024 * 10, // 10MB
			maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String UPLOAD_DIR = "Uploads";
    	
    	
    	UUID id = UUID.randomUUID();
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String city = request.getParameter("city");
        String address = request.getParameter("address");
        String schoolName = request.getParameter("schoolName");
        String business = request.getParameter("business");
        String webSite = request.getParameter("webSite");
        String facebookName = request.getParameter("facebookName");
        String twitterName = request.getParameter("twitterName");
        String gender = request.getParameter("gender");
        String role = "User";

        List<String> hobbies = new ArrayList<>();
        String[] selectedHobbies = request.getParameterValues("hobbies");
        if (selectedHobbies != null) {
            hobbies.addAll(Arrays.asList(selectedHobbies));
        }
        
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

        Users newUser = new Users();
        newUser.setId(id);
        newUser.setEmail(email);
        newUser.setName(name);
        newUser.setPassword(password);
        newUser.setPhone(phone);
        newUser.setCity(city);
        newUser.setAddress(address);
        newUser.setSchoolName(schoolName);
        newUser.setBusiness(business);
        newUser.setWebSite(webSite);
        newUser.setFacebookName(facebookName);
        newUser.setTwitterName(twitterName);
        newUser.setGender(Integer.parseInt(gender));
        newUser.setRole(role);
        newUser.setPicture(picturePath);
        newUser.setHobbies(hobbies);
        
        UsersAppService userAppService = new UsersAppService();
        boolean isRegistered = false;
        
		try {
			isRegistered = userAppService.registerUser(newUser);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

        if (isRegistered) {
            response.sendRedirect("Login.jsp");
        } else {
        	response.sendRedirect("Error.jsp");
        }
    }
}


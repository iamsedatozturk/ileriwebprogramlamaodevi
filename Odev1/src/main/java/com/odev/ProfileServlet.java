package com.odev;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import com.odev.entities.User;

@SuppressWarnings("serial")
@WebServlet("/UpdateProfileServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class ProfileServlet extends HttpServlet {
	String UPLOAD_DIR = "Uploads";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String city = request.getParameter("city");
		String password = request.getParameter("password");
		String linkName = request.getParameter("linkName");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String schoolName = request.getParameter("schoolName");
		String business = request.getParameter("business");
		String webSite = request.getParameter("webSite");
		String facebookName = request.getParameter("facebookName");
		String twitterName = request.getParameter("twitterName");
		String role = request.getParameter("role");
		Integer gender = Integer.parseInt(request.getParameter("gender"));

		String[] hobbiesArray = request.getParameterValues("hobies");
		List<String> hobbies = hobbiesArray != null ? Arrays.asList(hobbiesArray) : null;

		String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		boolean isFileUploaded = false;
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
				isFileUploaded = true;

				picturePath = UPLOAD_DIR + "/" + sanitizedFileName;
			}
		}

		User user = new User();
		user.setId(UUID.fromString(id));
		user.setEmail(email);
		user.setName(name);
		user.setCity(city);
		user.setPassword(password);
		user.setLinkName(linkName);
		user.setAddress(address);
		user.setPhone(phone);
		user.setSchoolName(schoolName);
		user.setBusiness(business);
		user.setWebSite(webSite);
		user.setFacebookName(facebookName);
		user.setTwitterName(twitterName);
		user.setRole(role);
		user.setGender(gender);
		user.setHobbies(hobbies);
		
		HttpSession mySession = request.getSession();
		if (isFileUploaded) {
			user.setPicture(picturePath);
		}
		else
		{
			Object sessionUser = mySession.getAttribute("user");
			if (sessionUser instanceof User) {
				user.setPicture(((User) sessionUser).getPicture());
			}
		}

		UserAppService userAppService = new UserAppService();
		boolean isSave = userAppService.updateProfile(user);

		if (isSave) {
			mySession.setAttribute("user", user);

			response.sendRedirect("Profile.jsp");
		} else {
			response.sendRedirect("Error.jsp?error=true");
		}
	}
}

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

import com.odev.entities.Users;

@SuppressWarnings("serial")
@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");

		UsersAppService userAppService = new UsersAppService();
		boolean isSave = userAppService.updateAdminRoleAl(UUID.fromString(id));

		if (isSave) {
			response.sendRedirect("User.jsp?Id=" + id);
		} else {
			response.sendRedirect("Error.jsp?error=true");
		}
	}
}

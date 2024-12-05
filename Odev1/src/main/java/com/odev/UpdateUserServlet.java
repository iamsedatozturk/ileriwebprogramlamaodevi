package com.odev;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.UUID;

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

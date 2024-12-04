package com.odev;

import java.io.IOException;
import java.sql.SQLException;

import com.odev.entities.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		UsersAppService userAppService = new UsersAppService();
		Users user = new Users();

		try {
			user = userAppService.validateUser(username, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (user != null) {
			HttpSession mySession = request.getSession();

			mySession.setAttribute("user", user);
			mySession.setAttribute("loginTime", new java.util.Date());

			response.sendRedirect("MainPage.jsp");
		} else {
			response.sendRedirect("Login_Error.html");
		}
	}
}
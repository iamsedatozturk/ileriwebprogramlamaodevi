package com.odev;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.odev.entities.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
@SuppressWarnings("serial")
@WebServlet("/Users")
public class UserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserAppService userAppService = new UserAppService();
        try {
            List<User> users = userAppService.getAllUsers();
            request.setAttribute("users", users);
            request.getRequestDispatcher("/Users.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Veritabanına bağlanırken bir hata oluştu: " + e.getMessage());
        } catch (ClassNotFoundException e) {
			e.printStackTrace();
            response.getWriter().write("JDBC Sürücüsü bulunamadı: " + e.getMessage());
		}
    }
}
*/

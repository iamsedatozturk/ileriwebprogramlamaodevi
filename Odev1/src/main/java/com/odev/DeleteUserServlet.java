package com.odev;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.*;

@SuppressWarnings("serial")
@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String id = request.getParameter("id");

    	UsersAppService userAppService = new UsersAppService();
        boolean isSave = false;
        
		isSave = userAppService.deleteUser(UUID.fromString(id));

        if (isSave) {
            response.sendRedirect("Users.jsp");
        } else {
        	response.sendRedirect("Error.jsp");
        }
    }
}


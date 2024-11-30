<%@page import="com.odev.session.SessionManager"%>
<%@page import="com.odev.UserAppService"%>
<%@ page import="java.util.*, java.sql.*" %>
<%@ page import="com.odev.entities.User" %>
<%@ page import="com.odev.entities.User" %>

<%
	UserAppService userAppService = new UserAppService();
	List<User> users = userAppService.getAllUsers();
    //List<User> users = (List<User>) request.getAttribute("users");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Users List</title>
</head>
<body>
    <h2>Users List</h2>
    <div><% SessionManager.getAttribute("username"); %></div>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Email</th>
                <th>Name</th>
                <th>Gender</th>
                <th>City</th>
            </tr>
        </thead>
        <tbody>
            <% for (User user : users) { %>
            <tr>
                <td><%= user.getId() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getName() %></td>
                <td><%= user.getGender() %></td>
                <td><%= user.getCity() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>

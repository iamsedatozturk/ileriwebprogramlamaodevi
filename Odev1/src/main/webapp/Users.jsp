<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.odev.UserAppService"%>
<%@ page import="java.util.*, java.sql.*"%>
<%@ page import="com.odev.entities.User"%>

<%@ include file="./IsCheckLogin.jsp"%>

<%
UserAppService userAppService = new UserAppService();
List<User> users = userAppService.getAllUsers();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Kullanıcı Listesi</title>
<link rel="stylesheet" type="text/css" href="./Css/styles.css">
</head>
<body>
	<jsp:include page="./Header.jsp"></jsp:include>
	<div class="layout">
		<main class="content" >
			<table border="1">
				<thead>
					<tr>
						<th>ID</th>
						<th>Email</th>
						<th>Name</th>
						<th>Gender</th>
						<th>City</th>
						<th>Phone</th>
						<th>School Name</th>
						<th>Business</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (User user : users) {
					%>
					<tr>
						<td><%=user.getId()%></td>
						<td><%=user.getEmail()%></td>
						<td><%=user.getName()%></td>
						<td><%=user.getGender()%></td>
						<td><%=user.getCity()%></td>
						<td><%=user.getPhone()%></td>
						<td><%=user.getSchoolName()%></td>
						<td><%=user.getBusiness()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</main>
	</div>
</body>
</html>

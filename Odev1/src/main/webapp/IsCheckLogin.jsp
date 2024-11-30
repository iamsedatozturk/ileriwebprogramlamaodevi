<%@ page import="com.odev.entities.User"%>

<%
HttpSession mySession = request.getSession();
User login = new User();

Object sessionUser = mySession.getAttribute("user");
if (sessionUser instanceof User) {
	login = (User) sessionUser;
}

if (login.getId() == null) {
	response.sendRedirect("./Login.jsp");
	return;
}
%>
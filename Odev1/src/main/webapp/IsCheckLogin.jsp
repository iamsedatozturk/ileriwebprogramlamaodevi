<%@ page import="com.odev.entities.Users"%>

<%
HttpSession mySession = request.getSession();
Users login = new Users();

Object sessionUser = mySession.getAttribute("user");
if (sessionUser instanceof Users) {
	login = (Users) sessionUser;
}

if (login.getName() == null) {
	response.sendRedirect("./Login.jsp");
	return;
}
%>
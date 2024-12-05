<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.odev.entities.Users"%>

<%
HttpSession mySession = request.getSession();
Users login = new Users();

Object sessionUser = mySession.getAttribute("user");
if (sessionUser instanceof Users) {
	login = (Users) sessionUser;
}
%>
<header>
	<div class="title">Mezunlar Platformu</div>

	<nav>
		<ul>
			<li><a href="./MainPage.jsp" class="menu-item menu-item-left">Ana Sayfa</a></li>
			<li><a href="./Users.jsp" class="menu-item">Kişiler</a></li>
			<li><a href="./Forums.jsp" class="menu-item">Forum</a></li>
			<li><a href="./Images.jsp" class="menu-item">Fotoğraflar</a></li>
			<li><a href="./Videos.jsp" class="menu-item">Videolar</a></li>
			<li><a href="./Map.jsp" class="menu-item">Harita</a></li>
		</ul>
	</nav>

	<div class="user-info">
		<a href="./Profile.jsp"><%=login.getEmail()%></a>
		<a href="./Logout.jsp">Çıkış Yap</a>
	</div>
</header>
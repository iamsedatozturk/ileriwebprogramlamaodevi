<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.odev.entities.User"%>

<%
HttpSession mySession = request.getSession();
User login = new User();

Object sessionUser = mySession.getAttribute("user");
if (sessionUser instanceof User) {
	login = (User) sessionUser;
}
%>
<header>
	<div class="title">Mezunlar Platformu</div>

	<nav>
		<ul>
			<li><a href="./MainPage.jsp" class="menu-item menu-item-left">Ana Sayfa</a></li>
			<li><a href="./Users.jsp" class="menu-item">Kişiler</a></li>
			<li><a href="./Forum.jsp" class="menu-item">Forum</a></li>
			<li><a href="./Fotograflar.jsp" class="menu-item">Fotoğraflar</a></li>
			<li><a href="./Videolar.jsp" class="menu-item">Videolar</a></li>
			<li><a href="./Harita.jsp" class="menu-item">Harita</a></li>
		</ul>
	</nav>

	<div class="user-info">
		<a href="./Profile.jsp"><%=login.getEmail()%></a>
		<a href="./Logout.jsp">Çıkış Yap</a>
	</div>
</header>
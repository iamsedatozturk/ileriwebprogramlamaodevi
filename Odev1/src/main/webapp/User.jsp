<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.odev.entities.User"%>
<%@ page import="com.odev.UserAppService"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>

<%@ include file="./IsCheckLogin.jsp"%>

<%
String id = request.getParameter("Id") != "" ? request.getParameter("Id") : "";
User user = null;
UserAppService userAppService = new UserAppService();
user = userAppService.getUser(id);
%>

<!DOCTYPE html>
<html lang="tr">
<head>
<meta charset="UTF-8">
<title>Kişi</title>
<link rel="stylesheet" type="text/css" href="./Css/styles.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
	<jsp:include page="./Header.jsp"></jsp:include>
	<div class="toolbar">
		<a href="Users.jsp" class="user_back-button"> <i
			class="fa fa-arrow-left"></i>
		</a>
	</div>
	<div class="user_layout">
		<main class="user_content">
			<div class="profile-section">
				<div class="profile-image-container">
					<div>
						<img
							src="<%=user.getPicture() != null ? user.getPicture() : "./Images/default-profile.png"%>"
							alt="Profil Resmi" class="profile-image" />
					</div>
				</div>

				<div class="user_info">
					<div>
						<label for="name">Adı Soyadı:</label> <span><%=user.getName()%></span>
					</div>

					<div>
						<label for="email">Email Adresi:</label> <span><%=user.getEmail()%></span>
					</div>

					<div>
						<label for="phone">Telefon No:</label> <span><%=user.getPhone()%></span>
					</div>

					<div>
						<label for="role">Rol:</label> <span><%=user.getRole()%></span>
					</div>

					<div>
						<label for="city">Şehir:</label> <span><%=user.getCity()%></span>
					</div>

					<div>
						<label for="address">Adres:</label> <span><%=user.getAddress()%></span>
					</div>

					<div>
						<label for="schoolName">Okul Adı:</label> <span><%=user.getSchoolName()%></span>
					</div>

					<div>
						<label for="business">İş:</label> <span><%=user.getBusiness()%></span>
					</div>

					<div>
						<label for="webSite">Web Sitesi:</label> <span><%=user.getWebSite()%></span>
					</div>

					<div>
						<label for="facebookName">Facebook:</label> <span><%=user.getFacebookName()%></span>
					</div>

					<div>
						<label for="twitterName">Twitter:</label> <span><%=user.getTwitterName()%></span>
					</div>

					<div>
						<label for="gender">Cinsiyet:</label> <span><%=user.getGender() == 0 ? "Erkek" : "Kadın"%></span>
					</div>

					<div>
						<label for="hobbies">Hobiler:</label>
						<%
						List<String> hobbies = user.getHobbies();

						if (hobbies != null && !hobbies.isEmpty()) {
							String hobbiesString = String.join(", ", hobbies); // Virgülle ayır
							out.print("<span>" + hobbiesString + "</span>");
						} else {
							out.print("<span>Hobi bulunmamaktadır.</span>");
						}
						%>
					</div>
				</div>

				<div class="user_comments-info">
					<h3>Ekstra Bilgiler</h3>
					<ul>
						<li>Ekstra 1</li>
						<li>Ekstra 2</li>
						<li>Ekstra 3</li>
					</ul>
				</div>
			</div>
		</main>
	</div>
</body>
</html>

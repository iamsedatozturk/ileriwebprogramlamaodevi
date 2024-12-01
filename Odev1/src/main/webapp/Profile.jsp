<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.odev.entities.User"%>

<%
HttpSession mySession = request.getSession();
User user = new User();

Object sessionUser = mySession.getAttribute("user");
if (sessionUser instanceof User) {
	user = (User) sessionUser;
}

if (user.getName() == null) {
	response.sendRedirect("./Login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profil</title>
<link rel="stylesheet" type="text/css" href="./Css/styles.css">
</head>
<body>
	<jsp:include page="./Header.jsp"></jsp:include>
	<div class="layout">
		<main class="content">
			<img
				src="<%=user.getPicture() != null ? user.getPicture() : "./Images/default-profile.png"%>"
				alt="Profil Resmi"
				style="width: 150px; height: 150px; border-radius: 50%; margin-bottom: 20px;" />

			<form action="ProfileUploadServlet" method="POST"
				enctype="multipart/form-data">
				<input type="file" id="picture" name="picture" accept="image/*">
				
				<input type="hidden" id="id" name="id" value="<%=user.getId()%>" />
				
				<button type="submit">Resmi Yükle</button>
			</form>

			<form action="UpdateProfileServlet" method="post">
				<%
				if (user != null) {
				%>


				<input type="hidden" id="id" name="id" value="<%=user.getId()%>" />

				<label for="name">Adı Soyadı:</label> <input type="text" id="name"
					name="name" value="<%=user.getName()%>" required /> <label
					for="email">Email Adresi:</label> <input type="email" id="email"
					name="email" value="<%=user.getEmail()%>" required /> <label
					for="password">Parola:</label> <input type="password" id="password"
					name="password" value="<%=user.getPassword()%>" required /> <label
					for="phone">Telefon No:</label> <input type="text" id="phone"
					name="phone" value="<%=user.getPhone()%>" /> <label for="city">Şehir:</label>
				<input type="text" id="city" name="city" value="<%=user.getCity()%>" />

				<label for="address">Adres:</label> <input type="text" id="address"
					name="address" value="<%=user.getAddress()%>" /> <label
					for="schoolName">Okul Adı:</label> <input type="text"
					id="schoolName" name="schoolName" value="<%=user.getSchoolName()%>" />

				<label for="business">İş:</label> <input type="text" id="business"
					name="business" value="<%=user.getBusiness()%>" /> <label
					for="hobies">Hobiler:</label>
				<div>
					<input type="checkbox" id="hobby1" name="hobies" value="Okuma"
						<%=user.getHobbies() != null && user.getHobbies().contains("Okuma") ? "checked" : ""%> />
					<label for="hobby1">Okuma</label> <input type="checkbox"
						id="hobby2" name="hobies" value="Seyahat"
						<%=user.getHobbies() != null && user.getHobbies().contains("Seyahat") ? "checked" : ""%> />
					<label for="hobby2">Seyahat</label> <input type="checkbox"
						id="hobby3" name="hobies" value="Yemek"
						<%=user.getHobbies() != null && user.getHobbies().contains("Yemek") ? "checked" : ""%> />
					<label for="hobby3">Yemek</label> <input type="checkbox"
						id="hobby4" name="hobies" value="Bahçecilik"
						<%=user.getHobbies() != null && user.getHobbies().contains("Bahçecilik") ? "checked" : ""%> />
					<label for="hobby4">Bahçecilik</label> <input type="checkbox"
						id="hobby5" name="hobies" value="Fotoğrafçılık"
						<%=user.getHobbies() != null && user.getHobbies().contains("Fotoğrafçılık") ? "checked" : ""%> />
					<label for="hobby5">Fotoğrafçılık</label> <input type="checkbox"
						id="hobby6" name="hobies" value="Resim"
						<%=user.getHobbies() != null && user.getHobbies().contains("Resim") ? "checked" : ""%> />
					<label for="hobby6">Resim</label> <input type="checkbox"
						id="hobby7" name="hobies" value="Yazı"
						<%=user.getHobbies() != null && user.getHobbies().contains("Yazı") ? "checked" : ""%> />
					<label for="hobby7">Yazı</label> <input type="checkbox" id="hobby8"
						name="hobies" value="Spor"
						<%=user.getHobbies() != null && user.getHobbies().contains("Spor") ? "checked" : ""%> />
					<label for="hobby8">Spor</label> <input type="checkbox" id="hobby9"
						name="hobies" value="Müzik"
						<%=user.getHobbies() != null && user.getHobbies().contains("Müzik") ? "checked" : ""%> />
					<label for="hobby9">Müzik</label> <input type="checkbox"
						id="hobby10" name="hobies" value="Video Oyunları"
						<%=user.getHobbies() != null && user.getHobbies().contains("Video Oyunları") ? "checked" : ""%> />
					<label for="hobby10">Video Oyunları</label>
				</div>

				<label for="webSite">Web Sitesi:</label> <input type="text"
					id="webSite" name="webSite" value="<%=user.getWebSite()%>" /> <label
					for="facebookName">Facebook:</label> <input type="text"
					id="facebookName" name="facebookName"
					value="<%=user.getFacebookName()%>" /> <label for="twitterName">Twitter:</label>
				<input type="text" id="twitterName" name="twitterName"
					value="<%=user.getTwitterName()%>" /> <label for="role">Rol:</label>
				<select id="role" name="role">
					<option value="Admin"
						<%="Admin".equals(user.getRole()) ? "selected" : ""%>>Admin</option>
					<option value="User"
						<%="User".equals(user.getRole()) ? "selected" : ""%>>User</option>
				</select> <label for="gender">Cinsiyet:</label>
				<div>
					<input type="radio" id="male" name="gender" value="0"
						<%=user.getGender() == 0 ? "checked" : ""%> /> <label for="erkek">Erkek</label>
					<input type="radio" id="female" name="gender" value="1"
						<%=user.getGender() == 1 ? "checked" : ""%> /> <label for="kadin">Kadın</label>
				</div>
				<button type="submit">Kaydet</button>
				<%
				}
				%>
			</form>

		</main>
	</div>
</body>
</html>

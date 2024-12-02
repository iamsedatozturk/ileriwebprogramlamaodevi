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

			<form action="UpdateProfileServlet" method="POST" enctype="multipart/form-data">
				<%
				if (user != null) {
				%>

				<input type="hidden" id="id" name="id" value="<%=user.getId()%>" />

				<input type="file" id="picture" name="picture" accept="image/*">

				<label for="name">Adı Soyadı:</label> <input type="text" id="name"
					name="name" value="<%=user.getName()%>" required /> <label
					for="email">Email Adresi:</label> <input type="email" id="email"
					name="email" value="<%=user.getEmail()%>" required /> <label
					for="password">Parola:</label> <input type="password" id="password"
					name="password" value="<%=user.getPassword()%>" required /> <label
					for="phone">Telefon No:</label> <input type="text" id="phone"
					name="phone" value="<%=user.getPhone()%>" /> 
					
					
				<label for="city">Şehir:</label>
				<select id="city" name="city" required>
				    <option value="">Şehir Seçin</option>
				    <option value="Adana" <%= "Adana".equals(user.getCity()) ? "selected" : "" %>>Adana</option>
				    <option value="Adıyaman" <%= "Adıyaman".equals(user.getCity()) ? "selected" : "" %>>Adıyaman</option>
				    <option value="Afyonkarahisar" <%= "Afyonkarahisar".equals(user.getCity()) ? "selected" : "" %>>Afyonkarahisar</option>
				    <option value="Ağrı" <%= "Ağrı".equals(user.getCity()) ? "selected" : "" %>>Ağrı</option>
				    <option value="Aksaray" <%= "Aksaray".equals(user.getCity()) ? "selected" : "" %>>Aksaray</option>
				    <option value="Amasya" <%= "Amasya".equals(user.getCity()) ? "selected" : "" %>>Amasya</option>
				    <option value="Ankara" <%= "Ankara".equals(user.getCity()) ? "selected" : "" %>>Ankara</option>
				    <option value="Antalya" <%= "Antalya".equals(user.getCity()) ? "selected" : "" %>>Antalya</option>
				    <option value="Artvin" <%= "Artvin".equals(user.getCity()) ? "selected" : "" %>>Artvin</option>
				    <option value="Aydın" <%= "Aydın".equals(user.getCity()) ? "selected" : "" %>>Aydın</option>
				    <option value="Balıkesir" <%= "Balıkesir".equals(user.getCity()) ? "selected" : "" %>>Balıkesir</option>
				    <option value="Bartın" <%= "Bartın".equals(user.getCity()) ? "selected" : "" %>>Bartın</option>
				    <option value="Batman" <%= "Batman".equals(user.getCity()) ? "selected" : "" %>>Batman</option>
				    <option value="Bayburt" <%= "Bayburt".equals(user.getCity()) ? "selected" : "" %>>Bayburt</option>
				    <option value="Bilecik" <%= "Bilecik".equals(user.getCity()) ? "selected" : "" %>>Bilecik</option>
				    <option value="Bingöl" <%= "Bingöl".equals(user.getCity()) ? "selected" : "" %>>Bingöl</option>
				    <option value="Bitlis" <%= "Bitlis".equals(user.getCity()) ? "selected" : "" %>>Bitlis</option>
				    <option value="Bolu" <%= "Bolu".equals(user.getCity()) ? "selected" : "" %>>Bolu</option>
				    <option value="Burdur" <%= "Burdur".equals(user.getCity()) ? "selected" : "" %>>Burdur</option>
				    <option value="Bursa" <%= "Bursa".equals(user.getCity()) ? "selected" : "" %>>Bursa</option>
				    <option value="Çanakkale" <%= "Çanakkale".equals(user.getCity()) ? "selected" : "" %>>Çanakkale</option>
				    <option value="Çorum" <%= "Çorum".equals(user.getCity()) ? "selected" : "" %>>Çorum</option>
				    <option value="Denizli" <%= "Denizli".equals(user.getCity()) ? "selected" : "" %>>Denizli</option>
				    <option value="Diyarbakır" <%= "Diyarbakır".equals(user.getCity()) ? "selected" : "" %>>Diyarbakır</option>
				    <option value="Düzce" <%= "Düzce".equals(user.getCity()) ? "selected" : "" %>>Düzce</option>
				    <option value="Edirne" <%= "Edirne".equals(user.getCity()) ? "selected" : "" %>>Edirne</option>
				    <option value="Elazığ" <%= "Elazığ".equals(user.getCity()) ? "selected" : "" %>>Elazığ</option>
				    <option value="Erzincan" <%= "Erzincan".equals(user.getCity()) ? "selected" : "" %>>Erzincan</option>
				    <option value="Erzurum" <%= "Erzurum".equals(user.getCity()) ? "selected" : "" %>>Erzurum</option>
				    <option value="Eskişehir" <%= "Eskişehir".equals(user.getCity()) ? "selected" : "" %>>Eskişehir</option>
				    <option value="Gaziantep" <%= "Gaziantep".equals(user.getCity()) ? "selected" : "" %>>Gaziantep</option>
				    <option value="Giresun" <%= "Giresun".equals(user.getCity()) ? "selected" : "" %>>Giresun</option>
				    <option value="Gümüşhane" <%= "Gümüşhane".equals(user.getCity()) ? "selected" : "" %>>Gümüşhane</option>
				    <option value="Hakkari" <%= "Hakkari".equals(user.getCity()) ? "selected" : "" %>>Hakkari</option>
				    <option value="Hatay" <%= "Hatay".equals(user.getCity()) ? "selected" : "" %>>Hatay</option>
				    <option value="Iğdır" <%= "Iğdır".equals(user.getCity()) ? "selected" : "" %>>Iğdır</option>
				    <option value="Isparta" <%= "Isparta".equals(user.getCity()) ? "selected" : "" %>>Isparta</option>
				    <option value="İstanbul" <%= "İstanbul".equals(user.getCity()) ? "selected" : "" %>>İstanbul</option>
				    <option value="İzmir" <%= "İzmir".equals(user.getCity()) ? "selected" : "" %>>İzmir</option>
				    <option value="Kahramanmaraş" <%= "Kahramanmaraş".equals(user.getCity()) ? "selected" : "" %>>Kahramanmaraş</option>
				    <option value="Karabük" <%= "Karabük".equals(user.getCity()) ? "selected" : "" %>>Karabük</option>
				    <option value="Karaman" <%= "Karaman".equals(user.getCity()) ? "selected" : "" %>>Karaman</option>
				    <option value="Kastamonu" <%= "Kastamonu".equals(user.getCity()) ? "selected" : "" %>>Kastamonu</option>
				    <option value="Kayseri" <%= "Kayseri".equals(user.getCity()) ? "selected" : "" %>>Kayseri</option>
				    <option value="Kırıkkale" <%= "Kırıkkale".equals(user.getCity()) ? "selected" : "" %>>Kırıkkale</option>
				    <option value="Kırklareli" <%= "Kırklareli".equals(user.getCity()) ? "selected" : "" %>>Kırklareli</option>
				    <option value="Kocaeli" <%= "Kocaeli".equals(user.getCity()) ? "selected" : "" %>>Kocaeli</option>
				    <option value="Konya" <%= "Konya".equals(user.getCity()) ? "selected" : "" %>>Konya</option>
				    <option value="Kütahya" <%= "Kütahya".equals(user.getCity()) ? "selected" : "" %>>Kütahya</option>
				    <option value="Malatya" <%= "Malatya".equals(user.getCity()) ? "selected" : "" %>>Malatya</option>
				    <option value="Manisa" <%= "Manisa".equals(user.getCity()) ? "selected" : "" %>>Manisa</option>
				    <option value="Mardin" <%= "Mardin".equals(user.getCity()) ? "selected" : "" %>>Mardin</option>
				    <option value="Mersin" <%= "Mersin".equals(user.getCity()) ? "selected" : "" %>>Mersin</option>
				    <option value="Muğla" <%= "Muğla".equals(user.getCity()) ? "selected" : "" %>>Muğla</option>
				    <option value="Muş" <%= "Muş".equals(user.getCity()) ? "selected" : "" %>>Muş</option>
				    <option value="Nevşehir" <%= "Nevşehir".equals(user.getCity()) ? "selected" : "" %>>Nevşehir</option>
				    <option value="Niğde" <%= "Niğde".equals(user.getCity()) ? "selected" : "" %>>Niğde</option>
				    <option value="Ordu" <%= "Ordu".equals(user.getCity()) ? "selected" : "" %>>Ordu</option>
				    <option value="Osmaniye" <%= "Osmaniye".equals(user.getCity()) ? "selected" : "" %>>Osmaniye</option>
				    <option value="Rize" <%= "Rize".equals(user.getCity()) ? "selected" : "" %>>Rize</option>
				    <option value="Sakarya" <%= "Sakarya".equals(user.getCity()) ? "selected" : "" %>>Sakarya</option>
				    <option value="Samsun" <%= "Samsun".equals(user.getCity()) ? "selected" : "" %>>Samsun</option>
				    <option value="Siirt" <%= "Siirt".equals(user.getCity()) ? "selected" : "" %>>Siirt</option>
				    <option value="Sinop" <%= "Sinop".equals(user.getCity()) ? "selected" : "" %>>Sinop</option>
				    <option value="Şanlıurfa" <%= "Şanlıurfa".equals(user.getCity()) ? "selected" : "" %>>Şanlıurfa</option>
				    <option value="Sivas" <%= "Sivas".equals(user.getCity()) ? "selected" : "" %>>Sivas</option>
				    <option value="Tekirdağ" <%= "Tekirdağ".equals(user.getCity()) ? "selected" : "" %>>Tekirdağ</option>
				    <option value="Tokat" <%= "Tokat".equals(user.getCity()) ? "selected" : "" %>>Tokat</option>
				    <option value="Trabzon" <%= "Trabzon".equals(user.getCity()) ? "selected" : "" %>>Trabzon</option>
				    <option value="Tunceli" <%= "Tunceli".equals(user.getCity()) ? "selected" : "" %>>Tunceli</option>
				    <option value="Uşak" <%= "Uşak".equals(user.getCity()) ? "selected" : "" %>>Uşak</option>
				    <option value="Van" <%= "Van".equals(user.getCity()) ? "selected" : "" %>>Van</option>
				    <option value="Yalova" <%= "Yalova".equals(user.getCity()) ? "selected" : "" %>>Yalova</option>
				    <option value="Yozgat" <%= "Yozgat".equals(user.getCity()) ? "selected" : "" %>>Yozgat</option>
				    <option value="Zonguldak" <%= "Zonguldak".equals(user.getCity()) ? "selected" : "" %>>Zonguldak</option>
				</select>
				
				

				<label for="address">Adres:</label> 
				<textarea id="address" name="address" rows="4" cols="50" placeholder="Adresinizi girin"><%= user.getAddress() %></textarea>					
				
				<label
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
				</select> 
				
				
				<label for="gender">Cinsiyet:</label>
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

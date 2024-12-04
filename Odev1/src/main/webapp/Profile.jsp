<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.odev.entities.Users"%>

<%
HttpSession mySession = request.getSession();
Users profile = new Users();

Object sessionProfile = mySession.getAttribute("user");
if (sessionProfile instanceof Users) {
	profile = (Users) sessionProfile;
}

if (profile.getName() == null) {
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
				src="<%=profile.getPicture().length() > 0 ? profile.getPicture() : "./Images/default-profile.png"%>"
				alt="Profil Resmi"
				style="width: 150px; height: 150px; border-radius: 50%; margin-bottom: 20px;" />

			<form action="UpdateProfileServlet" method="POST" enctype="multipart/form-data">
				<%
				if (profile != null) {
				%>

				<input type="hidden" id="id" name="id" value="<%=profile.getId()%>" />

				<input type="file" id="picture" name="picture" accept="image/*">

				<label for="name">Adı Soyadı:</label> <input type="text" id="name"
					name="name" value="<%=profile.getName()%>" required /> <label
					for="email">Email Adresi:</label> <input type="email" id="email"
					name="email" value="<%=profile.getEmail()%>" required /> <label
					for="password">Parola:</label> <input type="password" id="password"
					name="password" value="<%=profile.getPassword()%>" required /> <label
					for="phone">Telefon No:</label> <input type="text" id="phone"
					name="phone" value="<%=profile.getPhone()%>" /> 
					
					
				<label for="city">Şehir:</label>
				<select id="city" name="city" required>
				    <option value="">Şehir Seçin</option>
				    <option value="Adana" <%= "Adana".equals(profile.getCity()) ? "selected" : "" %>>Adana</option>
				    <option value="Adıyaman" <%= "Adıyaman".equals(profile.getCity()) ? "selected" : "" %>>Adıyaman</option>
				    <option value="Afyonkarahisar" <%= "Afyonkarahisar".equals(profile.getCity()) ? "selected" : "" %>>Afyonkarahisar</option>
				    <option value="Ağrı" <%= "Ağrı".equals(profile.getCity()) ? "selected" : "" %>>Ağrı</option>
				    <option value="Aksaray" <%= "Aksaray".equals(profile.getCity()) ? "selected" : "" %>>Aksaray</option>
				    <option value="Amasya" <%= "Amasya".equals(profile.getCity()) ? "selected" : "" %>>Amasya</option>
				    <option value="Ankara" <%= "Ankara".equals(profile.getCity()) ? "selected" : "" %>>Ankara</option>
				    <option value="Antalya" <%= "Antalya".equals(profile.getCity()) ? "selected" : "" %>>Antalya</option>
				    <option value="Artvin" <%= "Artvin".equals(profile.getCity()) ? "selected" : "" %>>Artvin</option>
				    <option value="Aydın" <%= "Aydın".equals(profile.getCity()) ? "selected" : "" %>>Aydın</option>
				    <option value="Balıkesir" <%= "Balıkesir".equals(profile.getCity()) ? "selected" : "" %>>Balıkesir</option>
				    <option value="Bartın" <%= "Bartın".equals(profile.getCity()) ? "selected" : "" %>>Bartın</option>
				    <option value="Batman" <%= "Batman".equals(profile.getCity()) ? "selected" : "" %>>Batman</option>
				    <option value="Bayburt" <%= "Bayburt".equals(profile.getCity()) ? "selected" : "" %>>Bayburt</option>
				    <option value="Bilecik" <%= "Bilecik".equals(profile.getCity()) ? "selected" : "" %>>Bilecik</option>
				    <option value="Bingöl" <%= "Bingöl".equals(profile.getCity()) ? "selected" : "" %>>Bingöl</option>
				    <option value="Bitlis" <%= "Bitlis".equals(profile.getCity()) ? "selected" : "" %>>Bitlis</option>
				    <option value="Bolu" <%= "Bolu".equals(profile.getCity()) ? "selected" : "" %>>Bolu</option>
				    <option value="Burdur" <%= "Burdur".equals(profile.getCity()) ? "selected" : "" %>>Burdur</option>
				    <option value="Bursa" <%= "Bursa".equals(profile.getCity()) ? "selected" : "" %>>Bursa</option>
				    <option value="Çanakkale" <%= "Çanakkale".equals(profile.getCity()) ? "selected" : "" %>>Çanakkale</option>
				    <option value="Çorum" <%= "Çorum".equals(profile.getCity()) ? "selected" : "" %>>Çorum</option>
				    <option value="Denizli" <%= "Denizli".equals(profile.getCity()) ? "selected" : "" %>>Denizli</option>
				    <option value="Diyarbakır" <%= "Diyarbakır".equals(profile.getCity()) ? "selected" : "" %>>Diyarbakır</option>
				    <option value="Düzce" <%= "Düzce".equals(profile.getCity()) ? "selected" : "" %>>Düzce</option>
				    <option value="Edirne" <%= "Edirne".equals(profile.getCity()) ? "selected" : "" %>>Edirne</option>
				    <option value="Elazığ" <%= "Elazığ".equals(profile.getCity()) ? "selected" : "" %>>Elazığ</option>
				    <option value="Erzincan" <%= "Erzincan".equals(profile.getCity()) ? "selected" : "" %>>Erzincan</option>
				    <option value="Erzurum" <%= "Erzurum".equals(profile.getCity()) ? "selected" : "" %>>Erzurum</option>
				    <option value="Eskişehir" <%= "Eskişehir".equals(profile.getCity()) ? "selected" : "" %>>Eskişehir</option>
				    <option value="Gaziantep" <%= "Gaziantep".equals(profile.getCity()) ? "selected" : "" %>>Gaziantep</option>
				    <option value="Giresun" <%= "Giresun".equals(profile.getCity()) ? "selected" : "" %>>Giresun</option>
				    <option value="Gümüşhane" <%= "Gümüşhane".equals(profile.getCity()) ? "selected" : "" %>>Gümüşhane</option>
				    <option value="Hakkari" <%= "Hakkari".equals(profile.getCity()) ? "selected" : "" %>>Hakkari</option>
				    <option value="Hatay" <%= "Hatay".equals(profile.getCity()) ? "selected" : "" %>>Hatay</option>
				    <option value="Iğdır" <%= "Iğdır".equals(profile.getCity()) ? "selected" : "" %>>Iğdır</option>
				    <option value="Isparta" <%= "Isparta".equals(profile.getCity()) ? "selected" : "" %>>Isparta</option>
				    <option value="İstanbul" <%= "İstanbul".equals(profile.getCity()) ? "selected" : "" %>>İstanbul</option>
				    <option value="İzmir" <%= "İzmir".equals(profile.getCity()) ? "selected" : "" %>>İzmir</option>
				    <option value="Kahramanmaraş" <%= "Kahramanmaraş".equals(profile.getCity()) ? "selected" : "" %>>Kahramanmaraş</option>
				    <option value="Karabük" <%= "Karabük".equals(profile.getCity()) ? "selected" : "" %>>Karabük</option>
				    <option value="Karaman" <%= "Karaman".equals(profile.getCity()) ? "selected" : "" %>>Karaman</option>
				    <option value="Kastamonu" <%= "Kastamonu".equals(profile.getCity()) ? "selected" : "" %>>Kastamonu</option>
				    <option value="Kayseri" <%= "Kayseri".equals(profile.getCity()) ? "selected" : "" %>>Kayseri</option>
				    <option value="Kırıkkale" <%= "Kırıkkale".equals(profile.getCity()) ? "selected" : "" %>>Kırıkkale</option>
				    <option value="Kırklareli" <%= "Kırklareli".equals(profile.getCity()) ? "selected" : "" %>>Kırklareli</option>
				    <option value="Kocaeli" <%= "Kocaeli".equals(profile.getCity()) ? "selected" : "" %>>Kocaeli</option>
				    <option value="Konya" <%= "Konya".equals(profile.getCity()) ? "selected" : "" %>>Konya</option>
				    <option value="Kütahya" <%= "Kütahya".equals(profile.getCity()) ? "selected" : "" %>>Kütahya</option>
				    <option value="Malatya" <%= "Malatya".equals(profile.getCity()) ? "selected" : "" %>>Malatya</option>
				    <option value="Manisa" <%= "Manisa".equals(profile.getCity()) ? "selected" : "" %>>Manisa</option>
				    <option value="Mardin" <%= "Mardin".equals(profile.getCity()) ? "selected" : "" %>>Mardin</option>
				    <option value="Mersin" <%= "Mersin".equals(profile.getCity()) ? "selected" : "" %>>Mersin</option>
				    <option value="Muğla" <%= "Muğla".equals(profile.getCity()) ? "selected" : "" %>>Muğla</option>
				    <option value="Muş" <%= "Muş".equals(profile.getCity()) ? "selected" : "" %>>Muş</option>
				    <option value="Nevşehir" <%= "Nevşehir".equals(profile.getCity()) ? "selected" : "" %>>Nevşehir</option>
				    <option value="Niğde" <%= "Niğde".equals(profile.getCity()) ? "selected" : "" %>>Niğde</option>
				    <option value="Ordu" <%= "Ordu".equals(profile.getCity()) ? "selected" : "" %>>Ordu</option>
				    <option value="Osmaniye" <%= "Osmaniye".equals(profile.getCity()) ? "selected" : "" %>>Osmaniye</option>
				    <option value="Rize" <%= "Rize".equals(profile.getCity()) ? "selected" : "" %>>Rize</option>
				    <option value="Sakarya" <%= "Sakarya".equals(profile.getCity()) ? "selected" : "" %>>Sakarya</option>
				    <option value="Samsun" <%= "Samsun".equals(profile.getCity()) ? "selected" : "" %>>Samsun</option>
				    <option value="Siirt" <%= "Siirt".equals(profile.getCity()) ? "selected" : "" %>>Siirt</option>
				    <option value="Sinop" <%= "Sinop".equals(profile.getCity()) ? "selected" : "" %>>Sinop</option>
				    <option value="Şanlıurfa" <%= "Şanlıurfa".equals(profile.getCity()) ? "selected" : "" %>>Şanlıurfa</option>
				    <option value="Sivas" <%= "Sivas".equals(profile.getCity()) ? "selected" : "" %>>Sivas</option>
				    <option value="Tekirdağ" <%= "Tekirdağ".equals(profile.getCity()) ? "selected" : "" %>>Tekirdağ</option>
				    <option value="Tokat" <%= "Tokat".equals(profile.getCity()) ? "selected" : "" %>>Tokat</option>
				    <option value="Trabzon" <%= "Trabzon".equals(profile.getCity()) ? "selected" : "" %>>Trabzon</option>
				    <option value="Tunceli" <%= "Tunceli".equals(profile.getCity()) ? "selected" : "" %>>Tunceli</option>
				    <option value="Uşak" <%= "Uşak".equals(profile.getCity()) ? "selected" : "" %>>Uşak</option>
				    <option value="Van" <%= "Van".equals(profile.getCity()) ? "selected" : "" %>>Van</option>
				    <option value="Yalova" <%= "Yalova".equals(profile.getCity()) ? "selected" : "" %>>Yalova</option>
				    <option value="Yozgat" <%= "Yozgat".equals(profile.getCity()) ? "selected" : "" %>>Yozgat</option>
				    <option value="Zonguldak" <%= "Zonguldak".equals(profile.getCity()) ? "selected" : "" %>>Zonguldak</option>
				</select>
				
				

				<label for="address">Adres:</label> 
				<textarea id="address" name="address" rows="4" cols="50" placeholder="Adresinizi girin"><%= profile.getAddress() %></textarea>					
				
				<label
					for="schoolName">Okul Adı:</label> <input type="text"
					id="schoolName" name="schoolName" value="<%=profile.getSchoolName()%>" />

				<label for="business">İş:</label> <input type="text" id="business"
					name="business" value="<%=profile.getBusiness()%>" /> <label
					for="hobies">Hobiler:</label>
				<div>
					<input type="checkbox" id="hobby1" name="hobies" value="Okuma"
						<%=profile.getHobbies() != null && profile.getHobbies().contains("Okuma") ? "checked" : ""%> />
					<label for="hobby1">Okuma</label> <input type="checkbox"
						id="hobby2" name="hobies" value="Seyahat"
						<%=profile.getHobbies() != null && profile.getHobbies().contains("Seyahat") ? "checked" : ""%> />
					<label for="hobby2">Seyahat</label> <input type="checkbox"
						id="hobby3" name="hobies" value="Yemek"
						<%=profile.getHobbies() != null && profile.getHobbies().contains("Yemek") ? "checked" : ""%> />
					<label for="hobby3">Yemek</label> <input type="checkbox"
						id="hobby4" name="hobies" value="Bahçecilik"
						<%=profile.getHobbies() != null && profile.getHobbies().contains("Bahçecilik") ? "checked" : ""%> />
					<label for="hobby4">Bahçecilik</label> <input type="checkbox"
						id="hobby5" name="hobies" value="Fotoğrafçılık"
						<%=profile.getHobbies() != null && profile.getHobbies().contains("Fotoğrafçılık") ? "checked" : ""%> />
					<label for="hobby5">Fotoğrafçılık</label> <input type="checkbox"
						id="hobby6" name="hobies" value="Resim"
						<%=profile.getHobbies() != null && profile.getHobbies().contains("Resim") ? "checked" : ""%> />
					<label for="hobby6">Resim</label> <input type="checkbox"
						id="hobby7" name="hobies" value="Yazı"
						<%=profile.getHobbies() != null && profile.getHobbies().contains("Yazı") ? "checked" : ""%> />
					<label for="hobby7">Yazı</label> <input type="checkbox" id="hobby8"
						name="hobies" value="Spor"
						<%=profile.getHobbies() != null && profile.getHobbies().contains("Spor") ? "checked" : ""%> />
					<label for="hobby8">Spor</label> <input type="checkbox" id="hobby9"
						name="hobies" value="Müzik"
						<%=profile.getHobbies() != null && profile.getHobbies().contains("Müzik") ? "checked" : ""%> />
					<label for="hobby9">Müzik</label> <input type="checkbox"
						id="hobby10" name="hobies" value="Video Oyunları"
						<%=profile.getHobbies() != null && profile.getHobbies().contains("Video Oyunları") ? "checked" : ""%> />
					<label for="hobby10">Video Oyunları</label>
				</div>

				<label for="webSite">Web Sitesi:</label> <input type="text"
					id="webSite" name="webSite" value="<%=profile.getWebSite()%>" /> <label
					for="facebookName">Facebook:</label> <input type="text"
					id="facebookName" name="facebookName"
					value="<%=profile.getFacebookName()%>" /> <label for="twitterName">Twitter:</label>
				<input type="text" id="twitterName" name="twitterName"
					value="<%=profile.getTwitterName()%>" /> <label for="role">Rol:</label>
					
			
				<select id="role" name="role">
					<option value="Admin"
						<%="Admin".equals(profile.getRole()) ? "selected" : ""%>>Admin</option>
					<option value="User"
						<%="User".equals(profile.getRole()) ? "selected" : ""%>>User</option>
				</select> 
				
				
				<label for="gender">Cinsiyet:</label>
				<div>
					<input type="radio" id="male" name="gender" value="0"
						<%=profile.getGender() == 0 ? "checked" : ""%> /> <label for="erkek">Erkek</label>
					<input type="radio" id="female" name="gender" value="1"
						<%=profile.getGender() == 1 ? "checked" : ""%> /> <label for="kadin">Kadın</label>
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

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.odev.entities.Users"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Kayıt Ol - Sakarya Üniversitesi</title>
<link rel="stylesheet" type="text/css" href="./Css/styles.css">
</head>
<body>
	<div class="register-content">
		<div class="register-container">
			<h1>Kayıt Ol</h1>

			<form action="RegisterServlet" method="POST"
				enctype="multipart/form-data">
				<label for="email">Email Adresi:</label> <input type="email"
					id="email" name="email" required
					placeholder="Email adresinizi girin" /> <label for="name">Ad
					Soyad:</label> <input type="text" id="name" name="name" required
					placeholder="Ad ve Soyadınızı girin" /> <label for="password">Parola:</label>
				<input type="password" id="password" name="password" required
					placeholder="Parolanızı girin" /> <label for="phone">Telefon
					Numarası:</label> <input type="text" id="phone" name="phone"
					placeholder="Telefon numaranızı girin" /> <label for="city">Şehir:</label>
				<select id="city" name="city" required>
					<option value="">Şehir Seçin</option>
					<option value="Adana">Adana</option>
					<option value="Adıyaman">Adıyaman</option>
					<option value="Afyonkarahisar">Afyonkarahisar</option>
					<option value="Ağrı">Ağrı</option>
					<option value="Aksaray">Aksaray</option>
					<option value="Amasya">Amasya</option>
					<option value="Ankara">Ankara</option>
					<option value="Antalya">Antalya</option>
					<option value="Artvin">Artvin</option>
					<option value="Aydın">Aydın</option>
					<option value="Balıkesir">Balıkesir</option>
					<option value="Bartın">Bartın</option>
					<option value="Batman">Batman</option>
					<option value="Bayburt">Bayburt</option>
					<option value="Bilecik">Bilecik</option>
					<option value="Bingöl">Bingöl</option>
					<option value="Bitlis">Bitlis</option>
					<option value="Bolu">Bolu</option>
					<option value="Burdur">Burdur</option>
					<option value="Bursa">Bursa</option>
					<option value="Çanakkale">Çanakkale</option>
					<option value="Çankırı">Çankırı</option>
					<option value="Çorum">Çorum</option>
					<option value="Denizli">Denizli</option>
					<option value="Diyarbakır">Diyarbakır</option>
					<option value="Düzce">Düzce</option>
					<option value="Edirne">Edirne</option>
					<option value="Elazığ">Elazığ</option>
					<option value="Erzincan">Erzincan</option>
					<option value="Erzurum">Erzurum</option>
					<option value="Eskişehir">Eskişehir</option>
					<option value="Gaziantep">Gaziantep</option>
					<option value="Giresun">Giresun</option>
					<option value="Gümüşhane">Gümüşhane</option>
					<option value="Hakkâri">Hakkâri</option>
					<option value="Hatay">Hatay</option>
					<option value="Iğdır">Iğdır</option>
					<option value="Isparta">Isparta</option>
					<option value="İstanbul">İstanbul</option>
					<option value="İzmir">İzmir</option>
					<option value="Kahramanmaraş">Kahramanmaraş</option>
					<option value="Karabük">Karabük</option>
					<option value="Karaman">Karaman</option>
					<option value="Kastamonu">Kastamonu</option>
					<option value="Kayseri">Kayseri</option>
					<option value="Kırıkkale">Kırıkkale</option>
					<option value="Kırklareli">Kırklareli</option>
					<option value="Kırşehir">Kırşehir</option>
					<option value="Kocaeli">Kocaeli</option>
					<option value="Konya">Konya</option>
					<option value="Kütahya">Kütahya</option>
					<option value="Malatya">Malatya</option>
					<option value="Manisa">Manisa</option>
					<option value="Mardin">Mardin</option>
					<option value="Mersin">Mersin</option>
					<option value="Muğla">Muğla</option>
					<option value="Muş">Muş</option>
					<option value="Nevşehir">Nevşehir</option>
					<option value="Niğde">Niğde</option>
					<option value="Ordu">Ordu</option>
					<option value="Osmaniye">Osmaniye</option>
					<option value="Rize">Rize</option>
					<option value="Sakarya">Sakarya</option>
					<option value="Samsun">Samsun</option>
					<option value="Siirt">Siirt</option>
					<option value="Sinop">Sinop</option>
					<option value="Sivas">Sivas</option>
					<option value="Şanlıurfa">Şanlıurfa</option>
					<option value="Şırnak">Şırnak</option>
					<option value="Tekirdağ">Tekirdağ</option>
					<option value="Tokat">Tokat</option>
					<option value="Trabzon">Trabzon</option>
					<option value="Tunceli">Tunceli</option>
					<option value="Uşak">Uşak</option>
					<option value="Van">Van</option>
					<option value="Yalova">Yalova</option>
					<option value="Yozgat">Yozgat</option>
					<option value="Zonguldak">Zonguldak</option>
				</select> <label for="address">Adres:</label>
				<textarea id="address" name="address" rows="4" cols="50"
					placeholder="Adresinizi girin"></textarea>

				<label for="schoolName">Okul Adı:</label> <input type="text"
					id="schoolName" name="schoolName" placeholder="Okul adını girin" />
				<label for="business">İş:</label> <input type="text" id="business"
					name="business" placeholder="Çalıştığınız iş yerini girin" /> <label
					for="webSite">Web Sitesi:</label> <input type="text" id="webSite"
					name="webSite" placeholder="Web sitenizi girin" /> <label
					for="facebookName">Facebook Adı:</label> <input type="text"
					id="facebookName" name="facebookName"
					placeholder="Facebook adınızı girin" /> <label for="twitterName">Twitter
					Adı:</label> <input type="text" id="twitterName" name="twitterName"
					placeholder="Twitter adınızı girin" /> <label for="gender"
					class="divCenter">Cinsiyet:</label>
				<div>
					<input type="radio" id="male" name="gender" value="0" checked  /> 
					<label for="male">Erkek</label> 
					<input type="radio" id="female" name="gender" value="1" /> 
					<label for="female">Kadın</label>
				</div>

				<label for="role">Rol:</label> <select id="role" name="role">
					<option value="User">Kullanıcı</option>
					<option value="Admin">Admin</option>
				</select> <label for="picture">Profil Resmi:</label> <input type="file"
					id="picture" name="picture" accept="image/*" /> <label
					for="hobbies">Hobiler:</label>
				<div class="hobbies">
					<input type="checkbox" id="hobby1" name="hobbies" value="Okuma" />
					<label for="hobby1">Okuma</label> <input type="checkbox"
						id="hobby2" name="hobbies" value="Seyahat" /> <label for="hobby2">Seyahat</label>
					<input type="checkbox" id="hobby3" name="hobbies" value="Yemek" />
					<label for="hobby3">Yemek</label> <input type="checkbox"
						id="hobby4" name="hobbies" value="Bahçecilik" /> <label
						for="hobby4">Bahçecilik</label> <input type="checkbox" id="hobby5"
						name="hobbies" value="Fotoğrafçılık" /> <label for="hobby5">Fotoğrafçılık</label>
					<input type="checkbox" id="hobby6" name="hobbies" value="Resim" />
					<label for="hobby6">Resim</label> <input type="checkbox"
						id="hobby7" name="hobbies" value="Yazı" /> <label for="hobby7">Yazı</label>
					<input type="checkbox" id="hobby8" name="hobbies" value="Spor" />
					<label for="hobby8">Spor</label> <input type="checkbox" id="hobby9"
						name="hobbies" value="Müzik" /> <label for="hobby9">Müzik</label>
					<input type="checkbox" id="hobby10" name="hobbies"
						value="Video Oyunları" /> <label for="hobby10">Video
						Oyunları</label>
				</div>

				<button type="submit">Kaydol</button>
			</form>

			<a href="Login.jsp" class="register-button">Zaten bir hesabınız
				var mı? Giriş Yapın</a>
		</div>
	</div>
</body>
</html>

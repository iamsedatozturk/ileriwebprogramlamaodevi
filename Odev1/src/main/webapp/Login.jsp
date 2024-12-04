<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - Sakarya Üniversitesi</title>
<link rel="stylesheet" type="text/css" href="./Css/styles.css">
</head>
<body>
	<div class="login-container">
		<img src="./Images/logo.png" alt="Sakarya Üniversitesi">

		<h1>Giriş Yap</h1>
		<form action="loginServlet" method="POST">
			<input type="text" name="username" placeholder="Kullanıcı Adı"
				required autofocus value="i@gmail.com"> 
			<input type="password" value="1"
				name="password" placeholder="Şifre" required>
			<button type="submit">Giriş Yap</button>
		</form>	
		
		<a href="Register.jsp" class="register-button">Kayıt Ol</a>	
	</div>
</body>
</html>

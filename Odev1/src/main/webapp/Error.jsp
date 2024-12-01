<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hata</title>
<link rel="stylesheet" type="text/css" href="./Css/styles.css">
</head>
<body>
	<div class="login-container">
		<img src="./Images/logo.png" alt="Sakarya Üniversitesi">

		<h1>Hata!</h1>
		<p>Üzgünüz, ancak beklenmeyen bir hata oluştu.</p>

		<div>
			<a href="MainPage.jsp">Ana Sayfa</a>
		</div>
		<div class="details">
			<p>
				<%=exception != null ? exception.getMessage() : "Belirtilmemiş hata"%>
			</p>
		</div>
	</div>
</body>
</html>

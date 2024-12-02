<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.odev.UserAppService"%>
<%@ page import="java.util.*, java.sql.*"%>
<%@ page import="com.odev.entities.User"%>
<%@ page import="com.odev.entities.PagedResultRequestDto"%>


<%@ include file="./IsCheckLogin.jsp"%>

<%
String searchName = request.getParameter("searchName") != null ? request.getParameter("searchName") : "";

int pageSize = 5;
int pageNo = request.getParameter("pageNo") != null ? Integer.parseInt(request.getParameter("pageNo")) : 1;

UserAppService userAppService = new UserAppService();
PagedResultRequestDto listUserAndRowCount = userAppService.getAllUsers(searchName, pageNo, pageSize);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Kişiler</title>
<link rel="stylesheet" type="text/css" href="./Css/styles.css">
</head>
<body>
	<jsp:include page="./Header.jsp"></jsp:include>
	<div class="layout">
		<main class="content">
			<form action="Users.jsp" method="get">
				<div>
					<label for="searchName">FİLTRE:</label> <input type="text"
						id="searchName" name="searchName" value="<%=searchName%>">

					<button type="submit">Filtrele</button>
				</div>
			</form>

			<table border="1">
				<thead>
					<tr>
						<th></th>
						<th>İSİM SOYİSİM</th>
						<th>EMAİL</th>
						<th>CİNSİYET</th>
						<th>ŞEHİR</th>
						<th>TELEFON</th>
						<th>OKUL ADI</th>
						<th>İŞ</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (User user : listUserAndRowCount.getUsers()) {
					%>
					<tr>
						<td style="text-align: center; vertical-align: middle;"><img
							src="<%=user.getPicture() != "" ? user.getPicture() : "Images/default-profile.png"%>"
							alt="Profil Resmi" style="width: 50px; border-radius: 50%;" /></td>
						<td><a href="User.jsp?Id=<%=user.getId() %>"><%=user.getName() %></a></td>
						<td><%=user.getEmail()%></td>
						<td><%=user.getGender() == 0 ? "Erkek" : "Kadın"%></td>
						<td><%=user.getCity()%></td>
						<td><%=user.getPhone()%></td>
						<td><%=user.getSchoolName()%></td>
						<td><%=user.getBusiness()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="1" class="pageSizeLeft">Toplam Kayıt:<b><%=listUserAndRowCount.getRowCount()%></b></td>
						<td colspan="7" class="pageSizeRight">
							<div>Sayfa : 
								<%
								int totalPages = (int) Math.ceil((double) listUserAndRowCount.getRowCount() / pageSize); // Toplam sayfa sayısı
								String currentUrl = request.getQueryString();
								String baseUrl = "Users.jsp";
								
								if (currentUrl != null && currentUrl.contains("pageNo")) {
							        currentUrl = currentUrl.replaceAll("pageNo=\\d+", "");
							    }
							    if (currentUrl != null && !currentUrl.isEmpty()) {
							        baseUrl += "?" + currentUrl;
							    }
							    
								for (int i = 1; i <= totalPages; i++) {
									if (i == pageNo) {
									%>
										<span><b><%=i%></b></span>
									<%
									} else {
									%>
										<a href="<%=baseUrl + (baseUrl.contains("?") ? "&" : "?") + "pageNo=" + i%>"><%=i%></a>
									<%
									}
									}
									%>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</main>
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.odev.ForumAppService"%>
<%@ page import="com.odev.entities.Forum_ListDto"%>
<%@ page import="java.util.*,java.sql.*"%>
<%@ page import="com.odev.entities.Forum"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.util.Locale"%>

<%@ include file="./IsCheckLogin.jsp"%>

<%
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMMM yyyy HH:mm:ss", Locale.forLanguageTag("tr"));
	String searchName = request.getParameter("searchName") != null ? request.getParameter("searchName") : "";
	
	Users profile = new Users();
	Object sessionProfile = mySession.getAttribute("user");
	if (sessionProfile instanceof Users) {
		profile = (Users) sessionProfile;
	}
	
	int pageSize = 5;
	int pageNo = request.getParameter("pageNo") != null ? Integer.parseInt(request.getParameter("pageNo")) : 1;
	
	ForumAppService forumAppService = new ForumAppService();
	Forum_ListDto listForumAndRowCount = forumAppService.getAllForums(searchName, pageNo, pageSize);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Forum</title>
<link rel="stylesheet" type="text/css" href="./Css/styles.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
	<jsp:include page="./Header.jsp"></jsp:include>
	<div class="toolbar">
		<a href="MainPage.jsp" class="user_back-button"> <i
			class="fa fa-arrow-left"></i>
		</a>
	</div>
	<div class="layout">
		<main class="content">
			<div class="newforum">
				<form action="InsertForumsServlet" method="POST">
					<input type="hidden" id="userId" name="userId" value="<%=profile.getId()%>" />
	
					<label for="title">Konu:</label> 
					<input type="text" id="title" name="title" autofocus required placeholder="Konu giriniz" />
	
					<textarea id="comment" name="comment" placeholder="Yorumunuz" rows="4" cols="50" style="width:99%" required></textarea>
					
					<div class="text-right">
						<button style="width: 120px" type="submit">Gönder</button>
					</div>
				</form>
			</div>
			
			<form action="Forum.jsp" method="get">
				<div>
					<input type="text" id="searchName" name="searchName" placeholder="Filtre" value="<%=searchName%>">

					<button type="submit">Uygula</button>
				</div>
			</form>

			<table border="1">
				<tbody>
					<%
					for (Forum forum : listForumAndRowCount.getForums()) {
					%>
					<tr>
						<td width="8%">
							<div class="text-center">
								<img
									src="<%=forum.getUserPicture().length() > 0 ? forum.getUserPicture() : "Images/default-profile.png"%>"
									style="width: 50px; border-radius: 50%;" />
							</div>
						</td>
						<td width="82%">
							<div class="forum">
								<a href="Forum.jsp?Id=<%=forum.getId()%>">
									<div class="title">
										<b><%=forum.getTitle()%></b>
									</div>
								</a>
								<div class="comment"><%=forum.getComment()%></div>
							</div>
						</td>
						<td width="10%">
        					<div style="display:flex; flex-direction: column; align-items: center">
								<div class="text-center">
									<%
				                		if(profile.getRole().equals("Admin")) {
				                	%>
										<form action="DeleteForumServlet" method="POST">
							                <input type="hidden" name="Id" value="<%=forum.getId()%>">
							                
							                <button class="delete-button" type="submit">X</button>
							            </form>		
						            <%
						            	}
						            %>		
								</div>
								<div class="text-center">
									<%=forum.getCreateTime().toLocalDateTime().format(formatter)%>
								</div>
							</div>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
				<tfoot>
					<tr>
						<td class="pageSizeLeft" style="text-align: center"><b><%=listForumAndRowCount.getRowCount()%></b></td>
						<td colspan="2" class="pageSizeRight">
							<div>
								Sayfa :
								<%
							int totalPages = (int) Math.ceil((double) listForumAndRowCount.getRowCount() / pageSize); // Toplam sayfa sayısı
							String currentUrl = request.getQueryString();
							String baseUrl = "Forums.jsp";

							if (currentUrl != null && currentUrl.contains("pageNo")) {
								currentUrl = currentUrl.replaceAll("pageNo=\\d+", "");
							}
							if (currentUrl != null && !currentUrl.isEmpty()) {
								baseUrl += "?" + currentUrl;
							}

							for (int i = 1; i <= totalPages; i++) {
								if (i == pageNo) {
							%>
								<span><b class="current_page"><%=i%></b></span>
								<%
								} else {
								%>
								<a class="page"
									href="<%=baseUrl + (baseUrl.contains("?") ? "&" : "?") + "pageNo=" + i%>"><%=i%></a>
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

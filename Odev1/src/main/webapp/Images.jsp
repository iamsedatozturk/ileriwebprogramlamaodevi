<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
	Forum_ListDto listForumAndRowCount = forumAppService.getAllForums("image", searchName, pageNo, pageSize);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Resimler</title>
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
			<label for="title">Yeni Resim</label> 
			<div class="newforum">
				<form action="InsertForumsServlet" method="POST" enctype="multipart/form-data">
					<input type="hidden" id="userId" name="userId" value="<%=profile.getId()%>" />
					<input type="hidden" id="type" name="type" value="image" />
					
					<input type="text" id="title" name="title" autofocus required placeholder="Konu giriniz" />
					<input type="file" id="picture" name="picture" multiple accept="image/*">
					<span>Birden fazla resim seçebilirsiniz...</span>
					<textarea id="comment" name="comment" placeholder="Yorumunuz" rows="4" cols="50" required></textarea>
					
					<div class="text-right">
						<button style="width: 120px" type="submit">Gönder</button>
					</div>
				</form>
			</div>
			
			<% 
				if(listForumAndRowCount.getRowCount() > 0) {
			%>
			<form action="Images.jsp" method="get">
				<div>
					<input type="text" id="searchName" name="searchName" placeholder="Filtre" value="<%=searchName%>">

					<button class="filter-button" type="submit">Uygula</button>
				</div>
			</form>
			<%
				}
			%>
			<table border="1">
				<tbody>
					<%
					for (Forum forum : listForumAndRowCount.getForums()) {
					%>
					<tr>
						<td width="8%" style="vertical-align: top; border-right: 1px solid #ddd">
							<div class="text-center">
								<img src="<%=forum.getUserPicture().length() > 0 ? forum.getUserPicture() : "Images/default-profile.png"%>" style="width: 50px; border-radius: 50%;" />

								<div class="text-center">
									<a href="User.jsp?Id=<%=forum.getUserId() %>"><%=forum.getUserName() %></a>
								</div>								
								<div class="text-center">
									<%=forum.getCreateTime().toLocalDateTime().format(formatter)%>
								</div>
							</div>
						</td>
						<td width="87%">
							<div class="forum">
								<a class="title" href="Image.jsp?Id=<%=forum.getId()%>">
									<b><%=forum.getTitle()%></b>
								</a>
								<div class="comment"><%=forum.getComment()%></div>
								
								<% 
									List<String> mediaList = forum.getMedias();

									if (mediaList != null) { 
										for (String media : mediaList) {
										%>
											<a href="<%=media%>" target="_blank">
							                    <img class="forum-image" src="<%=media%>">
											</a>
										<% } } %>
							</div>
						</td>
						<%
	                		if(profile.getRole().equals("Admin")) {
	                	%>
						<td width="5%">
        					<div style="display:flex; flex-direction: column; align-items: center">
								<div class="text-center">
									<form action="DeleteForumServlet" method="POST">
						                <input type="hidden" name="Id" value="<%=forum.getId()%>">
						                <input type="hidden" id="type" name="type" value="image" />
						                
						                <button class="delete-button" type="submit">X</button>
						            </form>		
								</div>
							</div>
						</td>
						            
			            <%
			            	}
			            %>		
					</tr>
					<%
					}
					%>
				</tbody>
				
				<% 
					if(listForumAndRowCount.getRowCount() > 0) {
				%>
				
				<tfoot>
					<tr>
						<td class="pageSizeLeft" style="text-align: center"><b><%=listForumAndRowCount.getRowCount()%></b></td>
						<td colspan="2" class="pageSizeRight">
							<div>
								Sayfa :
								<%
							int totalPages = (int) Math.ceil((double) listForumAndRowCount.getRowCount() / pageSize); // Toplam sayfa sayısı
							String currentUrl = request.getQueryString();
							String baseUrl = "Images.jsp";

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
				
				<%
					}
				%>
				
			</table>
		</main>
	</div>
</body>
</html>

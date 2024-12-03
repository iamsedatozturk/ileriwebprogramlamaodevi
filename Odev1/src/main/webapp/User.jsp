<%@page import="com.odev.MessagesAppService"%>
<%@page import="com.odev.entities.Messages"%>
<%@page import="com.odev.entities.Comment"%>
<%@page import="com.odev.entities.CommentListDto"%>
<%@page import="com.odev.CommentAppService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.odev.entities.User"%>
<%@ page import="com.odev.UserAppService"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.UUID"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.util.Locale"%>

<%@ include file="./IsCheckLogin.jsp"%>

<%
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMMM yyyy HH:mm:ss", Locale.forLanguageTag("tr"));
	User user = null;
	String userId = request.getParameter("Id") != "" ? request.getParameter("Id") : "";
	
	UserAppService userAppService = new UserAppService();
	user = userAppService.getUser(UUID.fromString(userId));
	
	User profile = new User();
	Object sessionProfile = mySession.getAttribute("user");
	if (sessionProfile instanceof User) {
		profile = (User) sessionProfile;
	}

	//Comment List bu kısımda
	int pageSize = 100;
	int pageNo = request.getParameter("pageNo") != null ? Integer.parseInt(request.getParameter("pageNo")) : 1;
	
	CommentAppService commentAppService = new CommentAppService();
	CommentListDto listCommentAndRowCount = commentAppService.getAllComments(UUID.fromString(userId), pageNo, pageSize);
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
							src="<%=user.getPicture().length() > 0 ? user.getPicture() : "./Images/default-profile.png"%>"
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
							out.print("<span>Hobisi bulunmamaktadır.</span>");
						}
						%>
					</div>
				</div>

				<div class="user_comments-info">
					<form action="CommentServlet" method="POST" enctype="multipart/form-data">
						<input type="hidden" id="userId" name="userId" value="<%= userId %>">
						<input type="hidden" id="creatorId" name="creatorId" value="<%= profile.getId() %>">
						<div>
							<label for="type">Yorum Tipi:</label>
						</div>
						<div class="user_comments-info_yorum">
					        <label for="typeText">
					            <input type="radio" id="typeText" name="type" value="text" checked>Metin
					        </label>
					        <label for="typeImage">
					            <input type="radio" id="typeImage" name="type" value="image">Resim
					        </label>
					        <label for="typeVideo">
					            <input type="radio" id="typeVideo" name="type" value="video">YouTube
					        </label>
				        </div>
				        <div id="textComment">
				        </div>
				
				        <div id="imageComment" style="display:none;">
				            <input type="file" id="picture" name="picture">
				        </div>
				
				        <div id="videoComment" style="display:none;">
							<input type="text" id="video" name="video"
								placeholder="YouTube Video Linki" style="width: 100%">
						</div>
				
			            <textarea id="comment" name="comment" placeholder="Yorumunuz" rows="4" cols="50" style="width:95%" required></textarea>
				
				        <button type="submit" style="width: 140px">Yorum Gönder</button>
				    </form>
				
				    <script>
				        document.querySelectorAll('input[name="type"]').forEach(function(input) {
				            input.addEventListener("change", function() {
				                var type = this.value;
				                document.getElementById("textComment").style.display = type === "text" ? "block" : "none";
				                document.getElementById("imageComment").style.display = type === "image" ? "block" : "none";
				                document.getElementById("videoComment").style.display = type === "video" ? "block" : "none";
				            });
				        });
				
				        document.querySelector('input[name="type"]:checked')?.dispatchEvent(new Event("change"));
				    </script>
				
					<div class="user_comments-list">
					    <%
					    for (Comment comment : listCommentAndRowCount.getComments()) {
					    %>
					        <div class="comment-container">
					            <div class="comment-header">
					                <div class="comment-user">
					                    <img src="<%= comment.getCreatorPicture().length() > 0 ? comment.getCreatorPicture() : "./Images/default-profile.png" %>"
					                         alt="<%= comment.getCreatorName() %>'in Profil Fotoğrafı" class="comment-avatar">
					                    <span class="comment-author"><%= comment.getCreatorName() %></span>
					                </div>
					                <span class="comment-date"><%= comment.getCreateTime().toLocalDateTime().format(formatter) %></span>
					            </div>
					
					            <div class="comment-body">
					                <%
					                if ("text".equals(comment.getType())) {
					                %>
					                    <p class="comment-text"><%= comment.getComment() %></p>
					                <%
					                } else if ("image".equals(comment.getType())) {
					                %>
					                    <div class="comment-media">
					                        <img src="<%= comment.getMedia() %>" alt="Resim" class="comment-image">
					                    </div>
					                    
					                    <p class="comment-text"><%= comment.getComment() %></p>
					                <%
					                } else if ("video".equals(comment.getType())) {
					                %>
					                    <div class="comment-media">
					                        <iframe width="100%" height="315" src="<%= comment.getMedia() %>" frameborder="0" allowfullscreen></iframe>
					                    </div>
					                    
					                    <p class="comment-text"><%= comment.getComment() %></p>
					                <%
					                }
					                %>
					            </div>
					            
								<form action="MessagesServlet" method="POST">
					                <input type="hidden" name="creatorId" value="<%= profile.getId() %>">
					                <input type="hidden" name="commentId" value="<%= comment.getId() %>">
					                <input type="hidden" name="userId" value="<%= userId %>">
					                
					                <input type="text" name="message" placeholder="Yeni yorumunuzu buraya yazın..." required></input>
					                
					                <button type="submit">Yorum Gönder</button>
					            </form>

								<div class="message-list">
									<%
									MessagesAppService messagesAppService = new MessagesAppService();

									for (Messages message : messagesAppService.getAllMessages(comment.getId())) {
									%>
										<div class="message-container">
											<div class="message-header">
												<img src="<%= message.getCreatorPicture().length() > 0 ? message.getCreatorPicture() : "./Images/default-profile.png" %>" 
													 alt="Resim" class="message-avatar">
												<span class="message-sender"><%= message.getCreatorName() %></span>
												<span class="message-time"><%= message.getCreateTime().toLocalDateTime().format(formatter) %></span>
											</div>
											<p class="message-text"><%= message.getMessage() %></p>
										</div>
									<%
									}
									%>
								</div>
					        </div>
					    <%
					    }
					    %>
					</div>
				</div>
			</div>
		</main>
	</div>
</body>
</html>

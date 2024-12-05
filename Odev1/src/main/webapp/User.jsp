<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.odev.UsersMessagesAppService"%>
<%@page import="com.odev.entities.Users_Messages"%>
<%@page import="com.odev.entities.Users_Comments"%>
<%@page import="com.odev.entities.Users_CommentsListDto"%>
<%@page import="com.odev.UsersCommentsAppService"%>

<%@ page import="com.odev.entities.Users"%>
<%@ page import="com.odev.UsersAppService"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.UUID"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.util.Locale"%>

<%@ include file="./IsCheckLogin.jsp"%>

<%
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMMM yyyy HH:mm:ss", Locale.forLanguageTag("tr"));
	Users user = null;
	String userId = request.getParameter("Id") != "" ? request.getParameter("Id") : "";
	
	UsersAppService userAppService = new UsersAppService();
	user = userAppService.getUser(UUID.fromString(userId));
	
	Users profile = new Users();
	Object sessionProfile = mySession.getAttribute("user");
	if (sessionProfile instanceof Users) {
		profile = (Users) sessionProfile;
	}

	//Comment List bu kısımda
	int pageSize = 5;
	int pageNo = request.getParameter("pageNo") != null ? Integer.parseInt(request.getParameter("pageNo")) : 1;
	
	UsersCommentsAppService commentAppService = new UsersCommentsAppService();
	Users_CommentsListDto listCommentAndRowCount = commentAppService.getAllComments(UUID.fromString(userId), pageNo, pageSize);
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
		<a href="Users.jsp" class="user_back-button"> 
			<i class="fa fa-arrow-left"></i>
		</a>
      	<%
      	if(profile.getRole().equals("Admin")) {
      	%>
			<form action="DeleteUserServlet" method="POST">
               <input type="hidden" name="id" value="<%=user.getId()%>">
               
               <button style="margin-left:5px" type="submit">KİŞİ SİL</button>
           </form>		
           
           	<%
           	if(user.getRole().equals("User")) {
           	%>
				<form action="UpdateUserServlet" method="POST">
	               <input type="hidden" name="id" value="<%=user.getId()%>">
	               
	               <button style="margin-left:5px" type="submit">ADMİN ROLÜNE AL</button>
	           </form>
            <%
            }
            %>
         <%
         }
         %>
	</div>
	<div class="user_layout">
		<main class="user_content">
			<div class="profile-section">
				<div class="profile-image-container">
					<div>
						<img src="<%=user.getPicture().length() > 0 ? user.getPicture() : "./Images/default-profile.png"%>" class="user-image" />
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
					<form action="InsertCommentServlet" method="POST" enctype="multipart/form-data">
						<input type="hidden" id="userId" name="userId" value="<%=userId%>">
						<input type="hidden" id="creatorId" name="creatorId" value="<%=profile.getId()%>">
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
				            <input type="file" id="picture" name="picture" accept="image/*">
				        </div>
				
				        <div id="videoComment" style="display:none;">
							<input type="text" id="video" name="video" placeholder="YouTube Video Linki (https://www.youtube.com/embed/{Kod})" style="width: 98%">
						</div>
				
			            <textarea id="comment" name="comment" placeholder="Yorumunuz" rows="4" cols="50" style="width:98%" required></textarea>
				
				        <button type="submit" style="width: 100%">Yorum Gönder</button>
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
						<div class="paging" style="display:flex;">
							<div class="pageSizeLeft" style=" flex:2">Toplam Kayıt: <b><%=listCommentAndRowCount.getRowCount()%></b></div>
							<div class="pageSizeRight" style="flex:5">
								Sayfa : 
								<%
									int totalPages = (int) Math.ceil((double) listCommentAndRowCount.getRowCount() / pageSize); // Toplam sayfa sayısı
																										String currentUrl = request.getQueryString();
																										String baseUrl = "User.jsp";
																										
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
										<a class="page" href="<%=baseUrl + (baseUrl.contains("?") ? "&" : "?") + "pageNo=" + i%>"><%=i%></a>
									<%
									}
								}
								%>
							</div>
						</div>

					    <%
					    for (Users_Comments comment : listCommentAndRowCount.getComments()) {
					    %>
					        <div class="comment-container">
					            <div class="comment-header">
					                <div class="comment-user">
					                	<a href="User.jsp?Id=<%=comment.getCreatorId()%>" target="_blank">
						                    <img class="comment-avatar" src="<%=comment.getCreatorPicture().length() > 0 ? comment.getCreatorPicture() : "./Images/default-profile.png"%>">
										</a>					                         
										<a href="User.jsp?Id=<%=comment.getCreatorId()%>" target="_blank">
					                    	<span class="comment-author"><%=comment.getCreatorName()%></span>
					                    </a>
					                </div>
					                <span class="comment-date"><%=comment.getCreateTime().toLocalDateTime().format(formatter)%></span>
					                <span>
					                	<%
					                	if(profile.getRole().equals("Admin")) {
					                	%>
											<form action="DeleteCommentServlet" method="POST">
								                <input type="hidden" name="commentId" value="<%=comment.getId()%>">
								                <input type="hidden" name="userId" value="<%=userId%>">
								                
								                <button class="delete-button" type="submit">X</button>
								            </form>		
							            <%
							            	}
							            %>			                
					                </span>
					            </div>
					
					            <div class="comment-body">
					                <%
					                if ("text".equals(comment.getType())) {
					                %>
					                    <p class="comment-text"><%=comment.getComment()%></p>
					                <%
					                } else if ("image".equals(comment.getType())) {
					                %>
					                    <div class="comment-media">
					                    	<a href="<%=comment.getMedia()%>" target="_blank">
					                        	<img src="<%=comment.getMedia()%>" alt="Resim" class="comment-image">
					                        </a>
					                    </div>
					                    
					                    <p class="comment-text"><%=comment.getComment()%></p>
					                <%
					                } else if ("video".equals(comment.getType())) {
					                %>
					                    <div class="comment-media">
					                        <iframe width="100%" height="315" src="<%=comment.getMedia()%>" frameborder="0" allowfullscreen></iframe>
					                    </div>
					                    
					                    <p class="comment-text"><%=comment.getComment()%></p>
					                <%
					                }
					                %>
					            </div>
					            
								<form action="InsertMessagesServlet" method="POST">
					                <input type="hidden" name="creatorId" value="<%=profile.getId()%>">
					                <input type="hidden" name="commentId" value="<%=comment.getId()%>">
					                <input type="hidden" name="userId" value="<%=userId%>">
					                
					                <input type="text" name="message" placeholder="Cevap yazınız..." required></input>
					                
					                <button type="submit">Cevap Gönder</button>
					            </form>

								<div class="message-list">
									<%
									UsersMessagesAppService messagesAppService = new UsersMessagesAppService();

																							for (Users_Messages message : messagesAppService.getAllMessages(comment.getId())) {
									%>
										<div class="message-container">
											<div class="message-header">
							                	<a href="User.jsp?Id=<%= message.getCreatorId() %>" target="_blank">
													<img class="message-avatar" src="<%= message.getCreatorPicture().length() > 0 ? message.getCreatorPicture() : "./Images/default-profile.png" %>">
												</a>
							                	<a href="User.jsp?Id=<%= message.getCreatorId() %>" target="_blank">
													<span class="message-sender"><%= message.getCreatorName() %></span>
												</a>
												<span class="message-time"><%= message.getCreateTime().toLocalDateTime().format(formatter) %></span>
											</div>
					
											<div class="message-header">						
												<p class="message-text"><%= message.getMessage() %></p>
												
												<% 
							                		if(profile.getRole().equals("Admin")) { 
						                		%>
													<form action="DeleteMessagesServlet" method="POST">
										                <input type="hidden" name="messageId" value="<%= message.getId() %>">
										                <input type="hidden" name="userId" value="<%= userId %>">
										                
										                <button class="delete-button" type="submit">X</button>
										            </form>
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

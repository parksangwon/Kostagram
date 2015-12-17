<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.kostagram.service.beans.PhotoInfoVO"%>
<%@page import="com.kostagram.service.beans.ArticleVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<ArticleVO> myPhotoList = (ArrayList<ArticleVO>)request.getAttribute("myPhotoList");
	String loginEmail = (String)session.getAttribute("email");
	String seq_photo = (String)request.getAttribute("seq_photo");
	String photoNickname = (String)request.getAttribute("nickname");
	String profile = (String)request.getAttribute("profile_img");
	String email = (String)request.getAttribute("email");
	Date reg_date = (Date)request.getAttribute("reg_date");
	ArticleVO article = myPhotoList.get(0);

%>
<title>Kostagram</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0,user-scalable=no" />
<script src="jquery-mobile/jquery-1.6.4.js"></script>
<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
<script src="js/common.js"></script>
<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet"
	type="text/css" />

<body>
	<div id="detail" data-role="page" data-theme="a">

		<div data-role="header">
				<table>
					<tr>
						<td>
							<a href="#" data-rel="back"><image src="./image/icon/back.png" width="20" style="padding-left:10px;"/></a>
							<span style="height:35px;
							font-size:20px;
							color:#ffffff;
							line-height:35px;
							text-align:left;
							background-color:transparent;
							border:0px;
							text-shadow: 0px 0px 0px black;
							padding-left:5px;">
							확대 보기
							</span>
						</td>
					</tr>
				</table>
			</div>

					
			<div class='article' id="article" >
				<div class='photoHeader'>
					<table width='100%'>
						<tr>
							<td width='60'>
						<%
							if (profile == null) {
						%>
								<img src='/Kostagram/personalImg/profile.jpg' width='60' id='profileImg' style='-webkit-border-radius: 100px; border-radius: 100px;' />
						<%	} else {
						%>
								<img src='/Kostagram/personalImg/<%= email %>/profile.jpg' width='60' id='profileImg' style='-webkit-border-radius: 100px; border-radius: 100px;' />
						<%	} %>
							
							</td>
							<td align='left'><a href='/Kostagram/m/<%= photoNickname %>' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>
							<%= photoNickname %></a></td>
							<td align='right' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>
						<%
							long uploadTime = System.currentTimeMillis() - reg_date.getTime();
							if ( uploadTime/(1000*60*60*24*7) != 0 ) {
						%>	<%= uploadTime/(1000*60*60*24*7)%> 주 전
						<%	} else if (uploadTime/(1000*60*60*24) != 0 ) {
						%>	<%= uploadTime/(1000*60*60*24)%> 일 전
						<% 	} else if ( uploadTime/(1000*60*60) != 0 ) {
						%>	<%= uploadTime/(1000*60*60)%> 분 전
						<%  } else if ( uploadTime/(1000*60) != 0 ) {
						%>	<%= uploadTime/(1000*60)%> 초 전
						<%  } else if ( uploadTime/(1000*30) != 0 ) {
						%>	방금	<% } %>
							</td>
						</tr>
						</table>
					</div>
					
					<div class='photoArea'>
						<table width='100%' cellpadding='0' cellspacing='0'>
							<tr>
								<td width='100%' colspan='2'>
									<img src='/Kostagram/personalImg/<%= email%>/<%= seq_photo%>.jpg' width='100%' />
								</td>
							</tr>
						</table>
					</div>
					<%
						List<HashMap> likeCheck = article.getLikeList();
						String likeYn = "heart";
						if (likeCheck.size() != 0) {
							for ( int j = 0; j < likeCheck.size(); j++ ) {
								HashMap like = likeCheck.get(j);
								if (loginEmail.equals((String)like.get("EMAIL"))) {
									likeYn = "heart2";
								}
							}
						}
					%>
					<div class='CMTnLIK' id ="CMTnLIK" style='padding: 0px 5px 0px 5px'>
						<table>
							<tr>
							
								<td align='left'><img src='/Kostagram/m/image/icon/<%= likeYn%>.png' id='heartBtn' width='25' value=<%= seq_photo %> />
								</td>
								<td align='left'>
									<a href='./comment?pid=<%=seq_photo %>'><img src='./image/icon/chat_bubble.png' width='25'/></a>
								</td>
								<td align='right'><a href='./report?pid="<%= seq_photo%>"'>
									<img src='./image/icon/warning.png' width='25' /></a>
								</td>
							</tr>
						</table>
					<hr/>
					
					<table>
						<tr>
						<%
							List<HashMap> likeList = article.getLikeList();
							if (likeList.size() < 6) {
						%>
							<td>
								<div id="likeArea" style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>♥
						<%
								if (likeList.size() == 0) {
						%>		좋아요
						<%		}
								for (int j = 0; j < likeList.size(); j++) {
									HashMap like = likeList.get(j);
									String cmtNickname = (String) like.get("NICKNAME");
						%>
									<a href='/Kostagram/m/<%= cmtNickname %>' style="text-decoration: none; 
									text-shadow: 0px 0px 0px; 
									color: #004879; 
									font-weight: normal;"><%= cmtNickname + " "%></a>
						<%
								}
						%>
								</div>
							</td>
						<%		} else {
						%>
							<td>
								<a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>♥
								<%= likeList.size()%> 개
								</a>
							</td>
						</tr>
					<% 
								}
								List<HashMap> commentList = article.getCommentList();
								if (commentList != null && commentList.size() > 0) {
									if (commentList.size() > 6) {
					%>
						<tr>
							<td>
								<a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #353535; font-weight: normal;'>댓글 더보기</a>
							</td>
						</tr>
					<%			}
									for (int j = 0; j < commentList.size(); j++) {
										HashMap comment = commentList.get(j);
										String nickname = (String) comment.get("NICKNAME");
										String content = (String) comment.get("CONTENT");
					%>
						<tr>
							<td>
								<a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>
								<%= nickname%></a> <%= content%>
							</td>
						</tr>
					<% 
									}
								}
					%>
					</table>
				</div>
			<div class='addCmt' style='padding: 0px 5px 40px 5px'><a href='./comment?pid=<%=seq_photo %>' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #353535; font-weight: normal;'>댓글 달기</a>
			</div>
		</div>

		<div data-role="footer" data-position="fixed">
			<div data-role="navbar" class="ui-btn-active">
				<ul>
					<li><a href="/Kostagram/m/"><img src="/Kostagram/m/image/icon/house.png"
							width="20" /></a></li>
					<li><a href="/Kostagram/m/round"><img src="/Kostagram/m/image/icon/search.png"
							width="20" /></a></li>
					<li><a href="#"><img src="/Kostagram/m/image/icon/camera.png"
							width="20" /></a></li>
					<li><a href="/Kostagram/m/mynews"><img src="/Kostagram/m/image/icon/info.png"
							width="20" /></a></li>
					<li><a href='/Kostagram/m/<%= session.getAttribute("nickname")%>'><img src="/Kostagram/m/image/icon/user.png"
							width="20" /></a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
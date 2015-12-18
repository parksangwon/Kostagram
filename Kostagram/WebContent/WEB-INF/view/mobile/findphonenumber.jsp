<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>

<%@page import="com.kostagram.service.beans.UserInfoVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<HashMap> userinfo = (List<HashMap>) request.getAttribute("userinfo");
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
	<div id="findphonenumber" data-role="page" data-theme="a">

		<div data-role="header">
			<table>
				<tr>
					<td><a href="#" data-rel="back"><image
								src="./image/icon/back.png" width="20"
								style="padding-left:10px;" /></a> <span
						style="height: 35px; font-size: 20px; color: #ffffff; line-height: 35px; text-align: left; background-color: transparent; border: 0px; text-shadow: 0px 0px 0px black; padding-left: 5px;">
							연락처 찾기 </span></td>
				</tr>
			</table>
		</div>

		<center>
			<h3>
				Kostagram (친구 찾기)
			</h3>
			<br> <font color="gray"><h5>친구들의 게시물 / 사진을 확인해보세요.</h5></font>
		</center>
		<div data-role="content">
			<form id="findphonenumber_form" method="post" action="#" align="center">
				<hr>
				원하는 분을 팔로우 하세요 
				<hr>
		
				<table width="100%" border="0">
			<%
					if (userinfo != null && userinfo.size() > 0) {
						for (HashMap following : userinfo) {
							String nickname = (String) following.get("NICKNAME");
							String email = (String) following.get("EMAIL");
							String profile = (String) following.get("PROFILE_IMG");
							Date check = (Date) following.get("REG_DATE");
				
					
			%>
			<tr>
					<%
						if (profile == null) {
					%>
					<td><img src="/Kostagram/personalImg/profile.jpg" width="55"></td>
					<%
						} else {
					%>
					<td><img src="/Kostagram/personalImg/<%=email%>/profile.jpg"
						width="55"></td>
					<%
						}
					%>
							<td width="55%"><%=nickname%><br></td>
					<%
							if (!email.equals((String)session.getAttribute("email"))) {
								
							
					%>
							<td>
					<%
								if (check == null || check.equals("null")) {
					%> 			<a class="follow" value="UF" data-email="<%= email%>"> 팔로우</a> <%
								} else {
					%> 			<a class="follow" value="F" style="color: green"  data-email="<%= email%>">팔로잉</a> <%
								}
					%>
							</td>
					<% 
							}
					%>
							
							
					</tr>
				<%
						}
					} else {
				%>
				<br>
				<div align="center">팔로잉이 없습니다.</div>
				<%
					}
				%>

			</table>
			<hr>
			</form>
		</div>

		<div data-role="footer" data-position="fixed">
			<div data-role="navbar" class="ui-btn-active">
				<ul>
					<li><a href="/Kostagram/m/"><img src="/Kostagram/m/image/icon/house.png"
							width="20" /></a></li>
					<li><a href="/Kostagram/m/round"><img src="/Kostagram/m/image/icon/search.png"
							width="20" /></a></li>
					<li><a href="/Kostagram/m/write"><img src="/Kostagram/m/image/icon/camera.png"
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
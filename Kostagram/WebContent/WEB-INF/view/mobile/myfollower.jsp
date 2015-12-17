<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<HashMap> myfollower = (List<HashMap>) request.getAttribute("myfollower");
	
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
	<div id="myfollower" data-role="page" data-theme="a">

		<div data-role="header">
			<table>
				<tr>
					<td><a href="#" data-rel="back"><image
								src="./image/icon/back.png" width="20"
								style="padding-left:10px;" /></a> <span
						style="height: 35px; font-size: 20px; color: #ffffff; line-height: 35px; text-align: left; background-color: transparent; border: 0px; text-shadow: 0px 0px 0px black; padding-left: 5px;">
							팔로워 </span></td>
				</tr>
			</table>
		</div>

		<div data-role="content">
			<table width="100%" border="0">
				<%
					if (myfollower != null && myfollower.size() > 0) {
						for (HashMap follower : myfollower) {
							String nickname = (String) follower.get("NICKNAME");
							String email = (String) follower.get("EMAIL");
							String profile = (String) follower.get("PROFILE_IMG");
							Date check = (Date) follower.get("REG_DATE");				
				%>
					<tr>
					<%
							if (profile == null) {
					%>
							<td><img src="/Kostagram/personalImg/profile.jpg" width="55"></td>
					<%
							} else {
					%>
							<td><img src="/Kostagram/personalImg/<%=email%>/profile.jpg" width="55"></td>
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
						<div align="center">팔로워가 없습니다.</div>
				<%
					}
				%>
			</table>
			<hr>
		</div>

		<div data-role="footer" data-position="fixed">
			<div data-role="navbar" class="ui-btn-active">
				<ul>
					<li><a href="/Kostagram/m/"><img
							src="/Kostagram/m/image/icon/house.png" width="20" /></a></li>
					<li><a href="/Kostagram/m/round"><img
							src="/Kostagram/m/image/icon/search.png" width="20" /></a></li>
					<li><a href="#"><img
							src="/Kostagram/m/image/icon/camera.png" width="20" /></a></li>
					<li><a href="/Kostagram/m/mynews"><img
							src="/Kostagram/m/image/icon/info.png" width="20" /></a></li>
					<li><a
						href='/Kostagram/m/<%=session.getAttribute("nickname")%>'><img
							src="/Kostagram/m/image/icon/user.png" width="20" /></a></li>
				</ul>
			</div>
		</div>
	</div>
</body>

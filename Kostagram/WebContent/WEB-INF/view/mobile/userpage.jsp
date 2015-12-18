<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String check = (String) request.getAttribute("check");
	String profile = "";
	String message = "";
	String nickname = "";
	String email = "";
	int photoCnt = 0;
	int followerCnt = 0;
	int followingCnt = 0;

	if (request.getAttribute("email") != null) {
		email = (String) request.getAttribute("email");
	}
	if (request.getAttribute("nickname") != null) {
		nickname = (String) request.getAttribute("nickname");
	}
	if (request.getAttribute("profile") != null) {
		profile = (String) request.getAttribute("email") + "/" + (String) request.getAttribute("profile");
	} else {
		profile = "profile.jpg";
	}
	if (request.getAttribute("message") != null && !request.getAttribute("message").equals("null")) {
		message = (String) request.getAttribute("message");
	}
	if (request.getAttribute("photoCnt") != null) {
		photoCnt = (Integer) request.getAttribute("photoCnt");
	}
	if (request.getAttribute("followerCnt") != null) {
		followerCnt = (Integer) request.getAttribute("followerCnt");
	}
	if (request.getAttribute("followingCnt") != null) {
		followingCnt = (Integer) request.getAttribute("followingCnt");
	}
	
	
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0,user-scalable=no" />
<TITLE>Kostagram</TITLE>

<script src="jquery-mobile/jquery-1.6.4.js"></script>
<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
<script src="js/common.js"></script>
<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet"
	type="text/css" />

<body>
	<div id="userpage" data-role="page" data-theme="a">
		<input type="hidden" name="userpage_email" value="<%=email%>" />
		<div data-role="header" data-theme="a">
			<table width="100%">
				<tr>
					<td>
					<span
						style="height: 35px; font-size: 20px; color: #ffffff; line-height: 35px; text-align: left; background-color: transparent; border: 0px; text-shadow: 0px 0px 0px black; padding-left: 5px;">
							<%=nickname%>
					</span>
					</td>
					<td align="right"><a href="./option"><img
							src="./image/icon/settings.png" width="20"
							style="padding-right: 10px;" /></a>
					</td>
				</tr>
			</table>
		</div>
		<div data-rol="content" align="center">
			<div>
				<table border="0" width="100%">
					<tr>
						<td rowspan="2" width="30%"><img width=90
							src="../personalImg/<%=profile%>"
							style="-webkit-border-radius: 100px; border-radius: 100px; padding: 1em" /></td>
						<td align="center"><%=photoCnt%><br><b>게시물</b></td>
						<td align="center" ><span id="abc"><%=followerCnt%></span><br><a href="/Kostagram/m/myfollower?email=<%=email%>" style="text-decoration:none;"><font color="black"> 팔로워</font></a></td>
						<td align="center"><%=followingCnt%><br><a href="/Kostagram/m/myfollowing?email=<%=email%>" style="text-decoration:none;"><font color="black"> 팔로잉</font></a></td>
					</tr>


					<%
						if (check.equals("Y")) {
					%>

					<tr>
						<td align="center" colspan="3"
							onclick="$.mobile.changePage('./profileupdate')">

							<a><font color="black">프로필 편집</font></a>
						</td>
					</tr>
					<%
						} else {
							if (check.equals("FN")) {
					%>

					<tr>
						<td align="center" colspan="3">
							<div style="border-bottom:1; border:bold; border-color:blue"><a id="followBtn" value="UF">팔로우</a></div>
						</td>
					</tr>
					<%
						} else {
					%>
					<tr>
						<td  align="center" colspan="3">
							<div style="border-bottom:1; border:bold; border-color:blue"><a style="border:1; border-color:blue" id="followBtn" value="F">팔로잉</a></div>
						</td>
					</tr>
					<%
						}
						}
					%>


					<tr>
						<td align="left" colspan="3"><%=message%></td>
					</tr>
				</table>
			</div>
		</div>

		<div id="ctrlBtnGrp">
			<table width="100%">
				<tr>
					<td align="center" class="getPhotoList" value="grid"><img
						src="./image/icon/grid.png" width="20" /></td>
					<td align="center" class="getPhotoList" value="list"><img
						src="./image/icon/stamp.png" width="20" /></td>
					<td align="center"><a href="/Kostagram/m/photomap"><img src="./image/icon/pin.png" width="20" /></a></td>
					<td align="center"><a href="/Kostagram/m/likenotice"><img
							src="./image/icon/bookmark.png" width="20" /></a></td>
				</tr>
			</table>
		</div>
		<br>
		<div id="photoArea"></div>

		<div data-role="footer" data-position="fixed">
			<div data-role="navbar" class="ui-btn-active">
				<ul>
					<li><a href="/Kostagram/m/"><img
							src="/Kostagram/m/image/icon/house.png" width="20" /></a></li>
					<li><a href="/Kostagram/m/round"><img
							src="/Kostagram/m/image/icon/search.png" width="20" /></a></li>
					<li><a href="/Kostagram/m/write"><img
							src="/Kostagram/m/image/icon/camera.png" width="20" /></a></li>
					<li><a href="/Kostagram/m/mynews"><img
							src="/Kostagram/m/image/icon/info.png" width="20" /></a></li>
					<li><a
						href='/Kostagram/m/<%=session.getAttribute("nickname") %>'><img
							src="/Kostagram/m/image/icon/user.png" width="20" /></a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
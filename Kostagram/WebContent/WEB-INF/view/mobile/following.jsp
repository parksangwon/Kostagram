<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	List<HashMap> followingList = (List<HashMap>) request.getAttribute("followingList");
	System.out.println("followingList = " + followingList);
%>

<title>Kostagram</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<script src="jquery-mobile/jquery-1.6.4.js"></script>
<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
<script src="js/common.js"></script>
<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet"
	type="text/css" />

<body>
	<div id="following" data-role="page" data-theme="a">
		<div data-role="header">
			<table>
				<tr>
					<td><span
						style="height: 35px; font-size: 20px; color: #ffffff; line-height: 35px; text-align: left; background-color: transparent; border: 0px; text-shadow: 0px 0px 0px black; padding-left: 5px;">
							활동 </span></td>
				</tr>
			</table>
		</div>

		<div data-role="content">
			<div>
				<table width="100%">
					<tr>
						<td align="center"><a href="/Kostagram/m/following"
							data-transition="fade"
							style="text-decoration: none; color: #004879;">팔로잉</a></td>
						<td align="center"><a href="/Kostagram/m/mynews"
							data-transition="fade"
							style="text-decoration: none; color: #004879;">내게시물</a></td>
					</tr>
				</table>
			</div>
			<div>
				<%
					if (followingList != null && followingList.size() > 0) {
						for (HashMap news : followingList) {
							String readyn = (String) news.get("READYN");
							String seq_photo = (String) news.get("SEQ_PHOTO");
							String kind = (String) news.get("KIND");
							String to_nickname = (String) news.get("TO_NICKNAME");
							String from_nickname = (String) news.get("FROM_NICKNAME");
							String to_email = (String) news.get("TO_EMAIL");
							String from_email = (String) news.get("FROM_EMAIL");
							String from_profile = (String) news.get("FROM_PROFILE");
							String comment = "을 남기셨습니다.";
							if (kind.equals("C")) {
								kind = "에 댓글";
							} else if (kind.equals("L")) {
								kind = "을 좋아";
								comment = "하셨습니다.";

							}
				%>

				<br>
				<table width="100%" cellpadding="2" cellspacing="0">
					<tr>
						<%
							if (from_profile == null) {
						%>
						<td align="left" width="15%"><a href="./detail"><img
								src="/Kostagram/personalImg/profile.jpg" width="40"
								style="-webkit-border-radius: 100px; border-radius: 100px;" /></a></td>
						<%
							} else {
						%>
						<td align="left" width="15%"><a href="./detail"><img
								src="/Kostagram/personalImg/<%=from_email%>/<%=from_profile%>.jpg"
								width="40"
								style="-webkit-border-radius: 100px; border-radius: 100px;" /></a></td>
						<%
							}
						%>
						<td width="70%"><a href="#"
							style="text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;"><%=from_nickname%></a>님이
							<a href="#"
							style="text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;"><%=to_nickname%></a>님의
							사진<%=kind%><%=comment%></td>
						<td align="right" width="15%"><a href="./detail"><img
								src="/Kostagram/personalImg/<%=to_email%>/<%=seq_photo%>.jpg"
								width="40" /></a></td>
					</tr>
				</table>
				<img src="./image/line.png" width="100%">
				<%
					}
					} else {
				%>
				<br>
				<div align="center">팔로잉이 없습니다.</div>
				<%
					}
				%>
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
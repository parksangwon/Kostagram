<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

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
	<div id="following" data-role="page" data-theme="d">
		<div data-role="header" data-theme="b">
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
						<td align="center"><a href="/Kostagram/m/following" data-transition="fade">팔로잉</a></td>
						<td align="center"><a href="/Kostagram/m/mynews" data-transition="fade">내게시물</a></td>
					</tr>
				</table>
			</div>
			<div>
				<%
					// 임시로 활동 리스트 추가
					ArrayList follwingList = new ArrayList();
					for (int i = 0; i < 10; i++) {
						follwingList.add(i);
					}

					if (follwingList != null && follwingList.size() >= 0) {
						for (int i = 0; i < follwingList.size(); i++) {
				%>
				<table width="100%">
					<tr>
						<td align="center"><a href="./detail"><img
									src="./image/test.jpg" width="40"
									style="-webkit-border-radius: 100px; 
										border-radius: 100px;" /></a>
							<a href="#" style="text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;">성경쓰</a>님이 <a href="#"
							style="text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;">조영갱</a>
							님의 사진을 좋아합니다. <a href="./detail"><img
									src="./image/park.jpg" width="40" /></a></td>
					</tr>
				</table>
				<hr>
				<%
					}
					} else {
				%>
				<div>팔로잉이 없습니다.</div>
				<%
					}
				%>
			</div>
		</div>

		<div data-role="footer" data-theme="b" data-position="fixed">
			<div data-role="navbar" class="ui-btn-active">
				<ul>
					<li><a href="./"><img src="./image/icon/house.png"
							width="20" /></a></li>
					<li><a href="./round"><img src="./image/icon/search.png"
							width="20" /></a></li>
					<li><a href="#"><img src="./image/icon/camera.png"
							width="20" /></a></li>
					<li><a href="./mynews"><img src="./image/icon/info.png"
							width="20" /></a></li>
					<li><a href="./userpage"><img src="./image/icon/user.png"
							width="20" /></a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
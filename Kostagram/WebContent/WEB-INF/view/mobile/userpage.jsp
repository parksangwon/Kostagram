<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
    int count = 0;
    // 리스트 받아오기 전, 임시로 값 준 것
    ArrayList list = new ArrayList();
    for (int i = 0; i < 2; i++) {
		list.add(i);
    }
%>

<%
	String profileImg = (String)request.getAttribute("profileImg");
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
	<div data-role="header" data-theme="b">
		<table width="100%">
			<tr>
				<td><span
					style="height: 35px; font-size: 20px; color: #ffffff; line-height: 35px; text-align: left; background-color: transparent; border: 0px; text-shadow: 0px 0px 0px black; padding-left: 5px;">Park
						Sang Won </span></td>
				<td align="right"><a href="./option"><img
						src="./image/icon/settings.png" width="20"
						style="padding-right: 10px;" /></a></td>
			</tr>
		</table>
	</div>
	<div data-rol="content" align="center">
		<div>
			<table border="0" width="100%">
				<tr>
					<td rowspan="2" width="30%"><img width=200
						src="image/test.jpg"
						style="-webkit-border-radius: 100px; border-radius: 100px;" /></td>
					<td align="center">0<br>게시물
					</td>
					<td align="center">30<br> 팔로잉
					</td>
					<td align="center">30<br> 팔로워
					</td>
				</tr>
				<tr>
					<td align="center" colspan="3"
						onclick="$.mobile.changePage('./profileupdate')">프로필 수정</td>
				</tr>
				<tr>
					<td align="left" colspan="3">프로필 메시지</td>
				</tr>
			</table>
		</div>
	</div>

	<div>
		<table width="100%">
			<tr>
				<td onclick="location.href='./userpage#photogrid'" align="center">
					<img src="./image/icon/grid.png" width="20" />
				</td>
				<td onclick="location.href='./userpage#photolist'" align="center">
					<img src="./image/icon/stamp.png" width="20" />
				</td>
				<td onclick="location.href='./" align="center"><img
					src="./image/icon/pin.png" width="20" /></td>
				<td onclick="location.href='./phototaged" align="center"><img
					src="./image/icon/bookmark.png" width="20" /></td>
			</tr>
		</table>
	</div>
	<br>
	<div id="photoArea">
	</div>

	<div data-role="footer" data-theme="b" data-position="fixed">
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
				<li><a href="/Kostagram/m/userpage"><img
						src="/Kostagram/m/image/icon/user.png" width="20" /></a></li>
			</ul>
		</div>
	</div>

</body>
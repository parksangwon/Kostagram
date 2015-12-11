<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
				연락처에 있는 사람 중 3명이 Instagram을 <br> 사용 중입니다.
			</h3>
			<br> <font color="gray"><h5>친구들의 게시물 / 사진을 확인해보세요.</h5></font>
		</center>
		<div data-role="content">
			<form id="findphonenumber_form" method="post" action="#" align="center">
				<hr>
				+ 모두 팔로우
				<hr>
				<table width="100%" border="0">
					<tr>
						<td width="20%" height="5%"><img src=image/noimg.png></td>
						<td width="50%">abcdefg<br> 조영경
						</td>
						<td width="30%"><a href="#"><img src=image/follow.jpg></a>
						</td>
					</tr>

					<tr>
						<td width="20%" height="5%"><img src=image/noimg.png></td>
						<td width="50%">zxcasd123<br> 장정우
						</td>
						<td width="30%"><a href="#"><img src=image/follow.jpg></a>
						</td>
					</tr>

					<tr>
						<td width="20%" height="5%"><img src=image/noimg.png></td>
						<td width="50%">bbggedd56<br> 박상원
						</td>
						<td width="30%"><a href="#"><img src=image/following.jpg></a>
						</td>
					</tr>
				</table>
				<hr>
			</form>
		</div>

		<div data-role="footer" data-position="fixed">
			<div data-role="navbar" class="ui-btn-active">
				<ul>
					<li><a href="./"><image src="./image/icon/house.png"
								width="20" /></a></li>
					<li><a href="./round"><image src="./image/icon/search.png"
								width="20" /></a></li>
					<li><a href="#"><image src="./image/icon/camera.png"
								width="20" /></a></li>
					<li><a href="./mynews"><image src="./image/icon/info.png"
								width="20" /></a></li>
					<li><a href="./userpage"><image
								src="./image/icon/user.png" width="20" /></a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	<div id="search_place" data-role="page" data-theme="a">
		<div data-role="header">
			<table class="search">
				<tr>
					<td><img src="./image/icon/search.png" width="20"
							style="padding-left:10px;" /></td>
					<td><input type="text" id="input_place" name="input_place" placeholder="장소 검색"
						style="width: 300px; height: 35px; font-size: 15px; line-height: 35px; text-align: left; background-color: transparent; border: 0px; -webkit-border-radius: 0px; border-radius: 0px; box-shadow: 0 0 0px; text-shadow: 0px 0px;">
					</td>
				</tr>
			</table>
		</div>

		<div data-role="content">
			<div data-role="navbar">
				<ul>
					<li><a href="search_people" data-transition="fade">사람 검색</a></li>
					<li><a href="search_hashtag" data-transition="fade">해시태그 검색</a></li>
					<li><a href="search_place" data-transition="fade">장소 검색</a></li>
				</ul>
			</div>
		</div>
		
		<div id="search_resultArea">
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
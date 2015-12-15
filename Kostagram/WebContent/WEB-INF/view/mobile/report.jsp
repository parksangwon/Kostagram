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
	<div id="m_report" data-theme="a" data-role="page">
		<div data-role="header">
			<table width="100%">
				<tr>
					<td width="95%"><a href="#" data-rel="back"><image
								src="./image/icon/back.png" width="20"
								style="padding-left:10px;" /></a> <span
						style="height: 35px; font-size: 20px; color: #ffffff; line-height: 35px; text-align: left; background-color: transparent; border: 0px; text-shadow: 0px 0px 0px black; padding-left: 5px;">
							게시물 신고 </span></td>
				</tr>
			</table>
		</div>

		<div data-rol="content" align="center" id="m_report">
			<ul data-role="listview" data-theme="d">
				<li><a href="#"> 욕설</a></li>

				<li><a href="#"> 음란물</a></li>
					
				<li><a href="#"> 개인정보 유출</a></li>
					
			</ul>
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
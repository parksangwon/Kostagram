<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String pid = (String)request.getAttribute("pid");
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
	<div id="report" data-theme="a" data-role="page">
		<input type="hidden" name="reportPid" value="<%= pid %>"/>
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

		<div data-rol="content" align="center" id="reportBtn">
			<ul data-role="listview" data-theme="d">
				<li><a href="#" value="1"> 욕설</a></li>

				<li><a href="#" value="2"> 음란물</a></li>
					
				<li><a href="#" vaule="3"> 개인정보 유출</a></li>
					
			</ul>
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
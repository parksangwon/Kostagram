<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>


<title>jQuery Mobile</title>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

<script src="jquery-mobile/jquery-1.6.4.js"></script>
<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
<script src="js/common.js"></script>
<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet"
	type="text/css" />

<body>
	<div id="pwupdate" data-role="page" data-theme="a">
		
		<div data-role="header" data-theme="a">
			<table width="100%">
				<tr>
					<td>
						<a href="#" data-rel="back"><image
								src="./image/icon/back.png" width="20"
								style="padding-left:10px;" /></a> <span
						style="height: 35px; font-size: 20px; color: #ffffff; line-height: 35px; text-align: left; background-color: transparent; border: 0px; text-shadow: 0px 0px 0px black; padding-left: 5px;">
							비밀번호 변경 </span></td>
					<td align="right"><a href=""><img
							src="./image/icon/tick.png" width="20"
							style="padding-right: 10px;" /></a></td>
				</tr>
			</table>
		</div>
		
		<div data-role="content">
			
			<table>
				<p><font color="blue">&nbsp;&nbsp;&nbsp; 비밀번호를 재 설정 합니다.</font></p>
				<tr>
					<td height="60"><img src="./image/icon/lock.png"></td>
					<td width="99%"><input type="text" placeholder="현재 비밀번호" /></td>
				</tr>
				<tr>
					<td height="60"><img src="./image/icon/lock.png"></td>
					<td width="99%"><input type="text" placeholder="새 비밀번호" /></td>
				</tr>
				<tr>
					<td height="60"><img src="./image/icon/lock.png"></td>
					<td width="99%"><input type="text" placeholder="새 비밀번호 다시 입력" /></td>
				</tr>
			</table>

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
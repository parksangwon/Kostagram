<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0,user-scalable=no" />
		<TITLE>Kostagram</TITLE>

		<script src="jquery-mobile/jquery-1.6.4.js"></script>
		<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
		<script src="js/common.js"></script>
		<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet" type="text/css" />
		
	</head>
	<body>
		<div id="loginform" data-role="page" data-theme="e">
			
			<div data-role="header" data-theme="b">
				<h2>연락처 찾기</h2><a data-icon="check" class="ui-btn-right" data-iconpos="notext"></a>
				<a href="./option" data-icon="delete" class="ui-btn-left" data-iconpos="notext"></a>
			</div>
			
			<center><h3>연락처에 있는 사람 중 3명이 Instagram을 <br> 사용 중입니다.</h3><br>
			
					<font color="gray"><h5>친구들의 게시물 / 사진을 확인해보세요.</h5></font>
			</center>
			<div data-role="content">
				<form id="joinForm" method="post" action="#" align="center">
									<hr> + 모두 팔로우 <hr>
					<table width="100%" border="0">
						<tr>
							<td width="20%" height="5%">
								<img src=image/noimg.png>
							</td>
							<td width="50%">
								abcdefg<br>
								조영경
							</td>
							<td width="30%">
								<a href="#"><img src=image/follow.jpg></a>
							</td>
						</tr>
						
						<tr>
							<td width="20%" height="5%">
								<img src=image/noimg.png>
							</td>
							<td width="50%">
								zxcasd123<br>
								장정우
							</td>
							<td width="30%">
								<a href="#"><img src=image/follow.jpg></a>
							</td>
						</tr>
						
						<tr>
							<td width="20%" height="5%">
								<img src=image/noimg.png>
							</td>
							<td width="50%">
								bbggedd56<br>
								박상원
							</td>
							<td width="30%">
								<a href="#"><img src=image/following.jpg></a>
							</td>
						</tr>
					</table><hr>
				</form>
			</div>
			
			<div data-role="footer" data-theme="b">
				<div data-role="navbar" class="ui-btn-active">
					<ul>
						<li><a data-role="button" data-icon="home" data-iconpos="notext"></a></li>
						<li><a href="./search" data-role="button" data-icon="search" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="star" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="star" data-iconpos="notext"></a></li>
						<li><a href="./userpage" data-role="button" data-icon="info" data-iconpos="notext"></a></li>
					</ul>
				</div>
			</div>
		</div>	
	</body>
</html>
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
	<div id="emailCheck" data-role="page" data-theme="a">

		<div align="center">
			<br>
			<img src="./image/white_banner.png" width="200" />
		</div>

		<div id="emailcheck_content" data-role="content" align="center">
			<form id="joinForm" method="post" action="usercheck">
				<div align="center">
					<input type="text" id="email" name="email" placeholder="이메일" /> <br>
					<input type="button" id="emailCheckBtn" value="다음" data-inline="true" /> <br>
					<p align="center" id="check" style="color: red"></p>
				</div>
			</form>
		</div>

		<div data-role="footer" data-position="fixed">
			<div data-role="navbar" class="ui-btn-active">
				<ul>
					<li><a href="./" style="color: #dfe1e3;">이미 계정이 있으신가요? 로그인.</a></li>
				</ul>
			</div>
		</div>

	</div>
</body>
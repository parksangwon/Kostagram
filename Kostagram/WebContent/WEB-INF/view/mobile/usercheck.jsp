<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
    String email = (String) session.getAttribute("email");
			session.removeAttribute("email");
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
	<div id="userCheck" data-role="page" data-theme="e">

		<div align="center">
			<br> <img src="./image/banner.png" width="200" />
		</div>

		<div data-role="content">
			<form id="joinForm" method="post" action="findfriend">
				<div id="inputinfo" ]align="center">
					<input id="email" type="text" name="email" placeholder="email" value="<%=email%>" /> <br>
					<input id="name" type="text" name="name" placeholder="이름" /> <br>
					<input id="usercheck_nickname" type="text" name="nickname" placeholder="사용자 이름(닉네임)" /> <br>
					<input id="usercheck_pass" type="password" name="pass" placeholder="비밀번호" />	<br>
					<input type="button" id="joinbutton" value="가입하기" data-inline="true" /> <br>
					<p align="center" id="check" style="color: red"></p>
				</div>
			</form>
		</div>

		<div data-role="footer" data-theme="b" data-position="fixed">
			<div data-role="navbar" class="ui-btn-active">
				<ul>
					<li><a href="./"
						style="text-decoration: none; text-shadow: 0px 0px 0px; color: #fff; font-weight: normal;">이미
							계정이 있으신가요? 로그인.</a></li>
				</ul>
			</div>
		</div>

	</div>
</body>
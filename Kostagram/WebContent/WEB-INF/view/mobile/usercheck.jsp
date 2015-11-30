<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<TITLE>Kostagram</TITLE>
		
		<script src="jquery-mobile/jquery-1.6.4.js"></script>
		<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
		<script src="js/common.js"></script>
		<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet" type="text/css" />
		
	</head>
	<body>
		<div id="loginform" data-role="page" data-theme="e">

			<center><h1>Kostagram</h1></center>
			
			<div data-role="content">
				<form id="joinForm" method="post" action="#" align="center">
					<div data-role="fieldcontain" align="center">
						<input id="id" type="text" name="name" placeholder="이름"/> 
					</div>
					<div data-role="fieldcontain" align="center">
						<input id="nickname" type="text" name="nickname" placeholder="사용자 이름(닉네임)"/> 
					</div>
					<div data-role="fieldcontain" align="center">
						<input id="pw" type="text" name="pw" placeholder="비밀번호"/> 
					</div>				
					
					<div data-role="fieldcontain">
						<center>
							<input type="button" value="다음" data-inline="true"/>
						</center>
					</div>
				</form>
			</div>
			
			<div data-role="footer" data-theme="b">
				<center><a href="./login"><h4>이미 계정이 있으신가요? 로그인.</h4></a></center>
			</div>
		</div>	
	</body>
</html>
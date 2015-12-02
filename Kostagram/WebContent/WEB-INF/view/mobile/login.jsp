<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<TITLE>Kostagram</TITLE>
		
		<script src="jquery-mobile/jquery-1.6.4.js"></script>
		<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
		<script src="js/common.js"></script>
		<script src="js/emailcheck.js"></script>
		<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet" type="text/css" />
	
	</head>
	<body>
		<div id="loginform" data-role="page" data-theme="e">
			
			<script type="text/javascript">
				function login() 
				{
					var idInput = $('input:text[name=id]');
					var idValue = trim(idInput.val());
					if(idValue === "")
					{
						window.alert("E-mail ID를 입력하세요.");
						idInput.select();
						return false;
					}
					else if(idValue !== "")
					{
						if(isEmailChar(idValue))
						{
							window.alert("E-mail ID 에는 영문 소문자와 숫자, '@', '.' 만이 입력가능합니다.");
							idInput.select();
							return false;
						}
						if(idValue.indexOf("@") == -1 || idValue.indexOf(".") == -1 || idValue.indexOf(".")<idValue.indexOf("@") || isNum(idValue.charAt(0)))
						{
							window.alert("E-mail ID를 확인 하세요.");
							idInput.select();
							return false;
						}
					}
					
					var pw = $('input:password[name=pw]');
					if(pw.val() == "")
					{
						window.alert("비밀번호를 반드시 입력해야 합니다.");
						pw.focus();
						return false;
					}
					if(pw.val().length < 4 || pw.val().length > 20)
					{
						window.alert("비밀번호를 4자 이상 20자 이하 입니다.");
						pw.select();
						return false;
					}
				}
			</script>
			
			<center><h1>Kostagram</h1></center>
			
			<div data-role="content">
				<form id="loginForm" method="post" action="#" align="center">
					<div data-role="fieldcontain" align="center">
						<input id="id" type="text" name="id" placeholder="아이디"/> 
					</div>					
					<div data-role="fieldcontain" align="center">
						<input id="pw" type="password" name="pw" placeholder="비밀번호"/> 
					</div>					
					<div data-role="fieldcontain">
						<center>
							<input type="button" value="로그인" data-inline="true" onclick="login()"/>
						</center>
					</div>
				</form>
			</div>
			
			<div data-role="footer" data-theme="b">
				<center><a href="./emailcheck"><h4>계정이 없으신가요? 가입하기.</h4></a></center>
			</div>
		</div>	
	</body>
</html>
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
		<div data-role="page" data-theme="e">
		
			<script type="text/javascript" >
				function emailcheck() 
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
					
					$.mobile.changePage("./usercheck");
				}
			</script>
			
			<center><h1>Kostagram</h1></center>
	
			<div data-role="content">
				<form id="joinForm" method="post" action="#" align="center">
					<div data-role="fieldcontain" align="center">
						<input id="id" type="text" name="id" placeholder="이메일"/> 
					</div>					
					
					<div data-role="fieldcontain">
						<center>
							<input type="button" value="다음" data-inline="true" onclick="emailcheck()"/>
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
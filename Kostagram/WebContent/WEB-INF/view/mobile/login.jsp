<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0,user-scalable=no"/>
		<TITLE>Kostagram</TITLE>
		
		<script src="jquery-mobile/jquery-1.6.4.js"></script>
		<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
		<script src="js/common.js"></script>
		<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet" type="text/css" />
	
	</head>
	<body>
		<div id="loginform" data-role="page" data-theme="e">
			
			<script type="text/javascript">
				function login() 
				{
					var idInput = $('input:text[name=nickname]');
					var idValue = trim(idInput.val());
					var message = $('#check')
					if(idValue === "")
					{
						message.text("E-mail ID를 입력하세요.");
						idInput.select();
						return false;
					}

					
					var pw = $('input:password[name=pass]');
					if(pw.val() == "")
					{
						message.text("비밀번호를 반드시 입력해야 합니다.");
						pw.focus();
						return false;
					}
					if(pw.val().length < 4 || pw.val().length > 20)
					{
						message.text("비밀번호를 4자 이상 20자 이하 입니다.");
						pw.select();
						return false;
					}
					
					$.ajax({
		                type:'POST',
		                url:'login',
		                dataType:'text',
		                data:{nickname:idValue, pass:pw.val()},
		                success:function(text){
		                  if ( text === "loginSuccess" ) {
		                     location.href=""
		                  } else if ( text === "loginFail" ) {
		                     message.text("사용자의 이름과 비밀번호가 정확하지 않습니다.");
		                  }
		                },
		                error:function() {
		                   alert("error");
		                }
		             });
				}
			</script>
			
			<div align="center">
				<br>
				<image src="./image/banner.png" width="200"/>
			</div>
			
			<div data-role="content">
				<form id="loginForm" method="post" action="#" align="center">
					<div align="center">
						<input id="nickname" type="text" name="nickname" placeholder="사용자 이름"/> 
						<br>
						<input id="pass" type="password" name="pass" placeholder="비밀번호"/> 	
						<br>		
						<input type="button" value="로그인" data-inline="true" onclick="login()"/>
						<br>
						<p align="center" id="check" style="color:red"></p>
					</div>
				</form>
			</div>
			
			<div data-role="footer" data-theme="b" data-position="fixed">
				<div data-role="navbar" class="ui-btn-active">
					<ul>
						<li>
							<a href="./emailcheck" data-ajax="false" style="text-decoration:none;
							text-shadow: 0px 0px 0px;
							color: #fff;
							font-weight: normal;">계정이 없으신가요? 가입하기.</a>
						</li>
					</ul>
				</div>
			</div>

		</div>	
	</body>
</html>
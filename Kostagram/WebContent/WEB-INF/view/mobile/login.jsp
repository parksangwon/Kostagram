<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String email = (String) session.getAttribute("email");
	System.out.println("로그잉 jsp " + email);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0,user-scalable=no" />
<TITLE>Kostagram</TITLE>

<script src="jquery-mobile/jquery-1.6.4.js"></script>
<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
<script src="js/common.js"></script>
<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript">
	$(function() {
		$("[data-role=page]").live("pageshow", function(event) {
			if (this.id == "loginform") {
				alert("로그인 페이지입니다.");
			}
			else if (this.id == "emailCheck" ) {
				alert("이메일 체크 페이지 입니다.");
				alert("안녕");
				$('#emailCheckBtn').click(function() {
					var idInput = $('#email');
					//alert("idInput:"+idInput.get(0).id);
					alert(idInput.val());
					var idValue = trim(idInput.val());
					var message = $('[data-role=content] #check');

					if (idValue === "") {
						alert(typeof message);
						message.text("E-mail ID를 입력하세요.");
						idInput.select();
						return false;
					}

					if (idValue !== "") {
						if (isEmailChar(idValue)) {
							message.text("E-mail ID 에는 영문 소문자와 숫자, '@', '.' 만이 입력가능합니다.");
							idInput.select();
							return false;
						} else if (idValue.indexOf("@") == -1 || idValue.indexOf(".") == -1
								|| idValue.indexOf(".") < idValue.indexOf("@")
								|| isNum(idValue.charAt(0))) {
							message.text("E-mail ID를 확인 하세요.");
							idInput.select();
							return false;
						}
					}
					$.ajax({
						type : 'POST',
						url : 'validationEmail',
						dataType : 'text',
						data : {
							email : idValue
						},
						success : function(text) {
							if (text === "availableEmail") {
								location.href = "usercheck";
								// joinForm.submit();
							} else if (text === "existedEmail") {
								message.text("사용할 수 없는 이메일 입니다.");
							}
						},
						error : function() {
							alert("error");
						}
					});
				});
			} else {
				alert(this.id);
			}
		});
		$('#loginBtn').click(function() {
			var idInput = $('input:text[name=nickname]');
			var idValue = trim(idInput.val());
			var message = $('#check');
			if (idValue === "") {
				message.text("E-mail ID를 입력하세요.");
				idInput.select();
				return false;
			}

			var pw = $('input:password[name=pass]');
			if (pw.val() == "") {
				message.text("비밀번호를 반드시 입력해야 합니다.");
				pw.focus();
				return false;
			}
			if (pw.val().length < 4 || pw.val().length > 20) {
				message.text("비밀번호를 4자 이상 20자 이하 입니다.");
				pw.select();
				return false;
			}

			$.ajax({
				type : 'POST',
				url : 'login',
				dataType : 'text',
				data : {
					nickname : idValue,
					pass : pw.val()
				},
				success : function(text) {
					if (text === "loginSuccess") {
						location.href = "/Kostagram/m"
					} else if (text === "loginFail") {
						message.text("사용자의 이름과 비밀번호가 정확하지 않습니다.");
					}
				},
				error : function() {
					alert("error");
				}
			});
		});
	});

	
</script>
</head>
<body>
	<div id="loginform" data-role="page" data-theme="e">
		<div align="center">
			<br>
			<img src="./image/banner.png" width="200" />
		</div>

		<div data-role="content">
			<form id="loginForm" method="post" action="#">
				<div align="center">
					<input id="nickname" type="text" name="nickname"
						placeholder="사용자 이름" /> <br> <input id="pass"
						type="password" name="pass" placeholder="비밀번호" /> <br>
						<input id="loginBtn" type="button" value="로그인" data-inline="true" />
					<br>
					<p align="center" id="check" style="color: red"></p>
				</div>
			</form>
		</div>

		<div data-role="footer" data-theme="b" data-position="fixed">
			<div data-role="navbar" class="ui-btn-active">
				<ul>
					<li><a href="./emailcheck"
						style="text-decoration: none; text-shadow: 0px 0px 0px; color: #fff; font-weight: normal;">계정이
							없으신가요? 가입하기.</a></li>
				</ul>
			</div>
		</div>

	</div>
</body>
</html>
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

<script type="text/javascript">
	$(function() {
		var joinForm = $("#joinForm");

		$('#joinbutton')
				.click(
						function() {

							var idInput = $('input:text[name=email]');
							var idValue = trim(idInput.val());
							var message = $('#check')

							if (idValue === "") {
								message.text("E-mail ID를 입력하세요.");
								idInput.select();
								return false;
							} else if (idValue !== "") {
								if (isEmailChar(idValue)) {
									message
											.text("E-mail ID 에는 영문 소문자와 숫자, '@', '.' 만이 입력가능합니다.");
									idInput.select();
									return false;
								} else if (idValue.indexOf("@") == -1
										|| idValue.indexOf(".") == -1
										|| idValue.indexOf(".") < idValue
												.indexOf("@")
										|| isNum(idValue.charAt(0))) {
									message.text("E-mail ID를 확인 하세요.");
									idInput.select();
									return false;
								}
							}
							var idInputName = $('input:text[name=name]');
							var idValueName = trim(idInputName.val());

							if (idValueName === "") {
								message.text("이름을 입력해 주세요.");
								idInputName.select();
								return false;
							}

							var idInputNickName = $('input:text[name=nickname]');
							var idValueNickName = trim(idInputNickName.val());
							if (idValueNickName === "") {
								message.text("사용자이름(닉네임) 을 입력해 주세요.");
								idInputNickName.select();
								return false;
							}

							var pass = $('input:password[name=pass]');
							if (pass.val() == "") {
								message.text("비밀번호를 반드시 입력해야 합니다.");
								pass.focus();
								return false;
							}
							if (pass.val().length < 4 || pass.val().length > 20) {
								message.text("비밀번호를 4자 이상 20자 이하 입니다.");
								pass.select();
								return false;
							}

							$
									.ajax({
										type : 'POST',
										url : 'validationNickname',
										dataType : 'text',
										data : {
											email : idValue,
											name : idValueName,
											nickname : idValueNickName,
											pass : pass.val()
										},
										success : function(text) {
											if (text === "joinSuccess") {
												alert("성공적으로 가입되었습니다. 로그인 페이지로 이동합니다.");
												location.href = "/Kostagram/m/";
											} else if (text === "existedEmail") {
												message
														.text("사용할 수 없는 이메일 입니다.");
											} else if (text === "existedNickname") {
												message
														.text("사용할 수 없는 닉네임 입니다.");
											} else if (text === "DBerror") {
												message.text("DB error");
											}
										},
										error : function() {
											alert("error");
										}
									});
						});
	});
</script>
<body>
	<div data-role="page" data-theme="e">

		<div align="center">
			<br> <img src="./image/banner.png" width="200" />
		</div>

		<div data-role="content">
			<form id="joinForm" method="post" action="findfriend">
				<div align="center">
					<input id="email" type="text" name="email" placeholder="email"
						value="<%=email%>" /> <br> <input id="name" type="text"
						name="name" placeholder="이름" /> <br> <input id="nickname"
						type="text" name="nickname" placeholder="사용자 이름(닉네임)" /> <br>
					<input id="pass" type="password" name="pass" placeholder="비밀번호" />
					<br> <a><input type="button" id="joinbutton" value="가입하기"
						data-inline="true" /></a> <br>
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
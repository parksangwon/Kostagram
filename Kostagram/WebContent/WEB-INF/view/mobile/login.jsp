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
		$("[data-role=page]")
				.live(
						"pageshow",
						function(event) {
							// emailcheck 시작
							if (this.id == "loginform") {
							} else if (this.id == "emailCheck") {
								$('#emailCheckBtn')
										.click(
												function() {
													var idInput = $('[data-role=content] #email');
													var idValue = trim(idInput
															.val());
													var message = $('[data-role=content] #check');

													if (idValue === "") {
														message
																.text("E-mail ID를 입력하세요.");
														idInput.select();
														return false;
													}
													if (idValue !== "") {
														if (isEmailChar(idValue)) {
															message
																	.text("E-mail ID 에는 영문 소문자와 숫자, '@', '.' 만이 입력가능합니다.");
															idInput.select();
															return false;
														} else if (idValue
																.indexOf("@") == -1
																|| idValue
																		.indexOf(".") == -1
																|| idValue
																		.indexOf(".") < idValue
																		.indexOf("@")
																|| isNum(idValue
																		.charAt(0))) {
															message
																	.text("E-mail ID를 확인 하세요.");
															idInput.select();
															return false;
														}
													}
													$
															.ajax({
																type : 'POST',
																url : 'validationEmail',
																dataType : 'text',
																data : {
																	email : idValue
																},
																success : function(
																		text) {
																	if (text === "availableEmail") {
																		$.mobile
																				.changePage("usercheck");
																	} else if (text === "existedEmail") {
																		message
																				.text("사용할 수 없는 이메일 입니다.");
																	}
																},
																error : function() {
																	alert("error");
																}
															});
												});
							}
							// emailcheck 끝
							// usercheck 시작
							else if (this.id == "userCheck") {
								$('#joinbutton')
										.click(
												function() {
													var idInput = $('[data-role=content] #email');
													var idValue = trim(idInput
															.val());
													var message = $('[data-role=content] #check');

													if (idValue === "") {
														message
																.text("E-mail ID를 입력하세요.");
														idInput.select();
														return false;
													} else if (idValue !== "") {
														if (isEmailChar(idValue)) {
															message
																	.text("E-mail ID 에는 영문 소문자와 숫자, '@', '.' 만이 입력가능합니다.");
															idInput.select();
															return false;
														} else if (idValue
																.indexOf("@") == -1
																|| idValue
																		.indexOf(".") == -1
																|| idValue
																		.indexOf(".") < idValue
																		.indexOf("@")
																|| isNum(idValue
																		.charAt(0))) {
															message
																	.text("E-mail ID를 확인 하세요.");
															idInput.select();
															return false;
														}
													}
													var idInputName = $('[data-role=content] #name');
													var idValueName = trim(idInputName
															.val());

													if (idValueName === "") {
														message
																.text("이름을 입력해 주세요.");
														idInputName.select();
														return false;
													}

													var idInputNickName = $('[data-role=content] #usercheck_nickname');
													var idValueNickName = trim(idInputNickName
															.val());
													if (idValueNickName === "") {
														message
																.text("사용자이름(닉네임) 을 입력해 주세요.");
														idInputNickName
																.select();
														return false;
													}

													var pass = $('[data-role=content] #usercheck_pass');
													if (pass.val() == "") {
														message
																.text("비밀번호를 반드시 입력해야 합니다.");
														pass.focus();
														return false;
													}
													if (pass.val().length < 4
															|| pass.val().length > 20) {
														message
																.text("비밀번호를 4자 이상 20자 이하 입니다.");
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
																	pass : pass
																			.val()
																},
																success : function(
																		text) {
																	if (text === "joinSuccess") {
																		alert("성공적으로 가입되었습니다. 로그인 페이지로 이동합니다.");
																		$.mobile
																				.changePage("/Kostagram/m/");
																	} else if (text === "existedEmail") {
																		message
																				.text("사용할 수 없는 이메일 입니다.");
																	} else if (text === "existedNickname") {
																		message
																				.text("사용할 수 없는 닉네임 입니다.");
																	} else if (text === "DBerror") {
																		message
																				.text("DB error");
																	}
																},
																error : function() {
																	alert("error");
																}
															});
												});
							}
							// usercheck 끝
							else if (this.id == 'userpage') {
								// 버튼마다 ajax통신 다르게
								$(document).ready(function(){
									$.ajax({
										type : 'POST',
										url : 'getMyPhotoList',
										dataType : 'text',
										data : {
											type : 'grid'
										},
										success : function(text){
											if ( $('#photoArea > div:first-child ').get(0) != null ) {
												$('#photoArea > div:first-child ').get(0).remove();
											}
											$('#userpage > #photoArea').append(text);	
										}
									});
								});
								$('#userpage .getPhotoList').each(function(){
									$(this).click(function(){
										var option = $(this).attr("value");
										$.ajax({
											type : 'POST',
											url : 'getMyPhotoList',
			 								dataType : 'text',
											data : {
												type : option
											},
											success : function(text){
												alert($('#photoArea').find("#photoList").get(0).id+"삭제시작");
												$('#photoArea').find("#photoList").get(0).remove();
												alert("삭제 끝");
												alert($('#userpage > #photoArea').id+"추가 시작");
												$('#userpage > #photoArea').append(text);
												alert("추가 끝");
											}
										});
									});
								});
							}
							
							//profileupdate 시작
							else if (this.id == "profileupdate") {
								alert("profileupdate에 들어옴");
								$('#submit').click(function() {
														
									alert("Aaa");
									var nameValue = $('#name').val();
									var nicknameValue = $('#nickname2').val();
									var messageValue = $('#message').val();
									var mobileValue = $('#mobile').val();
									var genderValue = $('#gender').val();
									
									var  resultMessage= $('#resultMessage');
									
									$.ajax({
										type:'POST',
										url:'ajaxprofileupdate',
										dataType:'text',
										data:{name:nameValue, nickname:nicknameValue, message:messageValue, mobile:mobileValue, gender:genderValue},
										success:function(text){
										  if ( text === "updateSuccess" ) {
											  resultMessage.text("성공적으로 업데이트 하였습니다.");
										  } else if ( text === "updateFail" ) {
											  resultMessage.text("업데이트 도중 에러가 발생하였습니다.");
										  } else if ( text === "nicknameduplication")
											  {
											  	$('#nickname').focus();
											  	resultMessage.text("중복된 닉네임 입니다.");
											  }
										},
										error:function() {
											alert("error");
										}
									});
								});
							}
							//profileupdate끝
						});
		// login 시작
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
						$.mobile.changePage("/Kostagram/m");
					} else if (text === "loginFail") {
						message.text("사용자의 이름과 비밀번호가 정확하지 않습니다.");
					}
				},
				error : function() {
					alert("error");
				}
			});
		});
		// login 끝
	});
</script>

</head>
<body>
	<div id="loginform" data-role="page" data-theme="a">
		<div align="center">
			<br> <img src="./image/white_banner.png" width="200" />
		</div>

		<div data-role="content">
			<form id="login_form" method="post" action="#">
				<div align="center">
					<input id="nickname" type="text" name="nickname"
						placeholder="사용자 이름" /> <br> <input id="pass"
						type="password" name="pass" placeholder="비밀번호" /> <br> <input
						id="loginBtn" type="button" value="로그인" data-inline="true" /> <br>
					<p align="center" id="check" style="color: red"></p>
				</div>
			</form>
		</div>

		<div data-role="footer" data-position="fixed">
			<div data-role="navbar" class="ui-btn-active">
				<ul>
					<li><a href="./emailcheck" style="color: #DFE1E3;">계정이 없으신가요? 가입하기.</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
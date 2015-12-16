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
							//비밀번호 변경 시작							
							$('#changebutton').click(function() {								
					
								var nowpass = $('[data-role=content] #nowpass');
								var changepass1 = $('[data-role=content] #changepass1');
								var changepass2 = $('[data-role=content] #changepass2');
								var resultMessage = $(".alert-red");
								
								var message = $('[data-role=content] #message');
								if (nowpass.val() == "") {
									message
											.text("현재 비밀번호를 입력해주세요");
									nowpass.focus();
									return false;
								}
								
								else if (nowpass.val().length < 4
										|| nowpass.val().length > 20  ) {
									message
											.text("비밀번호는 4자 이상 20자 이하 입니다.");
									nowpass.focus();
									return false;
								}
																	
								if (changepass1.val() == "") {
									message
											.text("새 비밀번호를 입력해주세요");
									nowpass.focus();
									return false;
								}
								
								if (changepass2.val() == "") {
									message
											.text("새 비밀번호를 입력해주세요");
									nowpass.focus();
									return false;
								}
								
								else if (changepass1.val().length < 4
										|| changepass1.val().length > 20 ||changepass2.val().length < 4
										|| changepass2.val().length > 20  ) {
									message
											.text("비밀번호는 4자 이상 20자 이하 입니다.");
									return false;
								}
								
								if(changepass1.val() != changepass2.val())
									{
										message.text("새 비밀번호가 서로 다릅니다.")
										return false;
									}
								
								var nowpw = $('#nowpass').val();
								var changepw = $('#changepass1').val();
								
								$.ajax({
									type: 'POST',
									url: 'ajaxpwupdate',
									dataType: 'text',
									data:{nowpw:nowpw, changepw:changepw} ,
									success:function(text) {
										if (text === "updateSuccess") {
											resultMessage.text("성공적으로 비밀번호가 변경되었습니다.");
											resultMessage.css("color", "#468847");
											resultMessage.css("background-color", "#dff0d8");
											resultMessage.css("border-color", "#d6e9c6");
					
										} 
										else if(text === "updateFail"){
											resultMessage.text("비밀번호 변경 실패 . 입력하신 현재 비밀번호가 일치하지 않습니다");
											resultMessage.css("color", "red");
											resultMessage.css("background-color", "#dff0d8");
											resultMessage.css("border-color", "#d6e9c6");
										}
										}
								});
								
					
						});
						//비밀번호 변경 끝
						
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
							
							else if (this.id == 'timeline') {
								$(document).ready(function(){
									$.ajax({
										type : 'POST',
										url : '/Kostagram/m/timeline',
										dataType : 'html',
										success : function(data) {
											if ( $('#photoArea > #photoList') != null ) {
												$('#photoArea').empty();
											}
											$('#timeline > #photoArea').html(data);	
											$('#timeline > #photoArea #heartBtn').each(function(){
												
												
												$(this).click(function(){
													
													
													
													var test = $(this);
													var state;
													var seq_photo = test.attr('value');	
													var src = $(this).attr('src');
													if(src==='m/image/icon/heart.png')
													{
														state = "unlike";
														src = 'm/image/icon/heart2.png';
													}
													else
													{
														state= "like";
														src ='m/image/icon/heart.png';
													}
													
													$.ajax({
														type : 'POST',
														url : 'm/like',
														dataType : 'text',
														data : {
															state : state ,
															seq_photo : seq_photo
														},
														success : function(
																text){
															
															if ( text === "like") {
															     test.attr('src', src);
															     
												     		} else if ( text === "unlike" ) {
															     test.attr('src', src);
															     
													      	} else if ( text === "fail" ) {
															     
															}
															
														},
														error : function() {
															alert("error");
														}
													});
													
													
												});
												
											});
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
									var userpage_email = $('input:hidden[name=userpage_email]');
									$.ajax({
										type : 'POST',
										url : 'getMyPhotoList',
										dataType : 'html',
										data : {
											email : userpage_email.val(),
											type : 'grid'
										},
										success : function(data){
											if ( $('#photoArea > #photoList') != null ) {
												$('#photoArea').empty();
											}
											$('#userpage > #photoArea').html(data);	
										},
										error : function() {
											alert("error");
										}
									});
									

									$('#followBtn').click(function(){
										
									var followState = $('#followBtn').val();
									var email = $('input:hidden[name=userpage_email]').val();
										
									$.ajax({
							    			type:'POST',
							    			url:'userpage',
							    			dataType:'html',
							    			data:{
							    				from_email: <%=(String) session.getAttribute("email")%>,
							    				to_email: email,
												followState : followState
										},
										success : function(html) {
											
											

											if (text === "following") {
												
												$('#followBtn').attr("value", "F");
												

											} else if (text === 'follow') {
												
												$('#followBtn').attr("value", "UF");
											}
										},

										error : function() {
											alert("error");											}
									});
								});
								});
								$('#userpage .getPhotoList').each(function(){
									$(this).click(function(){
										var userpage_email = $('input:hidden[name=userpage_email]');
										var option = $(this).attr("value");
										$.ajax({
											type : 'POST',
											url : 'getMyPhotoList',
			 								dataType : 'html',
											data : {
												email : userpage_email.val(),
												type : option
											},
											success : function(data){
												$('#photoArea').empty();
												$('#userpage > #photoArea').html(data);
											},
											error : function() {
												alert("error");
											}
										});
									});
								});
							}
							
							//profileupdate 시작
							else if (this.id == "profileupdate") {
								//alert("profileupdate에 들어옴");
								$('#submit').click(function() {
														
									//alert("Aaa");
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
							}// profileupdate끝
							
							else if (this.id == "reportPage") {
								$('#reportPage #report').click(function(){
									$.ajax({
										type: 'POST',
										url: '../reportPhoto',
										dataType: 'html',
										data: {
											// 신고문항
											// 신고할 사진
										},
										success: function(text) {
											
										}
									});
								});
							}
							
							// search_people 시작
							else if (this.id == "search_people") {
								
								$("#input_people").keydown(function(){
									setTimeout(function() {
										var searchValue = trim($('#input_people').val());
										if(searchValue!=null && searchValue!="") {
											$.ajax({
												type:'POST',
												url:'ajaxsearch_people',
												dataType:'text',
												data:{input_people:searchValue},
												success:function(data){
													$('#search_resultArea').empty();
													$('#search_people > #search_resultArea').html(data);
												},
												error:function() {
													alert("error");
												}
											});
										} else {
											$('#search_resultArea').empty();
										}
									}, 250);
								});
							}
							// search_people 끝
							// search_hashtag 시작
							else if (this.id == "search_hashtag") {
								
								$("#input_hashtag").keydown(function(){
									setTimeout(function() {
										var searchValue = trim($('#input_hashtag').val());
										if(searchValue!=null && searchValue!="") {
											$.ajax({
												type:'POST',
												url:'ajaxsearch_hashtag',
												dataType:'text',
												data:{input_hashtag:searchValue},
												success:function(data){
													$('#search_resultArea').empty();
													$('#search_hashtag > #search_resultArea').html(data);
													$('.result_hashtag').click(function() {
														var selectValue = trim($(this).text());
														$.mobile.changePage("/Kostagram/m/hashtag/"+selectValue);
													});					
												},
												error:function() {
													alert("error");
												}
											});
										} else {
											$('#search_resultArea').empty();
										}
									}, 250);
								});
							}
							// search_hashtag 끝
							// search_result 시작
							else if (this.id == "search_result") {
								$(document).ready(function(){
									var search_hashtag = $('input:hidden[name=hashtag]');
									var selectValue = search_hashtag.val();
									if(selectValue!=null && selectValue!="") {
										$.ajax({
											type:'POST',
											url:'../ajaxselect_hashtag',
											dataType:'text',
											data:{select_hashtag:selectValue},
											success:function(data){
												$('#photoArea').empty();
												$('#search_result > #photoArea').html(data);	
											},
											error:function() {
												alert("error");
											}
										});
									}
								});
							}
							// search_result 끝
							else if (this.id == "report") {
								$('#reportBtn > ul > li a').each(function() {
									$(this).click(function(){
										var reportValue = $(this).attr("value");
										var reportPid = $('#report > input:hidden[name=reportPid]').val();
										$.ajax({
											type: 'POST',
											url: 'reportphoto',
											dataType: 'text',
											data: {
												rid: reportValue,
												pid: reportPid
											},
											success: function(data) {
												alert("성공적으로 신고가 접수되었습니다. 게시물이 부적합한지 확인 후 게시물을 삭제하도록 하겠습니다.");
											},
											error: function() {
												alert("error");
											}
										});
									});
								});
							}
							
							//comment (댓글)
							else if (this.id == "comment") {
								
								$('#submit').click(function() {
									var comment_val = $('input:text[name=comment]').val();
									var seq_photo_val=$('input:hidden[name=seq_photo]').val();

									if(trim(comment_val) != ""){
										$.ajax({
											type:'POST',
											url:'ajaxcomment',
											dataType:'html',
											data:{content:comment_val, seq_photo:seq_photo_val},
											success:function(html){
												$('#rrresultMessage').html(html);
												
											},
											error:function() {	
											}
										});
									}
								});
							}//댓글 끝
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
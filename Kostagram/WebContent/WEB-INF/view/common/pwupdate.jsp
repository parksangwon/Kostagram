<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kostagram.service.beans.UserInfoVO"%>
<%@ page import="java.util.*"%>

<%
	UserInfoVO user = (UserInfoVO) request.getAttribute("userinfo");
%>
<!DOCTYPE html>
<html lang="ko" class="no-js logged-in ">
<head>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>비밀번호 변경 &bull; Kostagram</title>


<script>
	$(function() {
		$('.alerts').hide();
	});
	
	

	function pwCheck() {
		var oldPw = $("#id_old_password").val();
		var newPw1 = $("#id_new_password1").val();
		var newPw2 = $("#id_new_password2").val();
		var resultMessage = $(".alert-red");

		alert(oldPw);
		alert(newPw1);
		alert(newPw2);

		$.ajax({
			type : 'POST',
			url : 'ajaxpwupdate',
			dataType : 'text',
			data : {
				oldPw : oldPw,
				newPw1 : newPw1,
				newPw2 : newPw2
			},
			success : function(text) {
				alert(text);
				$('.alerts').show();
				if (text === "updateSuccess") {
					resultMessage.text("성공적으로 비밀번호가 변경되었습니다.");
					
				} else if (text === "updatefail") {
					resultMessage.text("새로운 비밀번호가 서로 다릅니다.");
				} else if (text === "empty1") {
					$('#id_old_password').focus();
					resultMessage.text("기존의 비밀번호를 입력하세요");	
				} else if (text === "empty2") {
					resultMessage.text("새로운 비밀번호를 입력하세요");
				} else if (text === "pw1pw2fail") {
					resultMessage.text("새로운비밀번호가 서로다릅니다.");
				} else if (text === "fail") {
					resultMessage.text("기존의 비밀번호가 다릅니다.");
				} 
			},
			error : function() {
				alert("error");
			}
		});
	}
</script>
<script
	src="//instagramstatic-a.akamaihd.net/bluebar/5829dff/scripts/webfont.js"
	type="text/javascript" async></script>

<style type="text/css">
@font-face {
	font-family: 'proxima-nova';
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-bold-webfont.eot');
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-bold-webfont.eot?#iefix')
		format("embedded-opentype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-bold-webfont.woff')
		format("woff"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-bold-webfont.ttf')
		format("truetype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-bold-webfont.svg#ProximaNovaBold')
		format("svg");
	font-weight: bold;
	font-style: normal;
}

@font-face {
	font-family: 'proxima-nova';
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-boldit-webfont.eot');
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-boldit-webfont.eot?#iefix')
		format("embedded-opentype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-boldit-webfont.woff')
		format("woff"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-boldit-webfont.ttf')
		format("truetype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-boldit-webfont.svg#ProximaNovaBoldItalic')
		format("svg");
	font-weight: bold;
	font-style: italic;
}

@font-face {
	font-family: 'proxima-nova';
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-reg-webfont.eot');
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-reg-webfont.eot?#iefix')
		format("embedded-opentype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-reg-webfont.woff')
		format("woff"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-reg-webfont.ttf')
		format("truetype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-reg-webfont.svg#ProximaNovaRegular')
		format("svg");
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'proxima-nova';
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-regit-webfont.eot');
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-regit-webfont.eot?#iefix')
		format("embedded-opentype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-regit-webfont.woff')
		format("woff"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-regit-webfont.ttf')
		format("truetype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-regit-webfont.svg#ProximaNovaRegularItalic')
		format("svg");
	font-weight: normal;
	font-style: italic;
}

@font-face {
	font-family: 'proxima-nova';
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-sbold-webfont.eot');
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-sbold-webfont.eot?#iefix')
		format("embedded-opentype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-sbold-webfont.woff')
		format("woff"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-sbold-webfont.ttf')
		format("truetype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-sbold-webfont.svg#ProximaNovaSemibold')
		format("svg");
	font-weight: 600;
	font-style: normal;
}
</style>

<style type="text/css">
@font-face {
	font-family: 'proxima-nova';
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-light-webfont.eot');
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-light-webfont.eot?#iefix')
		format("embedded-opentype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-light-webfont.woff')
		format("woff"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-light-webfont.ttf')
		format("truetype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-light-webfont.svg#ProximaNovaLight')
		format("svg");
	font-weight: 300;
	font-style: normal;
}
</style>




<meta name="robots" content="noimageindex">

<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">



<meta id="viewport" name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1, minimum-scale=1, maximum-scale=1">







<link rel="apple-touch-icon-precomposed"
	href="//instagramstatic-a.akamaihd.net/bluebar/5829dff/images/ico/apple-touch-icon-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="//instagramstatic-a.akamaihd.net/bluebar/5829dff/images/ico/apple-touch-icon-72x72-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="//instagramstatic-a.akamaihd.net/bluebar/5829dff/images/ico/apple-touch-icon-114x114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="//instagramstatic-a.akamaihd.net/bluebar/5829dff/images/ico/apple-touch-icon-144x144-precomposed.png">


<link href="./CSS/edit.css" type="text/css" rel="stylesheet"></link>



<script
	src="//instagramstatic-a.akamaihd.net/bluebar/5829dff/scripts/jquery.js"
	type="text/javascript"></script>
<script
	src="//instagramstatic-a.akamaihd.net/bluebar/5829dff/scripts/bluebar.js"
	type="text/javascript"></script>
<script
	src="//instagramstatic-a.akamaihd.net/bluebar/5829dff/scripts/navigation.js"
	type="text/javascript"></script>


</head>
<body class="sidebar-page page-accounts">


	<div class="root">

		<div class="page">


			<header class="top-bar top-bar-new">
				<div class="top-bar-wrapper">
					<center>
						<img src="img/web/KakaoTalk_20151204_145110288.png">
					</center>
					<div class="top-bar-left">
						<ul class="top-bar-actions">
							<li><a class="top-bar-home" href="/Kostagram" label=홈><i></i></a>
							</li>
						</ul>
					</div>


					<div class="top-bar-right account-state" id="top_bar_right">
						<ul class="top-bar-actions">


							<li id="link_profile" class="link-profile has-dropdown"><a
								href="javascript:;"> <span
									class="img img-outset current-user-avatar"
									style="background-image: url(${profile_img});"> <img
										src="${profile_img}" onerror="imageFallback(this);" alt="" />
										<b></b>
								</span> <strong>${nickname}</strong>
							</a>

								<div class="dropdown">
									<i></i>

									<ul role="navigation">
										<li><a href="#">프로필 보기</a></li>
										<li><a href="/Kostagram/profileupdate">프로필 편집</a></li>
										<li><a href="/Kostagram/logout">로그아웃</a></li>
									</ul>
								</div></li>

						</ul>
					</div>

				</div>
			</header>
			<!-- .top-bar -->




			<div class="sidebar">
				<div class="wrapper">
					<nav class="sidebar-nav">
						<div class="sidebar-content">

							<h2>
								<i></i>회원님의 계정<span class="separator"> &bull; </span><span
									class="subtitle"></span>
							</h2>
							<ul>
								<li class="active"><a href="/Kostagram/profileupdate">

										프로필 편집 <i class="disclosure"></i>
								</a></li>
								<li><a href="/Kostagram/pwupdate"> 비밀번호 변경 <i
										class="disclosure"></i>

								</a></li>

								<li><a href="/Kostagram/logout"> 로그아웃 <i
										class="disclosure"></i>

								</a></li>
								<li><a href="/Kostagram/report"> 신고관리 <i
										class="disclosure"></i>

								</a></li>
							</ul>

						</div>
					</nav>
				</div>
			</div>
			<div class="main">
				<div class="wrapper">
					<section class="nav-page-content" role="main">


						<header>
							<h1>비밀번호 변경</h1>
						</header>

						<div id="alerts" class="alerts">
					    	<p id="alert-red" class="alert-red"></p>
						</div>



						<form method="POST" accept-charset="utf-8"
							class="adjacent bordered wide" action="/pwupdate">
							<p>
								<label for="id_old_password">기존 비밀번호:</label> <input
									type="password" name="old_password" id="id_old_password" />
							</p>
							<p>
								<label for="id_new_password1">새 비밀번호:</label> <input
									type="password" name="new_password1" id="id_new_password1" />
							</p>
							<p>
								<label for="id_new_password2">새 비밀번호 확인:</label> <input
									type="password" name="new_password2" id="id_new_password2" />
							</p>
							<p class="form-actions">
								<input type="button" class="button-green" value="비밀번호 변경"
									onclick="pwCheck()">
							</p>
						</form>
						<script>
							document.getElementById('id_old_password').focus();
						</script>


					</section>
				</div>
				<!-- .main -->
			</div>
			<!-- .main -->


		</div>
		<!-- .page -->


		<div id="reactModalMountPoint"></div>
	</div>
	<!-- .root -->










</body>
</html>
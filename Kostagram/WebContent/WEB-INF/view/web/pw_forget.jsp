<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html
	class="js not-logged-in wf-proximanova-n3-active wf-proximanova-n4-active wf-proximanova-n6-active wf-proximanova-n7-active wf-active"
	lang="ko">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>비밀번호 재설정 • Instagram</title>

<script src="//connect.facebook.net/en_US/fbevents.js" async=""></script>
<script type="text/javascript">
	WebFontConfig = {
		custom : {
			families : [ 'proxima-nova:n3,n4,n6,n7' ],
		}
	};
</script>
<script
	src="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/scripts/webfont.js"
	type="text/javascript" async=""></script>

<style type="text/css">
@font-face {
	font-family: 'proxima-nova';
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-bold-webfont.eot');
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-bold-webfont.eot?#iefix')
		format("embedded-opentype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-bold-webfont.woff')
		format("woff"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-bold-webfont.ttf')
		format("truetype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-bold-webfont.svg#ProximaNovaBold')
		format("svg");
	font-weight: bold;
	font-style: normal;
}

@font-face {
	font-family: 'proxima-nova';
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-boldit-webfont.eot');
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-boldit-webfont.eot?#iefix')
		format("embedded-opentype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-boldit-webfont.woff')
		format("woff"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-boldit-webfont.ttf')
		format("truetype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-boldit-webfont.svg#ProximaNovaBoldItalic')
		format("svg");
	font-weight: bold;
	font-style: italic;
}

@font-face {
	font-family: 'proxima-nova';
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-reg-webfont.eot');
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-reg-webfont.eot?#iefix')
		format("embedded-opentype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-reg-webfont.woff')
		format("woff"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-reg-webfont.ttf')
		format("truetype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-reg-webfont.svg#ProximaNovaRegular')
		format("svg");
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'proxima-nova';
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-regit-webfont.eot');
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-regit-webfont.eot?#iefix')
		format("embedded-opentype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-regit-webfont.woff')
		format("woff"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-regit-webfont.ttf')
		format("truetype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-regit-webfont.svg#ProximaNovaRegularItalic')
		format("svg");
	font-weight: normal;
	font-style: italic;
}

@font-face {
	font-family: 'proxima-nova';
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-sbold-webfont.eot');
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-sbold-webfont.eot?#iefix')
		format("embedded-opentype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-sbold-webfont.woff')
		format("woff"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-sbold-webfont.ttf')
		format("truetype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-sbold-webfont.svg#ProximaNovaSemibold')
		format("svg");
	font-weight: 600;
	font-style: normal;
}
</style>

<style type="text/css">
@font-face {
	font-family: 'proxima-nova';
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-light-webfont.eot');
	src:
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-light-webfont.eot?#iefix')
		format("embedded-opentype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-light-webfont.woff')
		format("woff"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-light-webfont.ttf')
		format("truetype"),
		url(' //instagramstatic-a.akamaihd.net/bluebar/9308ef9/webfonts/proximanova-light-webfont.svg#ProximaNovaLight')
		format("svg");
	font-weight: 300;
	font-style: normal;
}
</style>




<meta name="robots" content="noimageindex">

<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">



<meta name="viewport" id="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1, minimum-scale=1, maximum-scale=1">


<script type="text/javascript">
	(function() {
		var docElement = document.documentElement;
		var classRE = new RegExp('(^|\\s)no-js(\\s|$)');
		var className = docElement.className;
		docElement.className = className.replace(classRE, '$1js$2');
	})();
</script>




<link
	href="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/images/ico/favicon.ico"
	rel="Shortcut Icon" type="image/x-icon">
<link
	href="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/images/ico/favicon.svg"
	rel="mask-icon" color="#125688">


<link
	href="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/images/ico/apple-touch-icon-precomposed.png"
	rel="apple-touch-icon-precomposed">
<link
	href="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/images/ico/apple-touch-icon-72x72-precomposed.png"
	rel="apple-touch-icon-precomposed" sizes="72x72">
<link
	href="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/images/ico/apple-touch-icon-114x114-precomposed.png"
	rel="apple-touch-icon-precomposed" sizes="114x114">
<link
	href="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/images/ico/apple-touch-icon-144x144-precomposed.png"
	rel="apple-touch-icon-precomposed" sizes="144x144">



<link href="./CSS/pw_forget.css" rel="stylesheet" type="text/css">



<script
	src="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/scripts/jquery.js"
	type="text/javascript"></script>
<script
	src="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/scripts/bluebar.js"
	type="text/javascript"></script>
<script
	src="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/scripts/navigation.js"
	type="text/javascript"></script>


<script
	src="//www.google.com/js/th/cmxY_D9aqD9HadtqCywbNSN6CtWjKmsTEBU9p0qK1no.js"
	type="text/javascript" charset="UTF-8"></script>
<style type="text/css">
.recaptcha_is_showing_audio .recaptcha_only_if_image,
	.recaptcha_isnot_showing_audio .recaptcha_only_if_audio,
	.recaptcha_had_incorrect_sol .recaptcha_only_if_no_incorrect_sol,
	.recaptcha_nothad_incorrect_sol .recaptcha_only_if_incorrect_sol {
	display: none !important
}
</style>
<script
	src="https://www.google.com/recaptcha/api/reload?c=03AHJ_Vusj1OqzyUTH7yxZ573qNtBzS41eI6-09zhtSIhPp8yk03YPIO4wvvu9WxPvuDBuVI1pWdG9B0ZxIbWlM-_tra2M28_zJnX1F7mUmHyW_NcIwf1R8_C_IimQpOSGTmbRdTFYscSx8oKLJEOH6PsK6X681x5ZyPeAAEDgSZvVG2zc1rtDBC4tcMUAROkdTXjsXK4GGRZ0GC0Drm1VLbTYh48DLXujxfXgE8TDjbK2B8Bil3vTUYP6NBLS2B-LyRet5IgmpHjokD5paurdmzplXQFQr9Snvg&amp;k=6Ld8RcESAAAAAEo6_M9BjluesU7nWtdKmhIeU-jD&amp;reason=i&amp;type=image&amp;lang=ko&amp;th=,4hOw_8cshy2Vz4y23DUX8sAAdNbwAAABD6AAAABC-ABc30NpudasYjlN9ZpjC-JB-pQ4ViPKo104So1rrXBeLVzgpxZ9rj4sNfG-C5iBhNYOzdmKDaTd8GB4e-xmPdNKJYtna4_QpUrFl3kg-dIj6i76sG3-Uk_2kFr1V7rYAMeR7am-6FedHM0hJv97Ap6e5fy-I1KpYiePJl443eOZydEQoMJcmjB8SoOIk1jetjJqX86YaJoyRVPhUcPrrLgDuCR0MmSS0TEoE0j9XW6I58ZdTAqnGEhYNE82VB4DY14lJ_kq_UBeNkRLqw78-yRPhZLnkdpwa96hI_BUsHuALN8cFXeNBf0Q9yHlSLPHhgffEUk1XZAd2YrKvsVBo23lcJZEo4mpufY6oP6u6IhJ6kfosXAU-Z6FvsPZdfupBkIXnNHq7Ydk"
	type="text/javascript"></script>

<script type="text/javascript">
	$(function(){
		var form = $('form[name=sendEmailForm]');
		var input = $('input:text[name=token]');
		
		$('#pwReset').click(function(){
			var inputValue = input.val();
			$.ajax({
				type : 'POST',
				url : 'sendpw.do',
				dataType : 'text',
				data : {
					token : inputValue
				},
				success : function(text) {
					if(text == "send") {
						alert("이메일이 전송되었습니다.");
						location.href = "/Kostagram";
					} else if (text == "fail") {
						alert("이메일이나 닉네임이 존재하지 않습니다.");
					} else if (text == "error") {
						alert("메일 전송 오류");
					}
				},
				error : function() {
					alert("통신 실패");
				}
			});
		});
	});
</script>
</head>
<body class="sidebar-page page-accounts">


	<div class="root">

		<div class="page">


			<header class="top-bar top-bar-new">
				<div class="top-bar-wrapper">
					<div class="logo">
						<a href="/">Kostagram</a>
					</div>

					<div class="top-bar-left">
						<ul class="top-bar-actions">
							<li><a class="top-bar-home" href="/Kostagram" label="홈"><i></i></a>
							</li>
						</ul>
					</div>

					<div class="top-bar-right account-state" id="top_bar_right">
						<ul class="top-bar-actions">


							<li class="link-signin" id="link_profile"><a
								class="loginLink" href="/Kostagram"> <i></i> <strong>로그인</strong>
							</a></li>

						</ul>
					</div>
				</div>
			</header>
			<!-- .top-bar -->




			<div class="sidebar">
				<div class="wrapper">
					<nav class="sidebar-nav">
						<div class="sidebar-content"></div>
					</nav>
				</div>
			</div>
			<div class="main">
				<div class="wrapper">
					<section class="nav-page-content" role="main">


						<header>
							<h1>비밀번호 재설정</h1>
							<p>Kostagram 사용자 이름이나 계정에 연결된 이메일 주소를 사용해서 비밀번호를 재설정할 수 있도록
								도와 드리겠습니다.</p>
						</header>






						<form class="adjacent bordered password-reset" name="sendEmailForm" method="POST"
							accept-charset="utf-8">


							<input name="csrfmiddlewaretoken" type="hidden"
								value="365655522cd95da1dd854f1c9c1e9cf5">

							<p class="form-text" name="email_or_username_section">
								<label for="email_or_username">이메일 또는 사용자 이름</label> <span>
								<input name="token" id="id_email_or_username" type="text"
									maxlength="75"></span>
							</p>

							<p class="form-actions">
								<input type="button" class="button-green" id="pwReset"
									value="비밀번호 재설정">
							</p>

						</form>

					</section>
				</div>
				<!-- .main -->
			</div>
			<!-- .main -->


		</div>
		<!-- .page -->


		<footer class="page-footer" role="contentinfo"> </footer>


		<div id="reactModalMountPoint"></div>
	</div>
	<!-- .root -->





	<script type="text/javascript">
		window._sharedData = {
			"qs" : "{\"shift\":10,\"header\":\"WZHTbKssAv5FnXnBX0fEja2SJLmEh4yx\",\"edges\":100,\"blob\":\"AQBl2tmuijRZv4LSs6OymkVIsI2kryqvTwUziU-CxuanbnH_rj9LmtXwW_gECA8u5zUiEkCLX0EV67pFvdpNb4jpZtdj9FeNeeYKZTp1ziRmwL2qsMNhmhRCRFOkmLgzEFiUoA7GrU3jmPsfyCOCM86FOnSbu7IAgd-nbZ4Udq5SFWtrbJaXdr8kyT9u_ZsIVq53uVzWZnHpqJj_TzA7D2K28VeiSDvy8rMAJtY4iU8X7Q\",\"iterations\":7,\"size\":42}",
			"static_root" : "\/\/instagramstatic-a.akamaihd.net\/bluebar\/9308ef9",
			"entry_data" : {},
			"hostname" : "instagram.com",
			"platform" : "web",
			"qe" : {
				"su" : {
					"p" : {},
					"g" : ""
				}
			},
			"display_properties_server_guess" : {
				"viewport_width" : 1366,
				"pixel_ratio" : 1.0
			},
			"country_code" : "KR",
			"language_code" : "ko",
			"gatekeepers" : {
				"rhp" : true
			},
			"config" : {
				"dismiss_app_install_banner_until" : null,
				"viewer" : null,
				"csrf_token" : "365655522cd95da1dd854f1c9c1e9cf5"
			},
			"environment_switcher_visible_server_guess" : true
		};
	</script>


	<script>
		!function(f, b, e, v, n, t, s) {
			if (f.fbq)
				return;
			n = f.fbq = function() {
				n.callMethod ? n.callMethod.apply(n, arguments) : n.queue
						.push(arguments)
			};
			if (!f._fbq)
				f._fbq = n;
			n.push = n;
			n.loaded = !0;
			n.version = '2.0';
			n.queue = [];
			t = b.createElement(e);
			t.async = !0;
			t.src = v;
			s = b.getElementsByTagName(e)[0];
			s.parentNode.insertBefore(t, s)
		}(window, document, 'script',
				'//connect.facebook.net/en_US/fbevents.js');
		fbq('init', '1425767024389221');
		fbq('track', 'PageView');
	</script>
	<noscript></noscript>




</body>
</html>
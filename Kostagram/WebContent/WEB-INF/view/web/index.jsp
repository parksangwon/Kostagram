<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko"
	class="js not-logged-in wf-proximanova-n3-active wf-proximanova-n4-active wf-proximanova-n6-active wf-proximanova-n7-active wf-active">
<!--<![endif]-->
<head>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>Kostagram</title>

<script
	src="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/scripts/webfont.js"
	type="text/javascript" async=""></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="m/js/common.js"></script>

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



<meta id="viewport" name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1, minimum-scale=1, maximum-scale=1">


<script type="text/javascript">
	(function() {
		var docElement = document.documentElement;
		var classRE = new RegExp('(^|\\s)no-js(\\s|$)');
		var className = docElement.className;
		docElement.className = className.replace(classRE, '$1js$2');
	})();
</script>





<link rel="Shortcut Icon" type="image/x-icon"
	href="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/images/ico/favicon.ico">
<link rel="mask-icon"
	href="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/images/ico/favicon.svg"
	color="#125688">


<link rel="apple-touch-icon-precomposed"
	href="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/images/ico/apple-touch-icon-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/images/ico/apple-touch-icon-72x72-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/images/ico/apple-touch-icon-114x114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/images/ico/apple-touch-icon-144x144-precomposed.png">






<link href="https://instagram.com/" rel="alternate" hreflang="x-default">
<link href="https://instagram.com/?hl=el" rel="alternate" hreflang="el">
<link href="https://instagram.com/?hl=gu" rel="alternate" hreflang="gu">
<link href="https://instagram.com/?hl=en" rel="alternate" hreflang="en">
<link href="https://instagram.com/?hl=af" rel="alternate" hreflang="af">
<link href="https://instagram.com/?hl=vi" rel="alternate" hreflang="vi">
<link href="https://instagram.com/?hl=it" rel="alternate" hreflang="it">
<link href="https://instagram.com/?hl=kn" rel="alternate" hreflang="kn">
<link href="https://instagram.com/?hl=pt-br" rel="alternate"
	hreflang="pt-br">
<link href="https://instagram.com/?hl=cs" rel="alternate" hreflang="cs">
<link href="https://instagram.com/?hl=id" rel="alternate" hreflang="id">
<link href="https://instagram.com/?hl=es" rel="alternate" hreflang="es">
<link href="https://instagram.com/?hl=ru" rel="alternate" hreflang="ru">
<link href="https://instagram.com/?hl=nl" rel="alternate" hreflang="nl">
<link href="https://instagram.com/?hl=pt" rel="alternate" hreflang="pt">
<link href="https://instagram.com/?hl=zh-tw" rel="alternate"
	hreflang="zh-tw">
<link href="https://instagram.com/?hl=nb" rel="alternate" hreflang="nb">
<link href="https://instagram.com/?hl=tr" rel="alternate" hreflang="tr">
<link href="https://instagram.com/?hl=ne" rel="alternate" hreflang="ne">
<link href="https://instagram.com/?hl=zh-cn" rel="alternate"
	hreflang="zh-cn">
<link href="https://instagram.com/?hl=tl" rel="alternate" hreflang="tl">
<link href="https://instagram.com/?hl=pa" rel="alternate" hreflang="pa">
<link href="https://instagram.com/?hl=th" rel="alternate" hreflang="th">
<link href="https://instagram.com/?hl=te" rel="alternate" hreflang="te">
<link href="https://instagram.com/?hl=pl" rel="alternate" hreflang="pl">
<link href="https://instagram.com/?hl=ta" rel="alternate" hreflang="ta">
<link href="https://instagram.com/?hl=fr" rel="alternate" hreflang="fr">
<link href="https://instagram.com/?hl=hr" rel="alternate" hreflang="hr">
<link href="https://instagram.com/?hl=bn" rel="alternate" hreflang="bn">
<link href="https://instagram.com/?hl=de" rel="alternate" hreflang="de">
<link href="https://instagram.com/?hl=da" rel="alternate" hreflang="da">
<link href="https://instagram.com/?hl=hi" rel="alternate" hreflang="hi">
<link href="https://instagram.com/?hl=fi" rel="alternate" hreflang="fi">
<link href="https://instagram.com/?hl=hu" rel="alternate" hreflang="hu">
<link href="https://instagram.com/?hl=ja" rel="alternate" hreflang="ja">
<link href="https://instagram.com/?hl=ml" rel="alternate" hreflang="ml">
<link href="https://instagram.com/?hl=ko" rel="alternate" hreflang="ko">
<link href="https://instagram.com/?hl=sv" rel="alternate" hreflang="sv">
<link href="https://instagram.com/?hl=ur" rel="alternate" hreflang="ur">
<link href="https://instagram.com/?hl=sk" rel="alternate" hreflang="sk">
<link href="https://instagram.com/?hl=si" rel="alternate" hreflang="si">
<link href="https://instagram.com/?hl=ms" rel="alternate" hreflang="ms">
<link href="https://instagram.com/?hl=mr" rel="alternate" hreflang="mr">


<style type="text/css" data-isostyle-id="is351a32f9">
.coreSpriteEllipsis {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: -219px -322px;
	height: 44px;
	width: 44px;
}

.coreSpriteFacebookIcon {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: -275px -416px;
	height: 16px;
	width: 16px;
}

.coreSpriteFacebookIconInverted {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: -293px -416px;
	height: 16px;
	width: 16px;
}

.coreSpriteHashtag {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: 0px -456px;
	height: 18px;
	width: 14px;
}

.coreSpriteHeartFull {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: -173px -322px;
	height: 44px;
	width: 44px;
}

.coreSpriteHeartOpen {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: -265px -322px;
	height: 44px;
	width: 44px;
}

.coreSpriteHeartSmall {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: -216px -416px;
	height: 19px;
	width: 19px;
}

.coreSpriteInputAccepted {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: -467px -373px;
	height: 22px;
	width: 22px;
}

.coreSpriteInputError {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: -491px -373px;
	height: 22px;
	width: 22px;
}

.coreSpriteInputRefresh {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: -515px -373px;
	height: 22px;
	width: 21px;
}

.coreSpriteInstallBannerLogo {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: -206px -264px;
	height: 51px;
	width: 51px;
}

.coreSpriteLeftPaginationArrow {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: -258px -373px;
	height: 40px;
	width: 40px;
}

.coreSpriteLikeAnimationHeart {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: 0px -373px;
	height: 81px;
	width: 92px;
}

.coreSpriteLocation {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: -257px -416px;
	height: 18px;
	width: 16px;
}

.coreSpriteLock {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: -94px -373px;
	height: 76px;
	width: 76px;
}

.coreSpriteLoginWithFacebook {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: -172px -416px;
	height: 22px;
	width: 21px;
}

.coreSpriteNavigationBrand {
	
	background-repeat: no-repeat;
	height: 49px;
	width: 171px;
}

.coreSpriteNavigationBrandSmall {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: -344px -284px;
	height: 28px;
	width: 102px;
}

.coreSpriteRightPaginationArrow {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: -216px -373px;
	height: 40px;
	width: 40px;
}

.coreSpriteSearchIcon {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: -516px -360px;
	height: 10px;
	width: 10px;
}

.coreSpriteSpeechBubbleSmall {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: -195px -416px;
	height: 19px;
	width: 19px;
}

.coreSpriteUserTagIndicator {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: -172px -373px;
	height: 41px;
	width: 42px;
}

.coreSpriteVerifiedBadge {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: -237px -416px;
	height: 18px;
	width: 18px;
}

.coreSpriteVerifiedBadgeSmall {
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: -434px -104px;
	height: 12px;
	width: 12px;
}

@media ( min-device-pixel-ratio : 1.5) , ( -webkit-min-device-pixel-ratio : 1.5)
		, ( min-resolution : 144dpi) {
	.coreSpriteEllipsis {
		background-size: 268px 237px;
		background-position: -172px -52px;
	}
	.coreSpriteFacebookIcon {
		background-size: 268px 237px;
		background-position: -241px -169px;
	}
	.coreSpriteFacebookIconInverted {
		background-size: 268px 237px;
		background-position: -224px -169px;
	}
	.coreSpriteHashtag {
		background-size: 268px 237px;
		background-position: -206px -186px;
	}
	.coreSpriteHeartFull {
		background-size: 268px 237px;
		background-position: -224px 0px;
	}
	.coreSpriteHeartOpen {
		background-size: 268px 237px;
		background-position: -172px -97px;
	}
	.coreSpriteHeartSmall {
		background-size: 268px 237px;
		background-position: -170px -186px;
	}
	.coreSpriteInputAccepted {
		background-size: 268px 237px;
		background-position: -155px -161px;
	}
	.coreSpriteInputError {
		background-size: 268px 237px;
		background-position: -129px -132px;
	}
	.coreSpriteInputRefresh {
		background-size: 268px 237px;
		background-position: -178px -161px;
	}
	.coreSpriteInstallBannerLogo {
		background-size: 268px 237px;
		background-position: -172px 0px;
	}
	.coreSpriteLeftPaginationArrow {
		background-size: 268px 237px;
		background-position: -224px -128px;
	}
	.coreSpriteLikeAnimationHeart {
		background-size: 268px 237px;
		background-position: 0px -50px;
	}
	.coreSpriteLocation {
		background-size: 268px 237px;
		background-position: -190px -186px;
	}
	.coreSpriteLock {
		background-size: 268px 237px;
		background-position: -93px -50px;
	}
	.coreSpriteLoginWithFacebook {
		background-size: 268px 237px;
		background-position: -200px -161px;
	}
	.coreSpriteNavigationBrand {
		background-size: 268px 237px;
		background-position: 0px 0px;
	}
	.coreSpriteNavigationBrandSmall {
		background-size: 268px 237px;
		background-position: 0px -132px;
	}
	.coreSpriteRightPaginationArrow {
		background-size: 268px 237px;
		background-position: -224px -87px;
	}
	.coreSpriteSearchIcon {
		background-size: 268px 237px;
		background-position: -258px -169px;
	}
	.coreSpriteSpeechBubbleSmall {
		background-size: 268px 237px;
		background-position: -150px -186px;
	}
	.coreSpriteUserTagIndicator {
		background-size: 268px 237px;
		background-position: -224px -45px;
	}
	.coreSpriteVerifiedBadge {
		background-size: 268px 237px;
		background-position: -152px -132px;
	}
	.coreSpriteVerifiedBadgeSmall {
		background-size: 268px 237px;
		background-position: -220px -186px;
	}
}
</style>
<style type="text/css" data-isostyle-id="is110a3ca4">
.-cx-PRIVATE-AppInstallLink__root {
	margin-right: 8px
}

.-cx-PRIVATE-AppInstallLink__root:last-child {
	margin-right: 0
}

.-cx-PRIVATE-AppInstallLink__badgeImage {
	height: 40px
}
</style>
<style type="text/css" data-isostyle-id="is436e3889">
.-cx-PRIVATE-IGButton__root {
	background: 0 0;
	border-radius: 3px;
	border-style: solid;
	border-width: 1px;
	font-size: 14px;
	font-weight: 600;
	outline: none;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	-webkit-appearance: none
}

.-cx-PRIVATE-IGButton__borderless {
	border: 0;
	color: #4b4f54;
	font-weight: 400
}

.-cx-PRIVATE-IGButton__default {
	border-color: #4090db;
	color: #4090db
}

.-cx-PRIVATE-IGButton__default:focus, .-cx-PRIVATE-IGButton__default:hover,
	.-cx-PRIVATE-IGButton__default.zeroclipboard-is-hover {
	border-color: #2d6599;
	color: #2d6599
}

.-cx-PRIVATE-IGButton__default:active, .-cx-PRIVATE-IGButton__default.zeroclipboard-is-active
	{
	border-color: #20486d;
	color: #20486d
}

.-cx-PRIVATE-IGButton__solid {
	background-color: #4090db;
	border-color: #4090db
}

.-cx-PRIVATE-IGButton__solid:hover, .-cx-PRIVATE-IGButton__solid.zeroclipboard-is-hover
	{
	background-color: #2d6599;
	border-color: #2d6599
}

.-cx-PRIVATE-IGButton__solid:active, .-cx-PRIVATE-IGButton__solid.zeroclipboard-is-active
	{
	background-color: #20486d;
	border-color: #20486d
}

.-cx-PRIVATE-IGButton__enabled {
	cursor: pointer
}

.-cx-PRIVATE-IGButton__disabled {
	border-color: #a5a7aa;
	background-color: #a5a7aa;
	color: #c9cbcc
}

.-cx-PRIVATE-IGButton__danger {
	border-color: #f12938;
	background-color: #f12938
}

.-cx-PRIVATE-IGButton__danger:focus, .-cx-PRIVATE-IGButton__danger:hover,
	.-cx-PRIVATE-IGButton__danger.zeroclipboard-is-hover {
	border-color: #a81d27;
	background-color: #a81d27
}

.-cx-PRIVATE-IGButton__danger:active, .-cx-PRIVATE-IGButton__danger.zeroclipboard-is-active
	{
	border-color: #78141c;
	background-color: #78141c
}

.-cx-PRIVATE-IGButton__neutral {
	border-color: #818488;
	color: #818488
}

.-cx-PRIVATE-IGButton__neutral:focus, .-cx-PRIVATE-IGButton__neutral:hover,
	.-cx-PRIVATE-IGButton__neutral.zeroclipboard-is-hover {
	border-color: #4b4f54;
	color: #4b4f54
}

.-cx-PRIVATE-IGButton__neutral:active, .-cx-PRIVATE-IGButton__neutral.zeroclipboard-is-active
	{
	border-color: #25272a;
	color: #25272a
}

.-cx-PRIVATE-IGButton__sizeLarge {
	line-height: 29px;
	padding: 0 11px
}

.-cx-PRIVATE-IGButton__sizeSmall {
	line-height: 24px;
	padding: 0 9px
}

.-cx-PRIVATE-IGButton__success {
	border-color: #66bd2b;
	background-color: #66bd2b
}

.-cx-PRIVATE-IGButton__success:focus, .-cx-PRIVATE-IGButton__success:hover,
	.-cx-PRIVATE-IGButton__success.zeroclipboard-is-hover {
	border-color: #47841e;
	background-color: #47841e
}

.-cx-PRIVATE-IGButton__success:active, .-cx-PRIVATE-IGButton__success.zeroclipboard-is-active
	{
	border-color: #335e15;
	background-color: #335e15
}

.-cx-PRIVATE-IGButton__danger, .-cx-PRIVATE-IGButton__danger:hover,
	.-cx-PRIVATE-IGButton__danger.zeroclipboard-is-hover,
	.-cx-PRIVATE-IGButton__danger:active, .-cx-PRIVATE-IGButton__danger.zeroclipboard-is-active,
	.-cx-PRIVATE-IGButton__solid, .-cx-PRIVATE-IGButton__solid:hover,
	.-cx-PRIVATE-IGButton__solid.zeroclipboard-is-hover,
	.-cx-PRIVATE-IGButton__solid:active, .-cx-PRIVATE-IGButton__solid.zeroclipboard-is-active,
	.-cx-PRIVATE-IGButton__success, .-cx-PRIVATE-IGButton__success:hover,
	.-cx-PRIVATE-IGButton__success.zeroclipboard-is-hover,
	.-cx-PRIVATE-IGButton__success:active, .-cx-PRIVATE-IGButton__success.zeroclipboard-is-active
	{
	color: #fff
}

@media ( min-width :736px) {
	.-cx-PRIVATE-IGButton__sizeAuto {
		line-height: 29px;
		padding: 0 11px
	}
}

@media ( max-width :735px) {
	.-cx-PRIVATE-IGButton__sizeAuto {
		line-height: 24px;
		padding: 0 9px
	}
}
</style>
<style type="text/css" data-isostyle-id="is7f813932">
.-cx-PRIVATE-TextInput__root::-webkit-input-placeholder {
	color: #c9cbcc;
	font-weight: 300;
	opacity: 1
}

.-cx-PRIVATE-TextInput__root::-moz-placeholder {
	color: #c9cbcc;
	font-weight: 300;
	opacity: 1
}

.-cx-PRIVATE-TextInput__root:-ms-input-placeholder {
	color: #c9cbcc;
	font-weight: 300;
	opacity: 1
}

.-cx-PRIVATE-TextInput__root::placeholder {
	color: #c9cbcc;
	font-weight: 300;
	opacity: 1
}

.-cx-PRIVATE-TextInput__root::-ms-clear {
	display: none;
	height: 0;
	width: 0
}
</style>
<style type="text/css" data-isostyle-id="is-2a35c398">
.-cx-PRIVATE-SlimTextInput__root {
	position: relative
}

.-cx-PRIVATE-SlimTextInput__input {
	background-color: #fdfdfd;
	border: 1px solid #edeeee;
	border-radius: 3px;
	font-size: 14px;
	padding: 9px 8px 7px;
	-webkit-appearance: none
}

.-cx-PRIVATE-SlimTextInput__input::-webkit-input-placeholder {
	color: #818488
}

.-cx-PRIVATE-SlimTextInput__input::-moz-placeholder {
	color: #818488
}

.-cx-PRIVATE-SlimTextInput__input:-ms-input-placeholder {
	color: #818488
}

.-cx-PRIVATE-SlimTextInput__input::placeholder {
	color: #818488
}

.-cx-PRIVATE-SlimTextInput__indicators {
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row;
	height: 100%;
	position: absolute;
	right: 8px;
	top: 0
}

.-cx-PRIVATE-SlimTextInput__icon {
	margin-left: 16px
}

.-cx-PRIVATE-SlimTextInput__forgot {
	font-size: 14px;
	margin-right: 4px
}
</style>
<style type="text/css" data-isostyle-id="is64f7371b">
.-cx-PRIVATE-Util__hideText {
	display: block;
	overflow: hidden;
	text-indent: 110%;
	white-space: nowrap
}
</style>
<style type="text/css" data-isostyle-id="is-2b7dc3c0">
.-cx-PRIVATE-SlimLoginForm__inputField {
	margin: 0 40px 6px
}

.-cx-PRIVATE-SlimLoginForm__button {
	margin: 4px 40px 14px
}

.-cx-PRIVATE-SlimLoginForm__or {
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row;
	margin: 5px 40px 8px
}

.-cx-PRIVATE-SlimLoginForm__orBar {
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	-webkit-flex-shrink: 1;
	-ms-flex-negative: 1;
	flex-shrink: 1;
	background-color: #edeeee;
	height: 1px;
	position: relative;
	margin: 7px 0
}

.-cx-PRIVATE-SlimLoginForm__orText {
	color: #a5a7aa;
	-webkit-box-flex: 0;
	-webkit-flex-grow: 0;
	-ms-flex-positive: 0;
	flex-grow: 0;
	-webkit-flex-shrink: 0;
	-ms-flex-negative: 0;
	flex-shrink: 0;
	font-size: 13px;
	font-weight: 600;
	line-height: 15px;
	margin: 0 8px;
	text-transform: uppercase
}

.-cx-PRIVATE-SlimLoginForm__header {
	color: #a5a7aa;
	font-size: 17px;
	font-weight: 600;
	line-height: 20px;
	margin: 10px 40px;
	text-align: center
}

.-cx-PRIVATE-SlimLoginForm__form {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column
}

.-cx-PRIVATE-SlimLoginForm__fbIcon {
	display: inline-block;
	margin-right: 8px;
	position: relative;
	top: 3px
}

.-cx-PRIVATE-SlimLoginForm__root {
	margin-bottom: 10px
}

.-cx-PRIVATE-SlimLoginForm__errorMessage {
	color: #f12938;
	font-size: 14px;
	line-height: 18px;
	margin: 10px 40px;
	text-align: center
}

.-cx-PRIVATE-SlimLoginForm__loginWithFacebookText {
	color: #125688
}
</style>
<style type="text/css" data-isostyle-id="is12473cbd">
.-cx-PRIVATE-SlimSignupForm__inputField {
	margin: 0 40px 6px
}

.-cx-PRIVATE-SlimSignupForm__button {
	margin: 8px 40px
}

.-cx-PRIVATE-SlimSignupForm__or {
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row;
	margin: 10px 40px 18px
}

.-cx-PRIVATE-SlimSignupForm__orBar {
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	-webkit-flex-shrink: 1;
	-ms-flex-negative: 1;
	flex-shrink: 1;
	background-color: #c9cbcc;
	height: 1px;
	position: relative;
	top: 45%
}

.-cx-PRIVATE-SlimSignupForm__orText {
	color: #a5a7aa;
	-webkit-box-flex: 0;
	-webkit-flex-grow: 0;
	-ms-flex-positive: 0;
	flex-grow: 0;
	-webkit-flex-shrink: 0;
	-ms-flex-negative: 0;
	flex-shrink: 0;
	font-size: 13px;
	font-weight: 600;
	line-height: 15px;
	margin: 0 18px;
	text-transform: uppercase
}

.-cx-PRIVATE-SlimSignupForm__header {
	color: #a5a7aa;
	font-size: 17px;
	font-weight: 600;
	line-height: 20px;
	margin: 0 40px 10px;
	text-align: center
}

.-cx-PRIVATE-SlimSignupForm__form {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column
}

.-cx-PRIVATE-SlimSignupForm__fbIcon {
	display: inline-block;
	margin-right: 8px;
	position: relative;
	top: 3px
}

.-cx-PRIVATE-SlimSignupForm__root {
	margin-bottom: 20px
}

.-cx-PRIVATE-SlimSignupForm__errorMessage {
	color: #f12938;
	font-size: 14px;
	line-height: 18px;
	margin: 10px 40px;
	text-align: center
}

.-cx-PRIVATE-SlimSignupForm__terms {
	color: #818488;
	font-size: 14px;
	line-height: 18px;
	margin: 10px 60px;
	text-align: center
}

.-cx-PRIVATE-SlimSignupForm__termLink,
	.-cx-PRIVATE-SlimSignupForm__termLink:visited,
	.-cx-PRIVATE-SlimSignupForm__termLink:hover,
	.-cx-PRIVATE-SlimSignupForm__termLink:active {
	color: #818488;
	font-weight: 600
}
</style>
<style type="text/css" data-isostyle-id="is-c90c454">
@
-webkit-keyframes 'spin8 '{ 0%{
	-webkit-transform: rotate(180deg);
	-moz-transform: rotate(180deg);
	-o-transform: rotate(180deg);
	transform: rotate(180deg)
}

100%{
-webkit-transform
:rotate(540deg)
;-moz-transform
:rotate(540deg)
;-o-transform
:rotate(540deg)
;transform
:rotate(540deg)
}
}
@
-moz-keyframes spin8 { 0%{
	-webkit-transform: rotate(180deg);
	-moz-transform: rotate(180deg);
	-o-transform: rotate(180deg);
	transform: rotate(180deg)
}

100%{
-webkit-transform
:rotate(540deg)
;-moz-transform
:rotate(540deg)
;-o-transform
:rotate(540deg)
;transform
:rotate(540deg)
}
}
@
-ms-keyframes spin8 { 0%{
	-webkit-transform: rotate(180deg);
	-moz-transform: rotate(180deg);
	-o-transform: rotate(180deg);
	transform: rotate(180deg)
}

100%{
-webkit-transform
:rotate(540deg)
;-moz-transform
:rotate(540deg)
;-o-transform
:rotate(540deg)
;transform
:rotate(540deg)
}
}
@
-o-keyframes spin8 { 0%{
	-webkit-transform: rotate(180deg);
	-moz-transform: rotate(180deg);
	-o-transform: rotate(180deg);
	transform: rotate(180deg)
}

100%{
-webkit-transform
:rotate(540deg)
;-moz-transform
:rotate(540deg)
;-o-transform
:rotate(540deg)
;transform
:rotate(540deg)
}
}
@
keyframes 'spin8 '{ 0%{
	-webkit-transform: rotate(180deg);
	-moz-transform: rotate(180deg);
	-o-transform: rotate(180deg);
	transform: rotate(180deg)
}

100%{
-webkit-transform
:rotate(540deg)
;-moz-transform
:rotate(540deg)
;-o-transform
:rotate(540deg)
;transform
:rotate(540deg)
}
}
.spiSpinner {
	left: 50%;
	position: absolute;
	top: 50%;
	background-size: 100%;
	height: 18px;
	margin-left: -9px;
	margin-top: -9px;
	width: 18px;
	background-image:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2hpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDoyRTNGMkVENTlEMjE2ODExODIyQUNEMjMwNzUzNTEzMyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDowMzIxMkU3QTcxMUUxMUUyQjdFMUNDNDg3OTE3RUY5RCIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDowMzIxMkU3OTcxMUUxMUUyQjdFMUNDNDg3OTE3RUY5RCIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChNYWNpbnRvc2gpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6ODJGQzEwNTI1MDIyNjgxMTgyMkFDRDIzMDc1MzUxMzMiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6MkUzRjJFRDU5RDIxNjgxMTgyMkFDRDIzMDc1MzUxMzMiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz6COBsvAAACo0lEQVR42uyZu08UURjFZ1Y2GjQ+MIaEmODb1qVGQkMhhZ001rKN8Q+AWFjY2NqwGgsrKwq1oqAxgYagogWNxS6ymvAw+AAW3TCem5xNbibcuzM7995x4nzJL8zOzM6cc1/fd1k/CAIvy1HwMh65gdxAbiDj0WXjoeVyWXmtUqlkpgdGwCdQBTezOISmwEXQLxre1kv8qJlYNywUEX6wH+fLUYfaf7kKnQdPwAswbEDDYXAGnAZFFwYmwAC4DB6BGwnEHwE9FC6MnHRh4Fjo+w86NCHEnwrNjYILA49BM6GJg8SL+OHCwDyYVJgYlc6tSsffIojfAruu8sCswsR9cJaf74INih/nuUMa8TuuS4lZ/n0oPafIVUq0/ksSfp8x8SbyQKsn9vh5BSxq7v8t9VqQVHzbTBwj+/aBC+BtS1A4k0rP8rlkNkNDsKPMbKoa/UKilhgNl+V0STQgOK64LobBU/BOV7/I19gbJ8A5jYY/oAa+J50DdzTiPWbP8Q4ar79NAxZ5j5NirunZicCEgSmu56rY4BCKG1WuSroVq2ZiDnwA9+LuGTSrkFw2fLQ6iQ+YeLp50MsWa0R4pyidf4HtpBsaE8voVXCLz9rikGto3jcEjoJ98B7U0/yvhBA/xhqn1ROilFhW9FgPxbfmX4nH9TQMhMV7bNV1HouibpBC5zi8fvKegpSVE5koGBQvlrzX0oo1yPwhNkDXeW6X5cZ+aLNfkqpY6wYuKcS/EtlYOicnv27p+KvCxDXWVNYNDEcQ3y5UJq64MLCXULzORNOFgRnwmZN1ukPxsokFFmybYMnFKrQGnhmsd9ZIKjuy1MO38Sslk9htKWmJefM8TonwL/TAHEsKIf6NrZd0WTRQJVYjnwNpR/4rZW4gN5Dx+CvAABjBsk/oCqxuAAAAAElFTkSuQmCC);
	-webkit-animation: spin8 .8s steps(8) infinite;
	-moz-animation: spin8 .8s steps(8) infinite;
	-o-animation: spin8 .8s steps(8) infinite;
	animation: spin8 .8s steps(8) infinite
}
</style>
<style type="text/css" data-isostyle-id="is-6844c34a">
.-cx-PRIVATE-BaseButton__root {
	cursor: pointer;
	display: inline-block;
	position: relative;
	text-decoration: none;
	white-space: nowrap;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none
}

.-cx-PRIVATE-BaseButton__root:hover {
	text-decoration: none
}
</style>
<style type="text/css" data-isostyle-id="is60b93e06">
.ButtonSizeMicro, .ButtonSizeMini {
	font-size: 1.2rem;
	padding: 4px 7px;
	border-radius: 2px
}

.ButtonSizeSmall {
	font-size: 1.2rem;
	padding: 7px 9px 6px
}

.Button, .ButtonSizeMedium {
	font-size: 1.4rem;
	padding: 7px 10px 8px
}

.ButtonSizeMedium {
	border-radius: 3px
}

.ButtonSizeLarge {
	font-size: 1.6rem;
	padding: 9px 12px
}

.ButtonSizeXL {
	font-size: 2.3rem;
	padding: 10px 13px
}

.ButtonColorBlue, .ButtonColorBlue:visited {
	color: #fff
}

.ButtonColorBlue:hover {
	color: #fff
}

.ButtonActive.ButtonColorBlue, .button-active.ButtonColorBlue, .active.ButtonColorBlue,
	.ButtonColorBlue:active, html.touch .pressed.ButtonColorBlue {
	color: rgba(255, 255, 255, .8);
	text-shadow: 0 1px 0 rgba(0, 0, 0, .3)
}

.Button {
	text-shadow: 0 1px 0 rgba(255, 255, 255, .2);
	box-shadow: 0 1px 1px rgba(0, 0, 0, .08), inset 1px 0 0
		rgba(255, 255, 255, .05), inset -1px 0 0 rgba(255, 255, 255, .05),
		inset 0 1px 0 rgba(255, 255, 255, .2)
}

.ButtonActive.Button, .button-active.Button, .active.Button, .Button:active,
	html.touch .pressed.Button {
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .08), inset 0 0 1px
		rgba(0, 0, 0, .08), 0 1px 0 rgba(255, 255, 255, .9)
}

.ButtonColorBlue {
	text-shadow: 0 1px 0 rgba(255, 255, 255, .2);
	box-shadow: 0 1px 1px rgba(0, 0, 0, .1), inset 1px 0 0
		rgba(255, 255, 255, .05), inset -1px 0 0 rgba(255, 255, 255, .05),
		inset 0 1px 0 rgba(255, 255, 255, .2)
}

.ButtonActive.ButtonColorBlue, .button-active.ButtonColorBlue, .active.ButtonColorBlue,
	.ButtonColorBlue:active, html.touch .pressed.ButtonColorBlue {
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .15), inset 0 0 1px
		rgba(0, 0, 0, .15), 0 1px 0 rgba(255, 255, 255, .8)
}

.ButtonColorBlue {
	background-color: #6f97b6;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#6f97b6),
		to(#3f729b));
	background-image: -webkit-linear-gradient(top, #6f97b6, #3f729b);
	background-image: -moz-linear-gradient(top, #6f97b6, #3f729b);
	background-image: -o-linear-gradient(top, #6f97b6, #3f729b);
	background-image: -ms-linear-gradient(top, #6f97b6, #3f729b);
	background-image: linear-gradient(top, #6f97b6, #3f729b);
	filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,
		StartColorStr='#6f97b6', EndColorStr='#3f729b');
	background-position: 50% 50%;
	text-shadow: 0 1px 1px #1c5380
}

.ButtonActive.ButtonColorBlue, .button-active.ButtonColorBlue, .active.ButtonColorBlue,
	.ButtonColorBlue:active, html.touch .pressed.ButtonColorBlue {
	background: #3c6d94
}

.ButtonColorBlue {
	border: 1px solid #1c5380
}

.ButtonActive.ButtonColorBlue, .button-active.ButtonColorBlue, .active.ButtonColorBlue,
	.ButtonColorBlue:active, html.touch .pressed.ButtonColorBlue {
	border-color: #133856
}

.Button {
	position: relative;
	cursor: pointer;
	font-weight: 700;
	line-height: 1em;
	text-decoration: none !important;
	color: #111;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: #eee;
	border-radius: 4px
}

.Button:hover {
	background-color: #eee
}

.Button.ButtonActive, .Button.button-active, .Button.active, .Button:active,
	html.touch .Button.pressed {
	background-color: #ddd
}

.Button {
	background-color: #f9fafb;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#f9fafb),
		to(#eef1f4));
	background-image: -webkit-linear-gradient(top, #f9fafb, #eef1f4);
	background-image: -moz-linear-gradient(top, #f9fafb, #eef1f4);
	background-image: -o-linear-gradient(top, #f9fafb, #eef1f4);
	background-image: -ms-linear-gradient(top, #f9fafb, #eef1f4);
	background-image: linear-gradient(top, #f9fafb, #eef1f4);
	filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,
		StartColorStr='#f9fafb', EndColorStr='#eef1f4');
	background-position: 50% 50%
}

.Button.ButtonActive, .Button.button-active, .Button.active, .Button:active,
	html.touch .Button.pressed {
	background: #e8ecf0
}

.Button {
	border: 1px solid #c6daec
}

.Button.ButtonActive, .Button.button-active, .Button.active, .Button:active,
	html.touch .Button.pressed {
	border-color: #b3cee6
}

.Button.bDisabled, .Button.bDisabled:hover, .Button.bDisabled:active {
	cursor: default;
	background: #fff;
	border-color: #ddd;
	box-shadow: none;
	color: #999
}
</style>
<style type="text/css" data-isostyle-id="is-37a0c23b">
.-cx-PRIVATE-FacebookLoginForm__errorMessage {
	color: #f12938;
	line-height: 23px;
	margin: 0 27px;
	padding: 0 8px 20px 10px;
	vertical-align: middle
}

.-cx-PRIVATE-FacebookLoginForm__loginButton {
	background: #66bd2b;
	border: none;
	color: #fff;
	font-size: 15px;
	font-weight: 600;
	margin: 15px auto;
	min-width: 120px;
	padding: 10px 30px;
	text-align: center;
	width: intrinsic
}

.-cx-PRIVATE-FacebookLoginForm__loginButton:hover {
	background: #66bd2b;
	color: #fff
}

.-cx-PRIVATE-FacebookLoginForm__message {
	color: #4b4f54;
	line-height: 23px;
	margin: auto;
	padding: 0 8px 20px 10px;
	vertical-align: middle
}

.-cx-PRIVATE-FacebookLoginForm__notUser {
	color: #4b4f54;
	display: inline
}

.-cx-PRIVATE-FacebookLoginForm__profilePicture {
	border-radius: 100px;
	border: solid 1px #edeeee;
	height: 100px;
	margin: 0 auto 20px;
	width: 100px
}

.-cx-PRIVATE-FacebookLoginForm__switchAccountsLink {
	display: inline;
	font-weight: 700;
	text-decoration: none
}

.-cx-PRIVATE-FacebookLoginForm__switchAccountsText {
	margin: 15px 0;
	text-align: center
}
</style>
<style type="text/css" data-isostyle-id="is-79fbc0e6">
.-cx-PRIVATE-LandingActionsColumn__root {
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	margin-top: 12px;
	max-width: 350px
}

.-cx-PRIVATE-LandingActionsColumn__box {
	background-color: #fff;
	border: 1px solid #edeeee;
	border-radius: 1px;
	margin: 0 0 10px;
	padding: 10px 0
}

.-cx-PRIVATE-LandingActionsColumn__brand {
	margin: 20px auto 10px
}

.-cx-PRIVATE-LandingActionsColumn__getApp {
	margin-top: 10px
}

.-cx-PRIVATE-LandingActionsColumn__getAppText,
	.-cx-PRIVATE-LandingActionsColumn__getAppTextShort {
	color: #4b4f54;
	font-size: 14px;
	line-height: 18px;
	margin: 10px 20px;
	text-align: center
}

.-cx-PRIVATE-LandingActionsColumn__appInstallLinks {
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row;
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center
}

@media ( max-width :349px) {
	.-cx-PRIVATE-LandingActionsColumn__root {
		-webkit-box-pack: justify;
		-webkit-justify-content: space-between;
		-ms-flex-pack: justify;
		justify-content: space-between;
		margin-top: 0;
		max-width: 100%
	}
	.-cx-PRIVATE-LandingActionsColumn__loginBox {
		background-color: transparent;
		border-width: 0
	}
	.-cx-PRIVATE-LandingActionsColumn__getApp {
		-webkit-box-flex: 1;
		-webkit-flex-grow: 1;
		-ms-flex-positive: 1;
		flex-grow: 1;
		-webkit-box-pack: center;
		-webkit-justify-content: center;
		-ms-flex-pack: center;
		justify-content: center;
		margin-top: 0
	}
}

.-cx-PRIVATE-LandingActionsColumn__haveAccountLogIn {
	color: #4b4f54;
	font-size: 14px;
	margin: 15px;
	text-align: center
}

.-cx-PRIVATE-LandingActionsColumn__link {
	color: #2d6599
}

.-cx-PRIVATE-LandingActionsColumn__link:hover {
	color: #20486d
}

.-cx-PRIVATE-LandingActionsColumn__link:active {
	color: #132b41
}

.-cx-PRIVATE-LandingActionsColumn__spinnerContainer {
	min-height: 160px
}

.-cx-PRIVATE-LandingActionsColumn__spinner {
	margin-top: -18px
}
</style>
<style type="text/css" data-isostyle-id="is12693cca">
.-cx-PRIVATE-PhoneSlideshow__root {
	-webkit-align-self: center;
	-ms-flex-item-align: center;
	align-self: center;
	background:
		url('//instagramstatic-a.akamaihd.net/bluebar/9308ef9/images/homepage/home-phones.png');
	background-position: 0 0;
	-webkit-flex-basis: 454px;
	-ms-flex-preferred-size: 454px;
	flex-basis: 454px;
	height: 618px;
	margin-left: -35px;
	margin-right: -15px
}

.-cx-PRIVATE-PhoneSlideshow__iPhoneOverlay {
	margin: 93px 0 0 132px;
	position: relative
}

.-cx-PRIVATE-PhoneSlideshow__screenshot {
	height: 427px;
	left: 0;
	position: absolute;
	top: 0;
	width: 240px
}

.-cx-PRIVATE-PhoneSlideshow__screenshotLeave {
	opacity: 1;
	z-index: 1
}

.-cx-PRIVATE-PhoneSlideshow__screenshotLeave.-cx-PRIVATE-PhoneSlideshow__screenshotLeaveActive
	{
	opacity: .99;
	-webkit-transition: opacity 1.5s ease-in;
	transition: opacity 1.5s ease-in;
	z-index: 1
}

.-cx-PRIVATE-PhoneSlideshow__screenshotEnter {
	opacity: .01;
	z-index: 2
}

.-cx-PRIVATE-PhoneSlideshow__screenshotEnter.-cx-PRIVATE-PhoneSlideshow__screenshotEnterActive
	{
	opacity: 1;
	-webkit-transition: opacity 1.5s ease-in;
	transition: opacity 1.5s ease-in;
	z-index: 2
}
</style>
<style type="text/css" data-isostyle-id="is-749ac294">
.-cx-PRIVATE-AppInstallBanner__root {
	background-color: #2b2d2e;
	box-sizing: border-box;
	display: table;
	height: 51px;
	padding: 11px 13px 11px 51px;
	position: relative;
	width: 100%
}

.-cx-PRIVATE-AppInstallBanner__blue {
	background-color: #4090db
}

.-cx-PRIVATE-AppInstallBanner__actions {
	text-align: right
}

.-cx-PRIVATE-AppInstallBanner__CTA {
	background: 0 0;
	border: 1px solid #fff;
	border-radius: 3px;
	box-sizing: border-box;
	display: table-cell;
	font-size: 14x;
	font-weight: 600;
	line-height: 25px;
	padding: 0 10px;
	text-transform: uppercase
}

.-cx-PRIVATE-AppInstallBanner__guide {
	max-width: 1px;
	padding-right: 13px;
	width: 100%
}

.-cx-PRIVATE-AppInstallBanner__guideHeader {
	font-size: 15px;
	font-weight: 600;
	line-height: 15px;
	margin: 0 0 2px
}

.-cx-PRIVATE-AppInstallBanner__guideText {
	font-size: 12px;
	font-weight: 500;
	line-height: 12px;
	margin: 0
}

.-cx-PRIVATE-AppInstallBanner__logo {
	left: 0;
	position: absolute;
	top: 0
}

.-cx-PRIVATE-AppInstallBanner__guide,
	.-cx-PRIVATE-AppInstallBanner__actions {
	display: table-cell;
	vertical-align: top
}

.-cx-PRIVATE-AppInstallBanner__guideHeader,
	.-cx-PRIVATE-AppInstallBanner__guideText,
	.-cx-PRIVATE-AppInstallBanner__CTA {
	color: #fff;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap
}

.-cx-PRIVATE-AppInstallBanner__blueCTA {
	background: #fff;
	color: #4090db;
	text-transform: none
}
</style>
<style type="text/css" data-isostyle-id="is-641dc896">
.-cx-PRIVATE-Modal__root {
	background-color: rgba(0, 0, 0, .5);
	bottom: 0;
	-webkit-box-pack: justify;
	-webkit-justify-content: space-between;
	-ms-flex-pack: justify;
	justify-content: space-between;
	left: 0;
	position: fixed;
	right: 0;
	top: 0;
	z-index: 1
}

.-cx-PRIVATE-Modal__closeButton {
	background: 0 0;
	border: none;
	cursor: pointer;
	height: 36px;
	outline: none;
	overflow: hidden;
	position: absolute;
	right: 0;
	top: 0;
	z-index: 2
}

.-cx-PRIVATE-Modal__closeButton::before {
	color: #fff;
	content: '\00D7';
	display: block;
	font-size: 36px;
	font-weight: 600;
	line-height: 36px;
	padding: 0;
	margin: 0
}

.-cx-PRIVATE-Modal__contents {
	margin: auto;
	max-width: 935px;
	pointer-events: auto;
	width: 100%
}

.-cx-PRIVATE-Modal__viewportChildren {
	bottom: 0;
	left: 0;
	pointer-events: none;
	position: fixed;
	right: 0;
	top: 0;
	z-index: 0
}

.-cx-PRIVATE-Modal__viewportChildren * {
	pointer-events: auto
}

.-cx-PRIVATE-Modal__wrapper {
	height: 100%;
	overflow: auto;
	width: auto;
	z-index: 1
}

@media ( min-width :481px) {
	.-cx-PRIVATE-Modal__wrapper {
		padding: 0 40px;
		pointer-events: none;
		-webkit-transform: translate3d(0, 0, 0);
		transform: translate3d(0, 0, 0)
	}
	.-cx-PRIVATE-Modal__wrapper::after, .-cx-PRIVATE-Modal__wrapper::before
		{
		content: '';
		display: block;
		-webkit-flex-basis: 40px;
		-ms-flex-preferred-size: 40px;
		flex-basis: 40px;
		-webkit-flex-shrink: 0;
		-ms-flex-negative: 0;
		flex-shrink: 0
	}
}

@media ( max-width :480px) {
	.-cx-PRIVATE-Modal__closeButton, .-cx-PRIVATE-Modal__viewportChildren {
		display: none
	}
}
</style>
<style type="text/css" data-isostyle-id="is4e0a3d03">
.-cx-PRIVATE-AppInstallModal__root {
	background: #FFF;
	border-radius: 5px;
	margin: 0 auto;
	padding: 50px 75px
}

.-cx-PRIVATE-AppInstallModal__appInstallLinks {
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row;
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	margin-top: 30px
}

.-cx-PRIVATE-AppInstallModal__closeButton {
	background: 0 0;
	border: none;
	cursor: pointer;
	height: 54px;
	outline: 0;
	overflow: hidden;
	position: absolute;
	right: 0;
	top: 0
}

.-cx-PRIVATE-AppInstallModal__closeButton::before {
	color: #c9cbcc;
	content: '\00D7';
	display: block;
	font-size: 24px;
	padding: 15px
}

.-cx-PRIVATE-AppInstallModal__installText {
	color: #34373b;
	font-size: 18px;
	line-height: 24px;
	margin: 0 auto;
	max-width: 250px
}
</style>
<style type="text/css" data-isostyle-id="is1a353bea">
.-cx-PRIVATE-LanguageSwitcher__root {
	color: #125688;
	cursor: pointer;
	display: inline-block;
	font-weight: 600;
	position: relative;
	text-transform: uppercase;
	vertical-align: top
}

.-cx-PRIVATE-LanguageSwitcher__root:hover {
	color: #0d3c5f
}

.-cx-PRIVATE-LanguageSwitcher__comboBox {
	cursor: pointer;
	left: 0;
	opacity: 0;
	position: absolute;
	top: 0
}
</style>
<style type="text/css" data-isostyle-id="is-2b83c814">
.-cx-PRIVATE-Footer__main {
	font-size: 12px;
	font-weight: 600;
	margin: 0 auto;
	text-transform: uppercase;
	width: 100%
}

.-cx-PRIVATE-Footer__copyright {
	color: #4b4f54
}

.-cx-PRIVATE-Footer__navItem {
	display: inline-block;
	margin-bottom: 7px;
	margin-right: 16px
}

.-cx-PRIVATE-Footer__navItem:last-child {
	margin-right: 0
}

.-cx-PRIVATE-Footer__navItems {
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	margin-bottom: 3px
}

@media ( min-width :875px) {
	.-cx-PRIVATE-Footer__flexible {
		-webkit-box-orient: horizontal;
		-webkit-box-direction: normal;
		-webkit-flex-direction: row;
		-ms-flex-direction: row;
		flex-direction: row;
		-webkit-flex-wrap: wrap;
		-ms-flex-wrap: wrap;
		flex-wrap: wrap;
		-webkit-box-pack: justify;
		-webkit-justify-content: space-between;
		-ms-flex-pack: justify;
		justify-content: space-between;
		padding: 38px 0
	}
	.-cx-PRIVATE-Footer__flexible .-cx-PRIVATE-Footer__nav {
		max-width: 100%
	}
	.-cx-PRIVATE-Footer__flexible .-cx-PRIVATE-Footer__navItems {
		margin-right: 16px
	}
}

@media ( max-width :874px) {
	.-cx-PRIVATE-Footer__flexible {
		padding: 10px 0;
		text-align: center
	}
	.-cx-PRIVATE-Footer__flexible .-cx-PRIVATE-Footer__navItems {
		-webkit-box-pack: center;
		-webkit-justify-content: center;
		-ms-flex-pack: center;
		justify-content: center;
		margin: 0 auto;
		max-width: 360px
	}
}

.-cx-PRIVATE-Footer__slim {
	padding: 10px 0;
	text-align: center
}

.-cx-PRIVATE-Footer__slim .-cx-PRIVATE-Footer__navItems {
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	margin: 0 auto;
	max-width: 360px
}
</style>
<style type="text/css" data-isostyle-id="is-5a9bc4b2">
.-cx-PRIVATE-PostsStatistic__rootStacked {
	text-align: center
}

.-cx-PRIVATE-PostsStatistic__count {
	color: #34373b;
	font-weight: 600
}

.-cx-PRIVATE-PostsStatistic__countStackedVariant {
	display: block
}
</style>
<style type="text/css" data-isostyle-id="is36523974">
.-cx-PRIVATE-Search__root {
	background: #fff;
	border: solid 1px #edeeee;
	border-radius: 3px;
	box-shadow: 0 0 5px rgba(0, 0, 0, .13);
	display: block;
	position: absolute;
	right: -12px;
	top: 18px;
	width: 243px;
	z-index: 2
}

.-cx-PRIVATE-Search__root::after {
	border-color: transparent transparent #fff transparent;
	border-style: solid;
	border-width: 0 10px 10px 10px;
	content: ' ';
	height: 0;
	left: 110px;
	position: absolute;
	top: -10px;
	width: 0;
	z-index: 3
}

.-cx-PRIVATE-Search__triangle {
	background: #fff;
	border: solid 1px #edeeee;
	box-shadow: 0 0 5px 1px rgba(0, 0, 0, .13);
	content: ' ';
	height: 14px;
	left: 99px;
	position: absolute;
	top: 12px;
	-webkit-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	transform: rotate(45deg);
	width: 14px;
	z-index: 1
}

.-cx-PRIVATE-Search__avatar {
	border: solid 1px #edeeef;
	border-radius: 30px;
	float: left;
	height: 30px;
	margin: 7px 10px 0 0;
	width: 30px
}

.-cx-PRIVATE-Search__hashtag {
	float: left;
	margin: 12px 18px 0 10px;
	width: 14px
}

.-cx-PRIVATE-Search__noResults {
	color: #a5a7aa;
	font-size: 14px;
	padding: 15px;
	text-align: center
}

.-cx-PRIVATE-Search__place {
	float: left;
	margin: 12px 18px 0 8px;
	width: 16px
}

.-cx-PRIVATE-Search__result {
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	border-bottom: solid 1px #edeeef;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row;
	-webkit-flex-shrink: 0;
	-ms-flex-negative: 0;
	flex-shrink: 0;
	height: 50px;
	padding: 8px 14px
}

.-cx-PRIVATE-Search__result:last-child {
	border: none
}

.-cx-PRIVATE-Search__resultLink {
	display: inline;
	margin-right: 0;
	padding-bottom: 5px;
	white-space: nowrap;
	width: 100%
}

.-cx-PRIVATE-Search__resultDescription {
	color: #c9c8cd;
	display: block;
	font-size: 14px;
	font-weight: 300;
	line-height: 22px;
	overflow: hidden;
	text-align: left;
	text-overflow: ellipsis
}

.-cx-PRIVATE-Search__resultTitle {
	color: #070809;
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row;
	font-size: 14px;
	font-weight: 400;
	margin-top: 3px;
	overflow: hidden;
	text-align: left
}

.-cx-PRIVATE-Search__resultTitleText {
	line-height: 22px;
	margin-bottom: -4px;
	max-width: 140px;
	overflow: hidden;
	text-overflow: ellipsis
}

.-cx-PRIVATE-Search__resultTitleSingleLine {
	margin-top: 12px
}

.-cx-PRIVATE-Search__resultsList {
	max-height: 362px;
	overflow-y: auto;
	overflow-x: hidden;
	padding: 0
}

.-cx-PRIVATE-Search__searchInput {
	border: solid 1px #edeeef;
	font-size: 16px;
	font-weight: 600;
	margin: 10px;
	outline: none;
	padding: 10px;
	width: 358px
}

.-cx-PRIVATE-Search__selected {
	background: #fafafa
}

.-cx-PRIVATE-Search__verifiedBadge {
	display: block;
	height: 12px;
	margin-left: 5px;
	margin-top: 4px;
	position: absolute;
	width: 12px
}

@media ( max-width :639px) {
	.-cx-PRIVATE-Search__searchInput {
		width: inherit
	}
}
</style>
<style type="text/css" data-isostyle-id="is-1af6c563">
.-cx-PRIVATE-SearchBox__root {
	left: 50%;
	margin-left: -183px;
	position: absolute;
	top: 0
}

.-cx-PRIVATE-SearchBox__activeSearchIcon {
	left: 11px;
	position: absolute;
	top: 9px;
	z-index: 2
}

.-cx-PRIVATE-SearchBox__inactiveLabel {
	background: #fafafa;
	border: solid 1px #edeeee;
	border-radius: 15px;
	color: #818488;
	cursor: text;
	font-size: 14px;
	font-weight: 300;
	height: 28px;
	left: 0;
	padding: 7px;
	position: absolute;
	text-align: center;
	top: 0;
	width: 215px;
	z-index: 2
}

.-cx-PRIVATE-SearchBox__inactiveSearchCaption {
	display: inline;
	left: -5px
}

.-cx-PRIVATE-SearchBox__inactiveSearchIcon {
	display: inline-block;
	margin-right: 6px;
	vertical-align: baseline
}

.-cx-PRIVATE-SearchBox__inactiveSearchQuery {
	display: inline-block;
	max-width: 140px;
	overflow: hidden;
	text-overflow: ellipsis;
	vertical-align: bottom;
	white-space: nowrap
}

.-cx-PRIVATE-SearchBox__input {
	border-radius: 15px;
	border: solid 1px #edeeee;
	font-size: 14px;
	height: 20px;
	outline: none;
	padding: 3px 10px 3px 26px;
	width: 178px;
	z-index: 2
}

.-cx-PRIVATE-SearchBox__modalBackground {
	bottom: 0;
	left: 0;
	position: fixed;
	right: 0;
	top: 0;
	z-index: 1
}

.-cx-PRIVATE-SearchBox__spinner {
	left: 200px;
	position: absolute;
	top: 14px;
	z-index: 3
}
</style>
<style type="text/css" data-isostyle-id="is-4751c673">
.-cx-PRIVATE-Navigation__main {
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row;
	margin: 0 auto;
	width: 100%
}

.-cx-PRIVATE-Navigation__brand {
	-webkit-flex-shrink: 0;
	-ms-flex-negative: 0;
	flex-shrink: 0;
	left: -3px;
	margin-bottom: -2px;
	position: relative
}

.-cx-PRIVATE-Navigation__menuItems {
	-webkit-align-content: center;
	-ms-flex-line-pack: center;
	align-content: center;
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row;
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	-webkit-flex-shrink: 1;
	-ms-flex-negative: 1;
	flex-shrink: 1;
	-webkit-flex-wrap: wrap;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	-webkit-box-pack: end;
	-webkit-justify-content: flex-end;
	-ms-flex-pack: end;
	justify-content: flex-end;
	width: 0
}

.-cx-PRIVATE-Navigation__menuLink, .-cx-PRIVATE-Navigation__menuItems button
	{
	font-weight: 600;
	overflow: hidden;
	text-align: right;
	text-overflow: ellipsis;
	white-space: nowrap
}

.-cx-PRIVATE-Navigation__menuItems button {
	background: 0 0;
	border: 0;
	cursor: pointer;
	padding: 0
}

.-cx-PRIVATE-Navigation__getAppLink, .-cx-PRIVATE-Navigation__getAppLink:visited,
	.-cx-PRIVATE-Navigation__openInAppButton {
	color: #4090db
}

.-cx-PRIVATE-Navigation__getAppLink:hover,
	.-cx-PRIVATE-Navigation__openInAppButton:hover {
	color: #2d6599
}

.-cx-PRIVATE-Navigation__getAppLink:active,
	.-cx-PRIVATE-Navigation__openInAppButton:active {
	color: #20486d
}

@media ( orientation :portrait) and (min-width:448px) , ( orientation
	:landscape) and (min-height:415px) {
	.-cx-PRIVATE-Navigation__main {
		height: 77px;
		padding: 26px 0
	}
	.-cx-PRIVATE-Navigation__menuLink, .-cx-PRIVATE-Navigation__menuItems button
		{
		font-size: 16px;
		line-height: 22px;
		margin-right: 20px
	}
	.-cx-PRIVATE-Navigation__menuItems {
		margin-left: 30px;
		margin-right: -20px
	}
}

@media ( orientation :portrait) and (max-width:447px) , ( orientation
	:landscape) and (max-height:414px) {
	.-cx-PRIVATE-Navigation__brand {
		margin-right: -41px;
		-webkit-transform: translate3d(0, 0, 0) scale(.67);
		transform: translate3d(0, 0, 0) scale(.67);
		-webkit-transform-origin: left;
		-ms-transform-origin: left;
		transform-origin: left
	}
	.-cx-PRIVATE-Navigation__main {
		height: 77px;
		padding: 26px 0
	}
	.-cx-PRIVATE-Navigation__menuLink, .-cx-PRIVATE-Navigation__menuItems button
		{
		font-size: 14px;
		line-height: 17px;
		margin-right: 15px
	}
	.-cx-PRIVATE-Navigation__menuItems {
		margin-left: 20px;
		margin-right: -15px
	}
}

@media ( max-width :475px) {
	.-cx-PRIVATE-Navigation__searchBoxContainer {
		display: none
	}
}
</style>
<style type="text/css" data-isostyle-id="is-cd2c611">
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
	b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline
}

body {
	line-height: 1
}

ol, ul {
	list-style: none
}

blockquote, q {
	quotes: none
}

blockquote:before, blockquote:after, q:before, q:after {
	content: '';
	content: none
}

table {
	border-collapse: collapse;
	border-spacing: 0
}
</style>
<style type="text/css" data-isostyle-id="is68ef3ac5">
article, div, footer, header, main, nav, section, #react-root {
	-webkit-box-align: stretch;
	-webkit-align-items: stretch;
	-ms-flex-align: stretch;
	align-items: stretch;
	border: 0 solid #000;
	box-sizing: border-box;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column;
	-webkit-flex-shrink: 0;
	-ms-flex-negative: 0;
	flex-shrink: 0;
	margin: 0;
	padding: 0;
	position: relative
}
</style>
<style type="text/css" data-isostyle-id="is-2b08c812">
html, body {
	height: 100%
}

#react-root {
	height: 100%;
	z-index: 0
}
</style>
<style type="text/css" data-isostyle-id="is-43ccc62c">
body, button, input, textarea {
	font-family: 'proxima-nova', 'Helvetica Neue', Arial, Helvetica,
		sans-serif
}

a, a:visited {
	color: #125688;
	text-decoration: none
}

a:hover {
	color: #0d3c5f
}

a:active {
	color: #092b44
}
</style>
<style type="text/css" data-isostyle-id="is-63d6c88b">
.-cx-PRIVATE-Shell__main {
	min-height: 100%;
	overflow: hidden
}

.-cx-PRIVATE-Shell__appInstallBanner {
	-webkit-box-ordinal-group: 1;
	-webkit-order: 0;
	-ms-flex-order: 0;
	order: 0
}

.-cx-PRIVATE-Shell__content {
	background-color: #fafafa;
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	-webkit-box-ordinal-group: 3;
	-webkit-order: 2;
	-ms-flex-order: 2;
	order: 2
}

.-cx-PRIVATE-Shell__footer {
	background-color: #fafafa;
	-webkit-box-ordinal-group: 4;
	-webkit-order: 3;
	-ms-flex-order: 3;
	order: 3;
	padding: 0 20px
}

.-cx-PRIVATE-Shell__nav {
	border-bottom-color: #edeeee;
	border-bottom-width: 1px;
	-webkit-box-ordinal-group: 2;
	-webkit-order: 1;
	-ms-flex-order: 1;
	order: 1;
	padding: 0 20px
}
</style>
<style type="text/css" data-isostyle-id="is5b593b58">
.-cx-PRIVATE-LandingPage__root {
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row;
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	margin: 30px auto 0;
	max-width: 935px;
	width: 100%
}

@media ( max-width :874px) {
	.-cx-PRIVATE-LandingPage__phones {
		display: none
	}
}

@media ( max-width :349px) {
	.-cx-PRIVATE-LandingPage__root {
		margin-top: 0
	}
}
</style>
<style type="text/css">
.fb_hidden {
	position: absolute;
	top: -10000px;
	z-index: 10001
}

.fb_reposition {
	overflow-x: hidden;
	position: relative
}

.fb_invisible {
	display: none
}

.fb_reset {
	background: none;
	border: 0;
	border-spacing: 0;
	color: #000;
	cursor: auto;
	direction: ltr;
	font-family: "lucida grande", tahoma, verdana, arial, sans-serif;
	font-size: 11px;
	font-style: normal;
	font-variant: normal;
	font-weight: normal;
	letter-spacing: normal;
	line-height: 1;
	margin: 0;
	overflow: visible;
	padding: 0;
	text-align: left;
	text-decoration: none;
	text-indent: 0;
	text-shadow: none;
	text-transform: none;
	visibility: visible;
	white-space: normal;
	word-spacing: normal
}

.fb_reset>div {
	overflow: hidden
}

.fb_link img {
	border: none
}

.fb_dialog {
	background: rgba(82, 82, 82, .7);
	position: absolute;
	top: -10000px;
	z-index: 10001
}

.fb_reset .fb_dialog_legacy {
	overflow: visible
}

.fb_dialog_advanced {
	padding: 10px;
	-moz-border-radius: 8px;
	-webkit-border-radius: 8px;
	border-radius: 8px
}

.fb_dialog_content {
	background: #fff;
	color: #333
}

.fb_dialog_close_icon {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v2/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 0 transparent;
	_background-image:
		url(https://static.xx.fbcdn.net/rsrc.php/v2/yL/r/s816eWC-2sl.gif);
	cursor: pointer;
	display: block;
	height: 15px;
	position: absolute;
	right: 18px;
	top: 17px;
	width: 15px
}

.fb_dialog_mobile .fb_dialog_close_icon {
	top: 5px;
	left: 5px;
	right: auto
}

.fb_dialog_padding {
	background-color: transparent;
	position: absolute;
	width: 1px;
	z-index: -1
}

.fb_dialog_close_icon:hover {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v2/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 -15px transparent;
	_background-image:
		url(https://static.xx.fbcdn.net/rsrc.php/v2/yL/r/s816eWC-2sl.gif)
}

.fb_dialog_close_icon:active {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v2/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 -30px transparent;
	_background-image:
		url(https://static.xx.fbcdn.net/rsrc.php/v2/yL/r/s816eWC-2sl.gif)
}

.fb_dialog_loader {
	background-color: #f6f7f8;
	border: 1px solid #606060;
	font-size: 24px;
	padding: 20px
}

.fb_dialog_top_left, .fb_dialog_top_right, .fb_dialog_bottom_left,
	.fb_dialog_bottom_right {
	height: 10px;
	width: 10px;
	overflow: hidden;
	position: absolute
}

.fb_dialog_top_left {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v2/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 0;
	left: -10px;
	top: -10px
}

.fb_dialog_top_right {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v2/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 -10px;
	right: -10px;
	top: -10px
}

.fb_dialog_bottom_left {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v2/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 -20px;
	bottom: -10px;
	left: -10px
}

.fb_dialog_bottom_right {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v2/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 -30px;
	right: -10px;
	bottom: -10px
}

.fb_dialog_vert_left, .fb_dialog_vert_right, .fb_dialog_horiz_top,
	.fb_dialog_horiz_bottom {
	position: absolute;
	background: #525252;
	filter: alpha(opacity = 70);
	opacity: .7
}

.fb_dialog_vert_left, .fb_dialog_vert_right {
	width: 10px;
	height: 100%
}

.fb_dialog_vert_left {
	margin-left: -10px
}

.fb_dialog_vert_right {
	right: 0;
	margin-right: -10px
}

.fb_dialog_horiz_top, .fb_dialog_horiz_bottom {
	width: 100%;
	height: 10px
}

.fb_dialog_horiz_top {
	margin-top: -10px
}

.fb_dialog_horiz_bottom {
	bottom: 0;
	margin-bottom: -10px
}

.fb_dialog_iframe {
	line-height: 0
}

.fb_dialog_content .dialog_title {
	background: #6d84b4;
	border: 1px solid #3a5795;
	color: #fff;
	font-size: 14px;
	font-weight: bold;
	margin: 0
}

.fb_dialog_content .dialog_title>span {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v2/yd/r/Cou7n-nqK52.gif)
		no-repeat 5px 50%;
	float: left;
	padding: 5px 0 7px 26px
}

body.fb_hidden {
	-webkit-transform: none;
	height: 100%;
	margin: 0;
	overflow: visible;
	position: absolute;
	top: -10000px;
	left: 0;
	width: 100%
}

.fb_dialog.fb_dialog_mobile.loading {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v2/ya/r/3rhSv5V8j3o.gif)
		white no-repeat 50% 50%;
	min-height: 100%;
	min-width: 100%;
	overflow: hidden;
	position: absolute;
	top: 0;
	z-index: 10001
}

.fb_dialog.fb_dialog_mobile.loading.centered {
	width: auto;
	height: auto;
	min-height: initial;
	min-width: initial;
	background: none
}

.fb_dialog.fb_dialog_mobile.loading.centered #fb_dialog_loader_spinner {
	width: 100%
}

.fb_dialog.fb_dialog_mobile.loading.centered .fb_dialog_content {
	background: none
}

.loading.centered #fb_dialog_loader_close {
	color: #fff;
	display: block;
	padding-top: 20px;
	clear: both;
	font-size: 18px
}

#fb-root #fb_dialog_ipad_overlay {
	background: rgba(0, 0, 0, .45);
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	min-height: 100%;
	z-index: 10000
}

#fb-root #fb_dialog_ipad_overlay.hidden {
	display: none
}

.fb_dialog.fb_dialog_mobile.loading iframe {
	visibility: hidden
}

.fb_dialog_content .dialog_header {
	-webkit-box-shadow: white 0 1px 1px -1px inset;
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#738ABA),
		to(#2C4987));
	border-bottom: 1px solid;
	border-color: #1d4088;
	color: #fff;
	font: 14px Helvetica, sans-serif;
	font-weight: bold;
	text-overflow: ellipsis;
	text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0;
	vertical-align: middle;
	white-space: nowrap
}

.fb_dialog_content .dialog_header table {
	-webkit-font-smoothing: subpixel-antialiased;
	height: 43px;
	width: 100%
}

.fb_dialog_content .dialog_header td.header_left {
	font-size: 12px;
	padding-left: 5px;
	vertical-align: middle;
	width: 60px
}

.fb_dialog_content .dialog_header td.header_right {
	font-size: 12px;
	padding-right: 5px;
	vertical-align: middle;
	width: 60px
}

.fb_dialog_content .touchable_button {
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#4966A6),
		color-stop(.5, #355492), to(#2A4887));
	border: 1px solid #2f477a;
	-webkit-background-clip: padding-box;
	-webkit-border-radius: 3px;
	-webkit-box-shadow: rgba(0, 0, 0, .117188) 0 1px 1px inset,
		rgba(255, 255, 255, .167969) 0 1px 0;
	display: inline-block;
	margin-top: 3px;
	max-width: 85px;
	line-height: 18px;
	padding: 4px 12px;
	position: relative
}

.fb_dialog_content .dialog_header .touchable_button input {
	border: none;
	background: none;
	color: #fff;
	font: 12px Helvetica, sans-serif;
	font-weight: bold;
	margin: 2px -12px;
	padding: 2px 6px 3px 6px;
	text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0
}

.fb_dialog_content .dialog_header .header_center {
	color: #fff;
	font-size: 16px;
	font-weight: bold;
	line-height: 18px;
	text-align: center;
	vertical-align: middle
}

.fb_dialog_content .dialog_content {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v2/y9/r/jKEcVPZFk-2.gif)
		no-repeat 50% 50%;
	border: 1px solid #555;
	border-bottom: 0;
	border-top: 0;
	height: 150px
}

.fb_dialog_content .dialog_footer {
	background: #f6f7f8;
	border: 1px solid #555;
	border-top-color: #ccc;
	height: 40px
}

#fb_dialog_loader_close {
	float: left
}

.fb_dialog.fb_dialog_mobile .fb_dialog_close_button {
	text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0
}

.fb_dialog.fb_dialog_mobile .fb_dialog_close_icon {
	visibility: hidden
}

#fb_dialog_loader_spinner {
	animation: rotateSpinner 1.2s linear infinite;
	background-color: transparent;
	background-image:
		url(https://static.xx.fbcdn.net/rsrc.php/v2/yD/r/t-wz8gw1xG1.png);
	background-repeat: no-repeat;
	background-position: 50% 50%;
	height: 24px;
	width: 24px
}

@
keyframes rotateSpinner { 0%{
	transform: rotate(0deg)
}

100%{
transform
:rotate(360deg)
}
}
.fb_iframe_widget {
	display: inline-block;
	position: relative
}

.fb_iframe_widget span {
	display: inline-block;
	position: relative;
	text-align: justify
}

.fb_iframe_widget iframe {
	position: absolute
}

.fb_iframe_widget_fluid_desktop, .fb_iframe_widget_fluid_desktop span,
	.fb_iframe_widget_fluid_desktop iframe {
	max-width: 100%
}

.fb_iframe_widget_fluid_desktop iframe {
	min-width: 220px;
	position: relative
}

.fb_iframe_widget_lift {
	z-index: 1
}

.fb_hide_iframes iframe {
	position: relative;
	left: -10000px
}

.fb_iframe_widget_loader {
	position: relative;
	display: inline-block
}

.fb_iframe_widget_fluid {
	display: inline
}

.fb_iframe_widget_fluid span {
	width: 100%
}

.fb_iframe_widget_loader iframe {
	min-height: 32px;
	z-index: 2;
	zoom: 1
}

.fb_iframe_widget_loader .FB_Loader {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v2/y9/r/jKEcVPZFk-2.gif)
		no-repeat;
	height: 32px;
	width: 32px;
	margin-left: -16px;
	position: absolute;
	left: 50%;
	z-index: 4
}
</style>

<script>
		$(function() {
			
			$('#loginBtn').click(function(){
				
				var idInput = $('input:text[name=nickname]');
				var idValue = trim(idInput.val());
				var message = $('#check')
				if(idValue === "")
				{
					message.text("닉네임을 입력하세요.");
					idInput.select();
					return false;
				}
				
				var pw = $('input:password[name=pass]');
				var pwValue = trim(pw.val());
				if(pw.val() == "")
				{
					message.text("비밀번호를 반드시 입력해야 합니다.");
					pw.focus();
					return false;
				}
				if(pw.val().length < 4 || pw.val().length > 20)
				{
					message.text("비밀번호는 4자 이상 20자 이하 입니다.");
					pw.select();
					return false;
				}
				
	    		$.ajax({
	    			type:'POST',
	    			url:'login',
	    			dataType:'text',
	    			data:{nickname:idValue, pass:pwValue},
	    			success:function(text){
	    			  if ( text === "loginSuccess" ) {
	    				  location.href="/Kostagram"
	    			  } else if ( text === "loginFail" ) {
	    				  message.text("닉네임 또는 비밀번호가 틀렸습니다");
	    			  }
	    			},
	    			error:function() {
	    				alert("error");
	    			}
	    		});
	    	});
		});
		
		
		
		
		
		
</script>




</head>
<body class="">

	<span id="react-root"><section class="-cx-PRIVATE-Shell__main"
			data-reactid=".0">
		<main class="-cx-PRIVATE-Shell__content" role="main"
			data-reactid=".0.1">
		<article class="-cx-PRIVATE-LandingPage__root" data-reactid=".0.1.0">
		<div
			class="-cx-PRIVATE-PhoneSlideshow__root -cx-PRIVATE-LandingPage__phones"
			data-reactid=".0.1.0.0">
			<div class="-cx-PRIVATE-PhoneSlideshow__iPhoneOverlay"
				data-reactid=".0.1.0.0.0">
				<span data-reactid=".0.1.0.0.0.0"><img
					class="-cx-PRIVATE-PhoneSlideshow__screenshot"
					src="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/images/homepage/screenshot4.jpg"
					data-reactid=".0.1.0.0.0.0.$=1$s4"></span>
			</div>
		</div>
		<div
			class="-cx-PRIVATE-LandingActionsColumn__root -cx-PRIVATE-LandingPage__actions"
			data-reactid=".0.1.0.1">
			<div class="-cx-PRIVATE-LandingActionsColumn__box"
				data-reactid=".0.1.0.1.0">
				<a href="http://localhost/Kostagram"><div><img src="img/web/index.png" ></div></a>
					
				<div class="-cx-PRIVATE-SlimLoginForm__root"
					data-reactid=".0.1.0.1.0.1">
					<form class="-cx-PRIVATE-SlimLoginForm__form"
						data-reactid=".0.1.0.1.0.1.0"
						id="joinForm" method="post" action="#" align="center">
						<div
							class="-cx-PRIVATE-SlimLoginForm__inputField -cx-PRIVATE-SlimTextInput__root"
							data-reactid=".0.1.0.1.0.1.0.0">
							<input
								class="-cx-PRIVATE-SlimTextInput__input -cx-PRIVATE-TextInput__root"
								aria-describedby="" aria-label="사용자 이름" aria-required="true"
								autocapitalize="off" autocorrect="off" maxlength="30"
								name="nickname" placeholder="사용자 이름" value="" type="text"
								data-reactid=".0.1.0.1.0.1.0.0.0">
						</div>
						<div
							class="-cx-PRIVATE-SlimLoginForm__inputField -cx-PRIVATE-SlimTextInput__root"
							data-reactid=".0.1.0.1.0.1.0.1">
							<input
								class="-cx-PRIVATE-SlimTextInput__input -cx-PRIVATE-TextInput__root"
								aria-describedby="" aria-label="비밀번호" aria-required="true"
								autocapitalize="off" autocorrect="off" name="pass"
								placeholder="비밀번호" type="password" value=""
								data-reactid=".0.1.0.1.0.1.0.1.0">
							<div class="-cx-PRIVATE-SlimTextInput__indicators"
								data-reactid=".0.1.0.1.0.1.0.1.1">
								<a href ="pw_forget.jsp" class="-cx-PRIVATE-SlimTextInput__forgot"
									href="/accounts/password/reset/"
									data-reactid=".0.1.0.1.0.1.0.1.1.0">비밀번호를 잊으셨나요?</a>
							</div>
						</div>
						<div>
						<input type= "button" value="로그인"
							class="-cx-PRIVATE-SlimLoginForm__button -cx-PRIVATE-IGButton__root -cx-PRIVATE-IGButton__solid -cx-PRIVATE-IGButton__sizeLarge -cx-PRIVATE-IGButton__enabled"
							id="loginBtn" >
						</div>
						<p align="center" id="check" style="color:red"></p>
					</form>
				</div>
			</div>
			
		</div>
		</article></main>
		<footer class="-cx-PRIVATE-Shell__footer" role="contentinfo"
			data-reactid=".0.3">
		<div class="-cx-PRIVATE-Footer__main -cx-PRIVATE-Footer__flexible"
			style="max-width: 935px;" data-reactid=".0.3.0">
			<nav class="-cx-PRIVATE-Footer__nav" role="navigation"
				data-reactid=".0.3.0.0">
			
			</nav>
			<span class="-cx-PRIVATE-Footer__copyright" data-reactid=".0.3.0.1">©
				2015 Kostagram</span>
		</div>
		</footer>
		<noscript data-reactid=".0.4"></noscript>
		</section></span>





	<script type="text/javascript">window._sharedData = {"qs":"{\"shift\":10,\"header\":\"GY2rd8BZLDGMAehrhNrDK6iuYBLUNezH\",\"edges\":100,\"blob\":\"AQBZboDptPRUoBmCzE51yRJBXi_3sNPXZfiToINYz1M8IXhcNe4UVy16cySLPaa_McQ5sDrg_anaHrD6mSt8vteWkyoB-jF_V8vYT-1JJ1ZrR4Xwdva6jV2k1TQxLJPgtZiX5e2WX0c9MCgYB8LIjP5IpwzhUpnQceWrSS4jyfn0yHKF1bAHRyuPD1OPGsLd6n9xr5EXEc5YLPnFQ8W1TGbHPq5Hx4KzFGeBC-pTvaAlAA\",\"iterations\":7,\"size\":42}","static_root":"\/\/instagramstatic-a.akamaihd.net\/bluebar\/9308ef9","entry_data":{"LandingPage":[{"__query_string":"?","__path":"\/","__get_params":{}}]},"hostname":"instagram.com","platform":"web","qe":{"su":{"p":{},"g":""}},"display_properties_server_guess":{"viewport_width":360,"pixel_ratio":1.5},"country_code":"KR","language_code":"ko","gatekeepers":{"rhp":true},"config":{"dismiss_app_install_banner_until":null,"viewer":null,"csrf_token":"54be394e9fdd209461f0496bdaded9bd"},"environment_switcher_visible_server_guess":true};</script>
	<script
		src="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/bundles/ko_KR_webpack-common.js"
		type="text/javascript"></script>

	<noscript></noscript>




	<div id="fb-root" class=" fb_reset">
		<div
			style="position: absolute; top: -10000px; height: 0px; width: 0px;">
			<div></div>
		</div>
		<div
			style="position: absolute; top: -10000px; height: 0px; width: 0px;">
			<div></div>
		</div>
	</div>
</body>
</html>
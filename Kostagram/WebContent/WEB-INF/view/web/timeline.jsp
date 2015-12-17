<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.StringTokenizer" %>
<%@ page import="com.kostagram.service.beans.ArticleVO"%>
<%@ page import="com.kostagram.service.beans.PhotoInfoVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	ArrayList<ArticleVO> articleList = (ArrayList<ArticleVO>) request.getAttribute("timeline");
	String nickname = (String) request.getParameter("nickname");
%>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>Kostagram</title>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="m/js/common.js"></script>

<script src="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/scripts/webfont.js" type="text/javascript" async=""></script>

<style type="text/css">
/* @license
   * MyFonts Webfont Build ID 2164953, 2012-03-23T23:06:30-0400
   *
   * The fonts listed in this notice are subject to the End User License
   * Agreement(s) entered into by the website owner. All other parties are
   * explicitly restricted from using the Licensed Webfonts(s).
   *
   * You may obtain a valid license at the URLs below.
   *
   *
   * Webfont: Proxima Nova Light by Mark Simonson
   * URL: http://www.myfonts.com/fonts/marksimonson/proxima-nova/light/
   * Licensed pageviews: unlimited
   *
   * Webfont: Proxima Nova Regular by Mark Simonson
   * URL: http://www.myfonts.com/fonts/marksimonson/proxima-nova/regular/
   * Licensed pageviews: unlimited
   *
   * Webfont: Proxima Nova Semibold by Mark Simonson
   * URL: http://www.myfonts.com/fonts/marksimonson/proxima-nova/semibold/
   * Licensed pageviews: unlimited
   *
   * Webfont: Proxima Nova Bold Italic by Mark Simonson
   * URL: http://www.myfonts.com/fonts/marksimonson/proxima-nova/bold-it/
   * Licensed pageviews: unlimited
   *
   * Webfont: Proxima Nova Bold by Mark Simonson
   * URL: http://www.myfonts.com/fonts/marksimonson/proxima-nova/bold/
   * Licensed pageviews: unlimited
   *
   * Webfont: Proxima Nova Italic by Mark Simonson
   * URL: http://www.myfonts.com/fonts/marksimonson/proxima-nova/regular-it/
   * Licensed pageviews: unlimited
   *
   *
   * License: http://www.myfonts.com/viewlicense?type=web&buildid=2164953
   * Webfonts copyright: Copyright (c) Mark Simonson, 2005. All rights reserved.
   *
   * (c) 2012 Bitstream Inc
   */
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



<meta id="viewport" name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, minimum-scale=1, maximum-scale=1">


<script type="text/javascript">
  (function() {
    var docElement = document.documentElement;
    var classRE = new RegExp('(^|\\s)no-js(\\s|$)');
    var className = docElement.className;
    docElement.className = className.replace(classRE, '$1js$2');
  })();
</script>





<link rel="Shortcut Icon" type="image/x-icon" href="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/images/ico/favicon.ico">
<link rel="mask-icon" href="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/images/ico/favicon.svg" color="#125688">


<link rel="apple-touch-icon-precomposed" href="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/images/ico/apple-touch-icon-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/images/ico/apple-touch-icon-72x72-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/images/ico/apple-touch-icon-114x114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="//instagramstatic-a.akamaihd.net/bluebar/9308ef9/images/ico/apple-touch-icon-144x144-precomposed.png">






<link href="https://www.instagram.com/" rel="alternate" hreflang="x-default">
<link href="https://www.instagram.com/?hl=el" rel="alternate" hreflang="el">
<link href="https://www.instagram.com/?hl=gu" rel="alternate" hreflang="gu">
<link href="https://www.instagram.com/?hl=en" rel="alternate" hreflang="en">
<link href="https://www.instagram.com/?hl=af" rel="alternate" hreflang="af">
<link href="https://www.instagram.com/?hl=vi" rel="alternate" hreflang="vi">
<link href="https://www.instagram.com/?hl=it" rel="alternate" hreflang="it">
<link href="https://www.instagram.com/?hl=kn" rel="alternate" hreflang="kn">
<link href="https://www.instagram.com/?hl=pt-br" rel="alternate" hreflang="pt-br">
<link href="https://www.instagram.com/?hl=cs" rel="alternate" hreflang="cs">
<link href="https://www.instagram.com/?hl=id" rel="alternate" hreflang="id">
<link href="https://www.instagram.com/?hl=es" rel="alternate" hreflang="es">
<link href="https://www.instagram.com/?hl=ru" rel="alternate" hreflang="ru">
<link href="https://www.instagram.com/?hl=nl" rel="alternate" hreflang="nl">
<link href="https://www.instagram.com/?hl=pt" rel="alternate" hreflang="pt">
<link href="https://www.instagram.com/?hl=zh-tw" rel="alternate" hreflang="zh-tw">
<link href="https://www.instagram.com/?hl=nb" rel="alternate" hreflang="nb">
<link href="https://www.instagram.com/?hl=tr" rel="alternate" hreflang="tr">
<link href="https://www.instagram.com/?hl=ne" rel="alternate" hreflang="ne">
<link href="https://www.instagram.com/?hl=zh-cn" rel="alternate" hreflang="zh-cn">
<link href="https://www.instagram.com/?hl=tl" rel="alternate" hreflang="tl">
<link href="https://www.instagram.com/?hl=pa" rel="alternate" hreflang="pa">
<link href="https://www.instagram.com/?hl=th" rel="alternate" hreflang="th">
<link href="https://www.instagram.com/?hl=te" rel="alternate" hreflang="te">
<link href="https://www.instagram.com/?hl=pl" rel="alternate" hreflang="pl">
<link href="https://www.instagram.com/?hl=ta" rel="alternate" hreflang="ta">
<link href="https://www.instagram.com/?hl=fr" rel="alternate" hreflang="fr">
<link href="https://www.instagram.com/?hl=hr" rel="alternate" hreflang="hr">
<link href="https://www.instagram.com/?hl=bn" rel="alternate" hreflang="bn">
<link href="https://www.instagram.com/?hl=de" rel="alternate" hreflang="de">
<link href="https://www.instagram.com/?hl=da" rel="alternate" hreflang="da">
<link href="https://www.instagram.com/?hl=hi" rel="alternate" hreflang="hi">
<link href="https://www.instagram.com/?hl=fi" rel="alternate" hreflang="fi">
<link href="https://www.instagram.com/?hl=hu" rel="alternate" hreflang="hu">
<link href="https://www.instagram.com/?hl=ja" rel="alternate" hreflang="ja">
<link href="https://www.instagram.com/?hl=ml" rel="alternate" hreflang="ml">
<link href="https://www.instagram.com/?hl=ko" rel="alternate" hreflang="ko">
<link href="https://www.instagram.com/?hl=sv" rel="alternate" hreflang="sv">
<link href="https://www.instagram.com/?hl=ur" rel="alternate" hreflang="ur">
<link href="https://www.instagram.com/?hl=sk" rel="alternate" hreflang="sk">
<link href="https://www.instagram.com/?hl=si" rel="alternate" hreflang="si">
<link href="https://www.instagram.com/?hl=ms" rel="alternate" hreflang="ms">
<link href="https://www.instagram.com/?hl=mr" rel="alternate" hreflang="mr">


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
<style type="text/css" data-isostyle-id="is-636cc879">
.-cx-PRIVATE-Photo__root {
	background-color: #edeeee;
	display: block;
	width: 100%
}

.-cx-PRIVATE-Photo__placeholder {
	display: block;
	overflow: hidden;
	padding-bottom: 100%
}

.-cx-PRIVATE-Photo__heart {
	-webkit-animation-duration: .7s;
	animation-duration: .7s;
	-webkit-animation-name: like-heart-animation;
	animation-name: like-heart-animation;
	margin: 0 auto;
	opacity: 0;
	pointer-events: none;
	-webkit-transform: scale(0);
	-ms-transform: scale(0);
	transform: scale(0)
}

.-cx-PRIVATE-Photo__image {
	height: 100%;
	left: 0;
	position: absolute;
	top: 0;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	width: 100%
}

.-cx-PRIVATE-Photo__likeAnimationWrapper {
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center
}

.-cx-PRIVATE-Photo__clickShield,
	.-cx-PRIVATE-Photo__likeAnimationWrapper {
	bottom: 0;
	left: 0;
	position: absolute;
	right: 0;
	top: 0
}

@
-webkit-keyframes like-heart-animation { 0%{
	opacity: 0;
	-webkit-transform: scale(0);
	transform: scale(0)
}

15%,70%{
opacity














:














1
}
15%,70%,100%{
-webkit-transform














:scale(1)














;
transform














:scale(1)














}
100%{
opacity














:














0
}
}
@
keyframes like-heart-animation { 0%{
	opacity: 0;
	-webkit-transform: scale(0);
	transform: scale(0)
}
15%,70%{
opacity














:














1
}
15%,70%,100%{
-webkit-transform














:scale(1)














;
transform














:scale(1)














}
100%{
opacity














:














0
}
}
</style>
<style type="text/css" data-isostyle-id="is4f153d27">
.-cx-PRIVATE-VideoPlayButton__root {
	background-color: transparent;
	background-image:
		url(data:image/png;base64,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);
	background-size: 100% 100%;
	border: 0;
	min-height: 80px;
	min-width: 80px;
	padding: 0
}

.-cx-PRIVATE-VideoPlayButton__root::before {
	background-size: 100% 100%;
	content: '';
	display: block;
	padding-top: 100%;
	background-image:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAUAAAAFABAMAAAA/vriZAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAYUExURQAAAP///////////////////////////yN+nV8AAAAHdFJOUwC8E+o/bo54pz/7AAACVklEQVR42u2c203DQBAAU0MqoAgKoARaQUi4fcQjwXHutfdxO0EzFYyEJtjn2z2dREREREREREREREREREREREREREREREREREREROQhONMF31/hgtvbC1xw+3iCC27PdMHtTBdEh/IliA7lW5Acyo8gOJRfQW4oF0FsKBdBbChXQWoof4LQUHaCzFD2gshQ9oLIUG4EiaHcCgJDOQjyQjkK4kI5CuJCuROkhXIvCAulIMgKpSSICqUkiAqlKEgKpSwICqUiyAmlJogJpSaICaUqSAmlLggJpSHICKUliAilJYgIpSlICKUtCAilI5gfSk8wPZSeYHooXcHsUPqCyaEMCOaGMiKYGsqIYGooQ4KZoYwJJoYyKJgXyqhgWiijgmmhDAtmhTIumBRKQDAnlIhgSigRwZRQQoIZocQEE0IJCq4PJSq4PJSo4PJQwoKrQ4kLLg5lQnBtKDOCS0OZEVwaypTgylDmBBeG8k8F6X9ieiT4nxn6DzX9Xx39YYH+uIV/YKU/8tNfmuivnfQXd/zRB/3wiH78Rj/ApB8B4w/R6Z8h6B9y6J/C6B8T8Z9j6R+06VcC6Jcq6NdS8Bd76Fej6JfL6Nfz6Bcc8VdE6Zds6deU6Re96Vfl8cMG9HEN+sALfWSIPnSFH1ujD/7RRyfpw6f08V38ADR9hJw+hE9fY0BfBIFfpUFfRkJf50JfiENfKYRfykRfa0VfDEZfrUZfTodf70dfkEhfMUlf0klfc4pfFItftSsiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIvJgfALwrytKH1wdpAAAAABJRU5ErkJggg==)
}
</style>
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
	background-image:
		url(//instagramstatic-a.akamaihd.net/bluebar/9308ef9/sprites/core-sprites-cd6d7d.png);
	background-repeat: no-repeat;
	background-position: 0px -322px;
	height: 49px;
	width: 171px;
}

.coreSpriteNavigationBrandSmall {
	background-image: background-repeat: no-repeat;
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
<style type="text/css" data-isostyle-id="is-2a61c3b4">
.-cx-PRIVATE-PostsGridItem__root {
	display: block;
	position: relative;
	width: 100%
}

.-cx-PRIVATE-PostsGridItem__postInfo {
	background-color: rgba(0, 0, 0, .3);
	bottom: 0;
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	left: 0;
	position: absolute;
	right: 0;
	top: 0
}

.-cx-PRIVATE-PostsGridItem__commentWord,
	.-cx-PRIVATE-PostsGridItem__likeWord {
	left: 0;
	position: absolute;
	top: 0
}

.-cx-PRIVATE-PostsGridItem__commentWord::before,
	.-cx-PRIVATE-PostsGridItem__likeWord::before {
	content: '';
	display: block;
	height: 100%
}

.-cx-PRIVATE-PostsGridItem__stats {
	color: #fff;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	font-size: 16px;
	font-weight: 600
}

.-cx-PRIVATE-PostsGridItem__statsComments,
	.-cx-PRIVATE-PostsGridItem__statsLikes {
	line-height: 19px;
	margin: 0 auto;
	padding-left: 26px;
	position: relative
}

.-cx-PRIVATE-PostsGridItem__videoIndicator {
	height: 26.23%;
	width: 26.23%
}

.-cx-PRIVATE-PostsGridItem__videoIndicatorWrapper {
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	bottom: 0;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	left: 0;
	pointer-events: none;
	position: absolute;
	right: 0;
	top: 0
}

.-cx-PRIVATE-PostsGridItem__videoIndicatorWrapperObscured {
	opacity: .15
}

@media ( min-width :736px) {
	.-cx-PRIVATE-PostsGridItem__statsComments {
		margin-left: 0
	}
	.-cx-PRIVATE-PostsGridItem__statsLikes {
		margin-right: 30px
	}
}

@media ( max-width :735px) {
	.-cx-PRIVATE-PostsGridItem__stats {
		-webkit-box-orient: vertical;
		-webkit-box-direction: normal;
		-webkit-flex-direction: column;
		-ms-flex-direction: column;
		flex-direction: column
	}
	.-cx-PRIVATE-PostsGridItem__statsLikes {
		margin-bottom: 7px
	}
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
<style type="text/css" data-isostyle-id="is-197bc543">
.-cx-PRIVATE-PostsGrid__row {
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row
}

.-cx-PRIVATE-PostsGrid__row:last-child {
	margin-bottom: 0
}

.-cx-PRIVATE-PostsGrid__item {
	-webkit-flex-shrink: 1;
	-ms-flex-negative: 1;
	flex-shrink: 1
}

.-cx-PRIVATE-PostsGrid__item:last-child {
	margin-right: 0
}

.-cx-PRIVATE-PostsGrid__itemPlaceholder {
	width: 100%
}

@media ( min-width :736px) {
	.-cx-PRIVATE-PostsGrid__item {
		margin-right: 30px
	}
	.-cx-PRIVATE-PostsGrid__row {
		margin-bottom: 30px
	}
}

@media ( max-width :735px) {
	.-cx-PRIVATE-PostsGrid__item {
		margin-right: 3px
	}
	.-cx-PRIVATE-PostsGrid__row {
		margin-bottom: 3px
	}
}
</style>
<style type="text/css" data-isostyle-id="isdb94228">
.ResponsiveBlock {
	position: relative
}

.rbSensor {
	background: 0 0;
	bottom: 0;
	left: 0;
	position: absolute;
	right: 0;
	top: 0;
	z-index: -1
}

.rbSensorFrame {
	border: none;
	display: block;
	height: 100%;
	margin: 0;
	padding: 0;
	width: 100%
}
</style>
<style type="text/css" data-isostyle-id="is-76acc0cc">
@
-webkit-keyframes AutoloadingPostsGridMoreLoadingIndicatorAnimation {
	0%{
	-webkit-transform: rotate(0);
	transform: rotate(0)
}

100%{
-webkit-transform














:rotate(360deg)














;
transform














:rotate(360deg)














}
}
@
keyframes AutoloadingPostsGridMoreLoadingIndicatorAnimation { 0%{
	-webkit-transform: rotate(0);
	transform: rotate(0)
}

100%{
-webkit-transform














:rotate(360deg)














;
transform














:rotate(360deg)














}
}
.-cx-PRIVATE-AutoloadingPostsGrid__moreLink,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLinkDisabled {
	display: table-cell;
	font-size: 12px;
	padding: 0 9px;
	position: relative;
	text-align: center;
	vertical-align: middle;
	z-index: 1
}

.-cx-PRIVATE-AutoloadingPostsGrid__moreLinkNarrowDisplay,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLinkNarrowDisplayDisabled {
	padding: 0 11px
}

.-cx-PRIVATE-AutoloadingPostsGrid__moreLink,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLinkDisabled,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLinkNarrowDisplay,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLinkNarrowDisplayDisabled {
	font-weight: 600;
	text-transform: uppercase
}

.-cx-PRIVATE-AutoloadingPostsGrid__moreLink,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLink:visited,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLinkNarrowDisplay,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLinkNarrowDisplay:visited {
	color: #4090db
}

.-cx-PRIVATE-AutoloadingPostsGrid__moreLink:hover,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLinkNarrowDisplay:hover {
	color: #2d6599
}

.-cx-PRIVATE-AutoloadingPostsGrid__moreLink:active,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLinkNarrowDisplay:active {
	color: #20486d
}

.-cx-PRIVATE-AutoloadingPostsGrid__moreLinkDisabled,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLinkNarrowDisplayDisabled {
	cursor: default
}

.-cx-PRIVATE-AutoloadingPostsGrid__moreLinkDisabled,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLinkDisabled:active,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLinkDisabled:hover,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLinkDisabled:visited,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLinkNarrowDisplayDisabled,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLinkNarrowDisplayDisabled:active,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLinkNarrowDisplayDisabled:hover,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLinkNarrowDisplayDisabled:visited
	{
	color: #a5a7aa
}

.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicator,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicatorLoading {
	display: table;
	margin: 60px auto 0;
	position: relative
}

.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicatorLoading::after {
	-webkit-animation: AutoloadingPostsGridMoreLoadingIndicatorAnimation 2s
		infinite ease;
	animation: AutoloadingPostsGridMoreLoadingIndicatorAnimation 2s infinite
		ease;
	border-color: #4090db transparent transparent transparent;
	border-style: solid;
	border-width: 2px;
	-webkit-transform-origin: 50%;
	-ms-transform-origin: 50%;
	transform-origin: 50%
}

.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicator::before,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicatorLoading::before,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicatorLoading::after {
	border-radius: 50%;
	border-style: solid;
	border-width: 2px;
	box-sizing: border-box;
	content: '';
	left: 0;
	position: absolute;
	top: 0
}

.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicator,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicator::before,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicatorLoading,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicatorLoading::before,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicatorLoading::after {
	height: 120px;
	width: 120px
}

.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicatorNarrowDisplay,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicatorNarrowDisplayLoading
	{
	border-radius: 3px;
	border-style: solid;
	border-width: 1px;
	font-size: 14px;
	line-height: 34px;
	margin: 20px 20px 0;
	padding: 0;
	text-align: center
}

.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicator::before,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicatorNarrowDisplay {
	border-color: #4090db
}

.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicator:hover::before,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicatorNarrowDisplay:hover
	{
	border-color: #2d6599
}

.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicator:active::before,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicatorNarrowDisplay:active
	{
	border-color: #20486d
}

.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicatorLoading::before,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicatorLoading:hover::before,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicatorLoading:active::before,
	.-cx-PRIVATE-AutoloadingPostsGrid__moreLoadingIndicatorNarrowDisplayLoading
	{
	border-color: #c9cbcc
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
<style type="text/css" data-isostyle-id="is-c90c454">
@
-webkit-keyframes






 






'
spin8






 






'{
0%{
-webkit-transform












:






 






rotate












(180
deg










);
-moz-transform












:






 






rotate












(180
deg










);
-o-transform












:






 






rotate












(180
deg










);
transform












:






 






rotate












(180
deg










)
}
100%{
-webkit-transform














:rotate(540deg)














;
-moz-transform














:rotate(540deg)














;
-o-transform














:rotate(540deg)














;
transform














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














;
-moz-transform














:rotate(540deg)














;
-o-transform














:rotate(540deg)














;
transform














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














;
-moz-transform














:rotate(540deg)














;
-o-transform














:rotate(540deg)














;
transform














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














;
-moz-transform














:rotate(540deg)














;
-o-transform














:rotate(540deg)














;
transform














:rotate(540deg)














}
}
@
keyframes






 






'
spin8






 






'{
0%{
-webkit-transform












:






 






rotate












(180
deg










);
-moz-transform












:






 






rotate












(180
deg










);
-o-transform












:






 






rotate












(180
deg










);
transform












:






 






rotate












(180
deg










)
}
100%{
-webkit-transform














:rotate(540deg)














;
-moz-transform














:rotate(540deg)














;
-o-transform














:rotate(540deg)














;
transform














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
<style type="text/css" data-isostyle-id="is2db23a6c">
.-cx-PRIVATE-FollowButton__root {
	display: block;
	position: relative
}

.-cx-PRIVATE-FollowButton__button {
	text-transform: uppercase;
	width: 100%
}

.-cx-PRIVATE-FollowButton__disabled {
	opacity: .2
}
</style>
<style type="text/css" data-isostyle-id="is2c883a44">
.-cx-PRIVATE-LocationLink__root {
	color: #a5a7aa;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap
}

a.-cx-PRIVATE-LocationLink__root, a.-cx-PRIVATE-LocationLink__root:visited
	{
	color: #4090db
}

a.-cx-PRIVATE-LocationLink__root:hover {
	color: #20486d
}

@media ( min-width :736px) {
	.-cx-PRIVATE-LocationLink__root {
		font-size: 15px;
		line-height: 18px
	}
}

@media ( max-width :735px) {
	.-cx-PRIVATE-LocationLink__root {
		font-size: 14px;
		line-height: 17px
	}
}
</style>
<style type="text/css" data-isostyle-id="is-1cd5c486">
.-cx-PRIVATE-UserTag__root {
	background-color: rgba(0, 0, 0, .85);
	border-radius: 4px;
	display: block;
	font-size: 14px;
	line-height: 28px;
	margin-top: 6px;
	padding: 0 10px;
	position: absolute;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	z-index: 1
}

.-cx-PRIVATE-UserTag__root:focus {
	outline: none
}

.-cx-PRIVATE-UserTag__root, .-cx-PRIVATE-UserTag__root:link,
	.-cx-PRIVATE-UserTag__root:visited {
	color: #fff;
	font-weight: 600
}

.-cx-PRIVATE-UserTag__root:hover {
	text-decoration: none
}

.-cx-PRIVATE-UserTag__content {
	position: relative
}

.-cx-PRIVATE-UserTag__pointer {
	border-color: transparent transparent rgba(0, 0, 0, .85) transparent;
	border-style: solid;
	border-width: 0 6px 6px 6px;
	height: 0;
	left: 50%;
	margin-left: -6px;
	position: absolute;
	top: -12px;
	width: 0
}
</style>
<style type="text/css" data-isostyle-id="is57883c51">
.-cx-PRIVATE-PhotoWithUserTags__root {
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	cursor: pointer;
	position: relative;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none
}

.-cx-PRIVATE-PhotoWithUserTags__tagMeasurementLayer {
	bottom: 0;
	left: 0;
	position: absolute;
	right: 0;
	top: 0;
	visibility: hidden
}

.-cx-PRIVATE-PhotoWithUserTags__indicator {
	bottom: 0;
	left: 0;
	position: absolute
}

.tagTransition-enter, .tagTransition-leave {
	-webkit-transform-origin: center top;
	-ms-transform-origin: center top;
	transform-origin: center top;
	-webkit-transition-duration: .2s;
	transition-duration: .2s;
	-webkit-transition-property: -webkit-transform, opacity;
	transition-property: transform, opacity;
	-webkit-transition-timing-function: cubic-bezier(.16, 1.275, .725, 1.255);
	transition-timing-function: cubic-bezier(.16, 1.275, .725, 1.255)
}

.tagTransition-enter, .tagTransition-leave-active {
	opacity: 0;
	-webkit-transform: scale(0);
	-ms-transform: scale(0);
	transform: scale(0)
}

.tagTransition-enter-active {
	-webkit-transform: scale(1);
	-ms-transform: scale(1);
	transform: scale(1);
	opacity: 1
}

.indicatorTransition-enter, .indicatorTransition-leave {
	-webkit-transition-duration: .2s;
	transition-duration: .2s;
	-webkit-transition-property: opacity;
	transition-property: opacity
}

.indicatorTransition-enter, .indicatorTransition-leave-active {
	opacity: 0
}

.indicatorTransition-enter-active {
	opacity: 1
}
</style>
<style type="text/css" data-isostyle-id="is196a3bd8">
.-cx-PRIVATE-DeclarativeVideo__wrapper {
	position: relative;
	width: 100%;
	height: 100%
}

.-cx-PRIVATE-DeclarativeVideo__video {
	width: 100%;
	height: 100%
}

.-cx-PRIVATE-DeclarativeVideo__poster {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%
}
</style>
<style type="text/css" data-isostyle-id="is-63d5c88c">
.-cx-PRIVATE-Video__root {
	display: inline-block;
	width: 100%
}

.-cx-PRIVATE-Video__placeholder {
	display: block;
	overflow: hidden;
	padding-bottom: 100%
}

.-cx-PRIVATE-Video__heightCompensation {
	height: calc(100% + 1px);
	position: absolute;
	width: 100%
}

.-cx-PRIVATE-Video__coverLayer, .-cx-PRIVATE-Video__states {
	bottom: 0;
	left: 0;
	position: absolute;
	right: 0;
	top: 0
}

.video-js {
	position: static
}

.-cx-PRIVATE-Video__states {
	z-index: 1
}

.-cx-PRIVATE-Video__coverLayer {
	display: block;
	z-index: 2
}

.-cx-PRIVATE-Video__root:hover .-cx-PRIVATE-Video__statePlay,
	.-cx-PRIVATE-Video__statesShow .-cx-PRIVATE-Video__statePlay {
	opacity: 1
}

.-cx-PRIVATE-Video__statePlay {
	background-image:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAWgAAAJYCAMAAAB4qYzXAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAMAUExURQAAAP///////////wAAAAAAAP///wAAAAAAAAAAAP///////////////////////////////////////////////wAAAP///////////////////////wAAAP///////////////wAAAP///////wAAAP///////wAAAAAAAAAAAAAAAP///wAAAP///wAAAFFNTQAAAAMDAwEBAf///wAAAAAAAP///wAAAFBQUAAAAAEBAQAAAAAAAAAAAAAAAAAAAP///wAAAAAAAAAAAAAAAAEBAf///wAAAAAAAAEBAQAAAAAAAAAAAA4ODkRCQgAAAB8fHwAAAD08OgAAAGpnZ/Tz829tbS0oKF1aWjYzM2djY/Hx8UhGRPDu7jg3NX98fOPh4eHg4NvZ2eXk5HFtbWJfXtbU1PDt7SQjI3h0dOPi4vr6+uTj43t5efr6+ru5uo2Kip+cnFxZWff29n98fHl2dvr6+ZSQkJWRkePg4ExKSaelpOPh4YB9ffv7+1RQUBkZGS0rK0dGRcXDw3Zycu/u7nRycubl5fX09O3s7ODe3+7s7Pv7+8nIx+jn52lmZgAAAM7Ly7q3t5qXlrq3ueXl5eXj4+vq6pGPj7i0tNXS0t3b2srHx93d3LOwsIWDgpqXl09MTMLAwHdycvTy8mxpaebl5bm2tsG/v/Ly8tXT0/r6+qWiompnZ3Jvb/Hw8NPR0CIiIv////r6+uvq6tDPzvv7+46Li+ro6KShoaGdna2rqs7NzNbU1FpXV+zq6erp6a6rq/Hx8YSBgfTy8n15ed/c2+Df3mFeXtrY18nIx9/e3dPR0fPz8/r6+sPBwb+9vaGenvDt7dnW1oSAgPv7+/v7++He34uHh/r6+tXT0/Ly8vTy8rKvr/n5+Ozq6ff29rGurtPR0dnY1/r6+qWioVFRTHh1dVBQUPv7+qqmpmllZU9NTYSAgHFsbPLw7+7t7drX16Sfn/r6+ra0tO/t7fr6+vr6+snIxqmmpvPy8p+cnKGfnw0NDfj3939u3vIAAAEAdFJOUwDm5ewMK+QCBgHo4Ofh49/r6erd8O8D3u3x7tzbBNni2PIH19oF1vMIEAkK1Qv0DkgnFynUDRH6E0kfFhIdJiMw9xsZFQ8o9iAYGhQhLC1DIjAtPyRf7mI4Vjtc0zjjNmXK0cvRUljC3zRnzPPWavWseoRi8UpZ7niDxUWQ2G7UTi0xR7RV6GTd69zE4uGz11YvtaWCmdvZ4n2XxM67vp10h0qsXtJPyKGh4arsk0tY5Lwk+eLKwtxwzoyQnrvHUtrImNJH00O9wFO6qMu02uaxpmPPynDe1dZ48L3p6KDyz+uitsbqiDJKPNuEb2OBc9nXr274kOro9qyV5Fh7J/B2dxVRAAARSklEQVR42u3deXgb5YHH8ciSdVm+FB+yE1mxEkWyhGWsYNcbH+skdnPfDgmwJCSBhIYkQJamUAIphZSF8AQaKIFylQYopKEUCGfpAdndtlBo6bFbum23tEt3l+59tHs/OyPJZmyPx/ZoZl5L+X6eJ/+9z/PL+9N4NDOaeWfaNAAAAAAAAAAAAAAAAAAAYBqP58zKFTRZV43E5bF41qJyhfXsCkbc4XDYHZHnXPi5wnquiYTblqdSHS2JmDsozbnAc8Vtz5FE54X7Hnr5orVL+trilk05m/vaPotzhXEFY50X3bJAcu4De1sXtchTtuIPOZ17wuYs8p44ssvCXHEbtLt/y2+TyWg0mVy84LprVqWnbP4+U8pt2XJr+ZyGhpm1Id+2e63KFbiHjqUOJKONMqnrBXffW7zUiinLub8umTVXMrthRont4iutyRVXdDC+5L5oXZbU9YIff64n5YiZPWU591cz52bNmlli+871VuSK20VHmnvuaayrU1a9/eaBPkcsYuq3k5z7i4bZQxpmlHq/ttH8XHFFu9tW7a5SqmtMLnh+x5oOc6cs5/7ZrNmzlVWHvA+cZ3auyKLPj1ZVjaz6P276/JKORNi8Kcu55bOGm1Nb9t73TM4VV3S4/9rGqqrRVf/lFau7282bspS7unZE0bOkIxDnd+9cb2auwKKbfq+xerSqxuS5r2xa2BQPm3MmIeWeXd4wyhzpAOS/XzMxd8oVna76t19Zu8ykM4kxiparLrVdal6uMDVS0XXV6qQdyD3XrDLn8FbKPbtkjirpDMZ7u1m5YouuH4O8VV/3udZUi/GHt3LRpTPHMKO8rHKbOblTs+hM1ffv6uk0/ExCs2i5aqd/uxm5QouuCmior25M3nfB7y83+PA2XfQMDbWlRRVPG587dYuWqq5qvPyBT6zoaDbymGvcouWqbSdvMjpXaNHV9nEEqhuNPqyWiw5N11ZbHvL+ztzD+SlWdLrqc395fndTwqjD24kULVdd5v3ZK0bmCi26vmICpKo/9eRHljUZdHgrF11WO77yUmflZgNzp37R6arvefgGgy7QT7Roueoi/62G5QotOuCfmAp7deOxK+eljJiyXLSzfGJKQraKPe8Yk5sXRWeq3rbXiMPbyRQtVV3ms9+/N68Pq+Wi7ZUT55eq/tqGgZwPb+Wii0omrtTpDdxnQG7eFJ2p+oGvZw5v9W9cky26pCTkrAzkniu2aO/kVNqrf3L8xu729C4zh6JtpZNTZvOfzDU3r4r2eqWt+t1fblrUFtY9Yz1Fy1VXvPvznHKFFl3hmzxpq77tnYH2WETnjNNFhyatzOmz55Sbd0X7pB1I3U1rO2I6ty25aF+ZDk5bZX0OuSKLPttv08Xnr9++pT0ctLboMnmj1p+bj0XbbN7Azv9z6PsjlnO9Tp18dt25QouuLNLLF7irM1xjedFOm11vbp4WXeT9qyWxoCePcoUWrX/LchZ9YyAuomib3ty8LXrnfP1btO7vBumLWG+u0KJ1fvvLiq7OYR+dS9FX5+M+Ooeijw7oP+rQd/ye8dWBfDzq0HGGlvUXn2zXuWHlVrT+XLFFl+oTevyGrhzODHVcY8m6U39uPhb90t4VTblc69Bb9O3X55ArtOjJXRfOeuvA2qW5Xb2b5HXwrBP/lVNuvhX9/kPrc74erafo7z6+Pn+vR0/it7usF97O3pef0y8sk/itMut3x3POzauijxjwpImOoiuP5vMTLhO/v2LQ0xuMeHZqEveTZO3ckNfPbE226AcN+tF/skXff32e38M7sXvgBm19Z95Sw+5Umsg9f1l7rpy3NP/vVJpw0S/dZdwT25Mp+taHC+BJ8Qncp5x1+mX5VsOwQbcaTuC+7KwTTxqZO+WLfuu19M2zRt4fPaGib/m5sblii545nvcfX93dlTD4jn+tZ2ey3rviRoNzp3TR779h/AMOEyn65JGCebBC83m/wcf+ju4w4ZEdrecbs54voEeFMkWrPsE66PWNphzAjlt0YT38Nm7Rh6836bHKcYreU2CPc2aeyR61ysCgV6807UHh9DPoVWP4RsE9oKxZ9A8eNvHRd42iNxfgI/eZ9Tqmz1Zx+oCpizmorxMi+dkrhbiIhLwSTMv5KkUffMjk5Unk3GjdKO8V6LIo6SV31r4wd4Q/f+JGsxfckXN3j6z5JwW70E9mta6XRvT8n183/wJ7ZnWyYeq+WrhLV6XXn1vx5tyzFN605AK7nHvfsJ4LejG29IqKS/fN/qDm13dZs8yfnHsg+kHN9xf28oLZtUl/cU7GWb/a25qybG3S/i2bo1k//FFrqsDXJk2vevvUc3LNr37mvB7rpivnPpJu+rYrdvQUfM3pdZzjfZ98cd+L357XvVz+47XoPCGTe/XL995hba7IvbS0MnlHZ1+XIx62cqsSlStym06vte9OL0ruKfxcgU17XNLrI1yWz1ZULgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAhcgjL/Q3kke56t/4I/IpV1jPrhpp6coRIsqXGYw/Ip9yxfUcdMcSzY5hmhOxD95UPP6IfMoV2HOsa35r8Qit84feJS+P6FAb0ZHL2+ZF5Yorusbdtf/Ys6Mc29/lrvFkR3Tsv1ttREd2hN7cQxePfrfsxYeUueojcskVV3QwNv+6xclRFl83Pxb0DI44pjbi2OAIvblbQ7Uj37ZaG9qqzL1MbcRlueQK44okWi+PNo4Svbw1EXENjlisNiI5OEJv7qmGuaM0nFLmhtRGlOaSK7Do5uJknYpkcXN2wu7xRujNLVd7dVS5Mld7RH4V7XYUR9VqjBY73K6JjdCbW6tWY60yV3sERU8wt1ztnXPlylztEflXtNpb2IYXrTmCoqd40SVq7wQtUeZqj6BoilafcKPaW18blRPWHqE3t1Ttpc2lylztERRN0eoTVn0Rep1ywtojdBet9rb34UVrjqBoilafcFVARZVywtoj9OaGZqgIKXO1R1A0RatPuNquolo5Ye0RenPLpqsoU+Zqj6Boip5aRTtrVTiVudoj8q/oChXDi9YcQdFTvOiichVFylztEXlXdL1fRb1ywtojKHqqF12iYnjRmiPyruhApYqAcsLaIyh6ihdtK1VhU+Zqj8i7ou1eFXblhLVHUPQUL9oXUuFT5mqPyLuiK3wqKpQT1h6hN9dbpsKrzNUeQdEUrT5hv02FXzlh7RF6cyudKiqVudojKJqixyi6SMXwojVH5FMuRZ8JRYv4Exa1y6LoM6FoEYdZog4rKfpMKFrEqbCoU3+hRYu4uEPRFhYt4vKs0KJFXICnaAuLFvETmtiiBfxIStEWFi3iNgehRYu4kYWirSxawK1oQosWcbMhRVO0eUWLuCFc1A3wFH0mFC3ioR1RDylR9BlRtIAHK0U9SErRZ0LRIh5+F/WwP0WfCUWLWKCEoq0sWsASQ0KLFrGIFEVTtHlFT5+rYrpywtoj9OYmG1UklbnaI/KraGmhvzFqVCz0N9YId04LDI5Ro3JhwzFG5GXRidYZZ6mYqVy6UnXEjFyXzFStMarMVS86L5fMlJdaPaxW42HlYqxb1UZ8PNdFYPdEVexR5t6tNuJYXi4CKy8v/NiDB88Z4eA3H2tXLC98ybfOGTXiwce6clzW+JJtu0eWuHvbJcrcQ6M/i90/PtSVl8saj7Vgdvu4C2Z3mbJQt8m5Qptm6XmLmpZeWTDinQWRcV9qEDHmZQoCcgU2zetBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACAiTwKtGFqzYr1GajavJ5drpos1sIwueegtBCMJBiUu6Zqc4qWNmdpNZ1wmlvumqrN6Vnant3hWDwhicdiYao2bYOWenZ0di/s7G+TFuCKy1VLOxCaNrhoeRWucDz1xFU/fLFnaVd/i6M5HnNH2KhNKDoirSy34qfPPvuh637UuqyrqcWRiIfTVdO0oUVLG3TC0ZpMJhcv+ND2m3uWdfS3ySv40bThRbtjzW0fll7CUdWYXPDs8zsGFnVJG3V6T+2iaOOKlr4K447+eVXSK9UC1XXJBf925BNrUk1t8jZN0cYWHY47mrLvwbTXS1XvvmL1/A5HIuxmkza0aGkX3da+cvCl0P5AVXTxVQ9tWdQSZ5M2vOiW9nUfvE/eb5eq/umv57dJe2mKNowrXXTXOr9tiM9bUR1d/EYq5s7fRW2n5GF0rFkqutKpUOTz17+7kKKN33V0rfOFhikr+k1fLELRxn8ZFpUM8+D+ZQ720SYUPfw99ltf7Ol0cCBtynG04mXUz917w7ImR5xTQ8NPwePN/fOG3ij7g30f6V7e70jEOF8x/lpHoq01+1rIRw9sWtInX8AbvKpEQwYe30n7jp4X5LcTHvzs+jWpdunqXZyrdyYULW/S85+bO/fgE9eukGuWL925+ZHFhKIj4djyf/2Xf79W3mm0DV32p2dji840nehYtLS9TX5pDzWbtkmn390Ti8VlsXTN7DXM2aQzb0mS7+pwU7OJRafvCEvfqhTkTiWzm3YN3XvHbY5mNj14Oyk37lpQNbdHAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABgIk8auabHumpqalyWJ59xua6aYDgej8jRVn7QilxR87U6153o++iftkjJLpf0z6KqFbkeQfO1PNex6KKr/mhhOBKUPulw0JpPWpEb9IiZr3W5Hk/6z8ix8OZzo8meRNidWPb9VML8T1qRm0z2xCMu6+drZW461R2OtyzceEtddd28tkQ8dWTBb5ZK/wGPVbnRuug8RzjoyvAUZO40j/yd0NzW3r3hlqqAvXplU3/TouN1H3uqK2zuJq3Irauur1vZknBHZEGTd1rCcl3BRGpg3sreP/xUtb2iovrTqWe+v2LVzurtSxKm/k0pcqXP1169rn15qikRTzR1mvv1JCpX+oDDnZ+9PJlMNtZX+P3++t5nnk5e3XPeyar97aZu0pncxYuTUfnzlT7gRYdu/1KqPXXJ7X/TFnQVXu40TzA+cFL6aO0VlV6JvXfJ8fovb1p31P72opiZ38dy7sfqA4GA3V8pCfTO/07d5vNa7/hy3be6TC1aUO40VyTxYbvXN6iid9mmfw7cVXyNf+uSeMRjbm4g/dl6Mx/wwtUXB277h82Byy5sMXPConKnudzNxf6iIf7ezoE7K7+3clfliQFTd9JyboVtiJS7cPW2ikDF1vV98WAB5krBjuJK55DK3tSKJ71Pr9vh9feYXPSI3L7O1n+UZv53A00mFy0mNx3sCw3xyVu07fjKXba3Bkwvenhu945Lnaect347ZXrRInLT+6yikiFF8j7aKe2jnYfN30cPz73jUtvhv7/Md+mX+s3eR4vITX8LnyofUtS74m3bP52/7qjzcfOPOobldh+2fXz9mtVfsH3T9KMOEbnycWXqM9OHlPU+82ZIOo4+FXrK9OPoYbmfXvq3X7xweX/fhV/8a0ch5spnSs2ZM6XTMyShXunMcM2qnaHXzT8zHMydKSld197V0RaPxdvam029yCIqV3Huf8EfzJkzpzR9reMJ5/uPWXat44LTDQ0NJcUtcXcwTb4WXoC5iqtZG6TkkvTVuzfK/9fCq3cXnJ41q1y6ipb+bUe+iFaQudMU12c3Pjq7tjV9Pfp/LL0evfHRudNbBVyPtjg3u+uSf3F45E9e7RbxC8sjj36hW8QvLNbnZpKbOz/6x/0CfjPM5noEzdfin8Gl5Eg4kRDxK/hgrqj5TrO46cx9DuRa8i3BnUoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKCw/T/NQ9tr8gdUHQAAAABJRU5ErkJggg==);
	background-position: 0 0;
	background-repeat: no-repeat;
	display: block;
	opacity: 0;
	position: absolute;
	-webkit-transition: opacity .2s ease-out;
	transition: opacity .2s ease-out;
	-webkit-transition-delay: .1s;
	transition-delay: .1s;
	height: 135px;
	left: 50%;
	margin-left: -67px;
	margin-top: -67px;
	top: 50%;
	width: 135px
}

.-cx-PRIVATE-Video__root .vjs-control-bar, .-cx-PRIVATE-Video__root .vjs-control,
	.-cx-PRIVATE-Video__root .vjs-loading-spinner, .-cx-PRIVATE-Video__root .vjs-big-play-button,
	.-cx-PRIVATE-Video__root .text-track-display {
	display: none !important
}

@media ( min-device-pixel-ratio :1.5) , ( -webkit-min-device-pixel-ratio :1.5) ,
		( min-resolution :144dpi) {
	.-cx-PRIVATE-Video__statePlay {
		background-image:
			url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAtAAAASwCAMAAADlrY3OAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAADAUExURQAAAP///////////////////////wAAAAAAAP///////////////////////////////wAAAP///////////////////////////wAAAP///////////////////////wAAAP///////wAAAP///////wAAAAAAAAICAjQzM2ViYgEBAQ0MDP///yIiIZOPj6+srNDOzuDf3tnX1+/u7YB9fcbFxOfm5k5MS727u6KenvHw8Pv7+vr5+fLy8vr6+u3cso4AAABAdFJOUwDs4OHl5OMCBOjq5+br3+7wC+nd3OLt7/Er297Y2fPaAdfWBtX1DhIYOlcgJ/kxfJm5zsLab7LWSaiL5N7n6+9tvXvCAAAboUlEQVR42u3dDVfaWB7A4fFdRBRUFGurtlREYVUEtVat3/9bbQLa2hnQtMhLbp6n5+zO7M7JOf+5PyPchPDPPwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABCSw8jS0lL8X+Yl/cu7tBypxv+xvBT+Gmdt3sz1HC1vtdRTrVaDX+OszZu5nuPlrTeau2e7zUb9OFrk7nnLvKT1fFU6bp637v73v8eb1vfTZqO3xqEu8fO8nULhx+V1+PNmsef6t8ujo6P9/eg/jv53c/GtWa8Fu8RP867O7W1uba6V5zcuw543gy84qsffOlHNldh+t+r2+W6wS9yd92buw+cvX79+/fLx09baQi7kebN3gq6Wmu2jXs6Vp6iPjjrfT6LfxAEucXfe1uynLz99Pticy9+EOm8WT9D1q7jn/Z9/eknfXQS5xN15yy96jn38sDbfuZB0CKJXlI32y/Pzz/P00Y9oiYP7RRzP29r6/OVfPh+szd+FOG/2gq7WTh4rfe0f3X0/6722DGefNp73/uOX/4qT7oQ3bxZfcZzvVyqDku48vV0K5dJDd969j5/7+fhhdvUmsHkzGHSpcTsw6Djpm6toU6sayhJ35936PECUdP4yqHkzGXS7Unmt6KN4iUuBLHE8b+vg80Cftuby7YDmzeJ7wuZNpfJG0u3TUDYA4nkvP33+/FrS5Vzr1IZHat8jlXYfi6+Lmi5efwtj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);
		background-size: 360px 600px
	}
}

.-cx-PRIVATE-Video__video {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0
}
</style>
<style type="text/css" data-isostyle-id="is217d3b2c">
.-cx-PRIVATE-MenuOption__root {
	background: 0 0;
	border: none;
	cursor: pointer;
	font-size: 18px;
	font-weight: 600;
	line-height: 44px;
	overflow: hidden;
	padding: 0 16px;
	text-align: center;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 100%
}

.-cx-PRIVATE-MenuOption__danger {
	color: #f12938
}

.-cx-PRIVATE-MenuOption__neutral {
	color: #125688
}
</style>
<style type="text/css" data-isostyle-id="is-3c4dc74d">
.-cx-PRIVATE-Menu__root {
	background-color: #fff;
	border-color: #c9cbcc;
	border-radius: 4px;
	border-style: solid;
	border-width: 1px;
	margin-top: 16px
}

.-cx-PRIVATE-Menu__root:first-child {
	margin-top: 0
}

.-cx-PRIVATE-Menu__item {
	border-color: #c9cbcc;
	border-style: solid;
	border-top-width: 1px
}

.-cx-PRIVATE-Menu__item:first-child {
	border-top-width: 0
}
</style>
<style type="text/css" data-isostyle-id="is-63d8c88a">
.-cx-PRIVATE-Sheet__root {
	background-color: rgba(0, 0, 0, .5);
	bottom: 0;
	-webkit-box-pack: end;
	-webkit-justify-content: flex-end;
	-ms-flex-pack: end;
	justify-content: flex-end;
	left: 0;
	position: fixed;
	right: 0;
	top: 0;
	z-index: 1
}

.-cx-PRIVATE-Sheet__wrapper {
	background-color: #edeeee;
	overflow: auto;
	padding: 16px
}
</style>
<style type="text/css" data-isostyle-id="is76e3e31">
.-cx-PRIVATE-DeleteCommentModal__modalMenu {
	margin: 0 auto
}
</style>
<style type="text/css" data-isostyle-id="is1f233ae8">
.-cx-PRIVATE-EmbedModal__codeTextarea {
	border-color: #c9cbcc;
	font-size: 14px;
	line-height: 17px;
	height: 34px;
	margin: 0 0 7px;
	resize: none;
	white-space: nowrap
}

.-cx-PRIVATE-EmbedModal__contents {
	background: #fff;
	border-color: #c9cbcc;
	border-radius: 4px;
	border-width: 1px;
	margin: 0 auto;
	padding: 16px
}

.-cx-PRIVATE-EmbedModal__captionOption {
	margin-bottom: 7px
}

.-cx-PRIVATE-EmbedModal__captionOptionCheckbox {
	margin-left: 0;
	margin-right: 5px
}

.-cx-PRIVATE-EmbedModal__copyToClipboardButton {
	margin-bottom: 7px
}

.-cx-PRIVATE-EmbedModal__legalNotice {
	color: #a5a7aa;
	font-size: 12px;
	line-height: 16px
}

.-cx-PRIVATE-EmbedModal__progressIndicator {
	display: inline-block;
	margin: 0 5px;
	position: static;
	vertical-align: middle
}
</style>
<style type="text/css" data-isostyle-id="is-4826c682">
.-cx-PRIVATE-LikeButton__root {
	background-color: transparent;
	border: none;
	cursor: pointer;
	padding: 0
}

.-cx-PRIVATE-LikeButton__disabled {
	cursor: default;
	opacity: .3
}
</style>
<style type="text/css" data-isostyle-id="is458338aa">
.-cx-PRIVATE-UserLink__root {
	font-weight: 600;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap
}

@media ( min-width :736px) {
	.-cx-PRIVATE-UserLink__root {
		font-size: 15px;
		line-height: 18px
	}
}

@media ( max-width :735px) {
	.-cx-PRIVATE-UserLink__root {
		font-size: 14px;
		line-height: 17px
	}
}
</style>
<style type="text/css" data-isostyle-id="is21c43b2e">
.-cx-PRIVATE-PostLikers__root {
	color: #4b4f54;
	display: block
}

.-cx-PRIVATE-PostLikers__likeCount {
	font-weight: 600
}

.-cx-PRIVATE-PostLikers__remainingCount {
	font-weight: 700;
	text-overflow: ellipsis
}
</style>
<style type="text/css" data-isostyle-id="is-7394bf1b">
.-cx-PRIVATE-ReportInappropriateModal__modalMenu {
	margin: 0 auto
}

.-cx-PRIVATE-ReportInappropriateModal__optionDescription {
	color: #a5a7aa;
	display: block;
	font-size: 12px;
	font-weight: 400;
	line-height: 16px;
	margin-top: -12px;
	margin-bottom: 12px
}

.-cx-PRIVATE-ReportInappropriateModal__gratitude {
	background-color: #fff;
	border-color: #c9cbcc;
	border-radius: 4px;
	border-style: solid;
	border-width: 1px;
	margin: 0 auto;
	max-width: 414px;
	padding: 16px
}
</style>
<style type="text/css" data-isostyle-id="is7f9f3931">
@media ( min-width :736px) {
	.-cx-PRIVATE-Timestamp__root {
		font-size: 15px;
		line-height: 18px
	}
}

@media ( max-width :735px) {
	.-cx-PRIVATE-Timestamp__root {
		font-size: 14px;
		line-height: 17px
	}
}
</style>
<style type="text/css" data-isostyle-id="is45a838af">
.-cx-PRIVATE-PostInfo__comment {
	margin-bottom: 7px;
	position: relative;
	word-wrap: break-word
}

.-cx-PRIVATE-PostInfo__comment:last-child {
	margin-bottom: 0
}

.-cx-PRIVATE-PostInfo__commentCreatorInput {
	background: 0 0;
	border: none;
	outline: none;
	width: 100%
}

.-cx-PRIVATE-PostInfo__commentCreatorInput::-webkit-input-placeholder {
	color: #a5a7aa
}

.-cx-PRIVATE-PostInfo__commentCreatorInput::-moz-placeholder {
	color: #a5a7aa
}

.-cx-PRIVATE-PostInfo__commentCreatorInput:-ms-input-placeholder {
	color: #a5a7aa
}

.-cx-PRIVATE-PostInfo__commentCreatorInput::placeholder {
	color: #a5a7aa
}

.-cx-PRIVATE-PostInfo__commentUserLink {
	margin-right: .3em
}

.-cx-PRIVATE-PostInfo__caption, .-cx-PRIVATE-PostInfo__feedback {
	-webkit-flex-shrink: 0;
	-ms-flex-negative: 0;
	flex-shrink: 0
}

.-cx-PRIVATE-PostInfo__commentCreator,
	.-cx-PRIVATE-PostInfo__loginOrFollowPrompt {
	color: #4b4f54;
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	-webkit-flex-shrink: 1;
	-ms-flex-negative: 1;
	flex-shrink: 1
}

.-cx-PRIVATE-PostInfo__comments {
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1
}

.-cx-PRIVATE-PostInfo__commentsSidebarVariant {
	overflow: auto;
	padding-bottom: 20px
}

.-cx-PRIVATE-PostInfo__commentsStackedVariant {
	margin-bottom: 7px
}

.-cx-PRIVATE-PostInfo__commentsLoadMoreButton {
	background: 0 0;
	border: none;
	color: #a5a7aa;
	outline: none;
	padding: 0;
	margin: 0
}

.-cx-PRIVATE-PostInfo__commentsLoadMoreButtonEnabled:hover {
	color: #818488;
	cursor: pointer
}

.-cx-PRIVATE-PostInfo__commentsLoadMoreSpinner {
	display: inline-block;
	margin: 0 0 0 2px;
	position: static
}

.-cx-PRIVATE-PostInfo__commentsLoadMoreButton,
	.-cx-PRIVATE-PostInfo__commentsLoadMoreSpinner {
	vertical-align: middle
}

.-cx-PRIVATE-PostInfo__deleteCommentButton {
	background: 0 0;
	border: none;
	color: #a5a7aa;
	cursor: pointer;
	float: right;
	font-size: inherit;
	height: 1em;
	line-height: inherit;
	margin-left: 10px;
	overflow: hidden;
	padding: 0;
	width: 1em
}

.-cx-PRIVATE-PostInfo__deleteCommentButton::before {
	content: '\2715';
	display: block
}

.-cx-PRIVATE-PostInfo__deleteCommentButton:hover {
	color: #4b4f54
}

.-cx-PRIVATE-PostInfo__feedback {
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	border-top: 1px solid #eeefef;
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

.-cx-PRIVATE-PostInfo__feedbackSidebarVariant {
	margin-top: auto
}

.-cx-PRIVATE-PostInfo__feedbackStackedVariant:first-child {
	border-top: none;
	margin-top: 0
}

.-cx-PRIVATE-PostInfo__likeButton {
	margin-left: -9px;
	margin-right: 3px
}

.-cx-PRIVATE-PostInfo__likesAndTimestamp {
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row;
	-webkit-box-pack: end;
	-webkit-justify-content: flex-end;
	-ms-flex-pack: end;
	justify-content: flex-end
}

.-cx-PRIVATE-PostInfo__likesAndTimestampSidebarVariant {
	padding: 20px 0
}

.-cx-PRIVATE-PostInfo__likesAndTimestampStackedVariant {
	margin-bottom: 7px
}

.-cx-PRIVATE-PostInfo__likesInfo {
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	-webkit-flex-shrink: 1;
	-ms-flex-negative: 1;
	flex-shrink: 1
}

.-cx-PRIVATE-PostInfo__loginOrFollowPrompt {
	display: block;
	overflow: hidden;
	text-overflow: ellipsis
}

.-cx-PRIVATE-PostInfo__modalOptionsMenu {
	margin-left: auto;
	margin-right: auto
}

.-cx-PRIVATE-PostInfo__optionsButton {
	background-color: transparent;
	border: 0;
	cursor: pointer;
	margin-left: 5px;
	margin-right: -10px;
	padding: 0
}

.-cx-PRIVATE-PostInfo__likeButton, .-cx-PRIVATE-PostInfo__optionsButton
	{
	-webkit-box-flex: 0;
	-webkit-flex-grow: 0;
	-ms-flex-positive: 0;
	flex-grow: 0;
	-webkit-flex-shrink: 0;
	-ms-flex-negative: 0;
	flex-shrink: 0
}

.-cx-PRIVATE-PostInfo__timestamp, .-cx-PRIVATE-PostInfo__timestamp:visited
	{
	color: #a5a7aa;
	-webkit-flex-shrink: 0;
	-ms-flex-negative: 0;
	flex-shrink: 0;
	margin-left: 10px
}

.-cx-PRIVATE-PostInfo__timestamp:hover {
	color: #818488
}

.-cx-PRIVATE-PostInfo__timestamp:active {
	color: #4b4f54
}

@media ( min-width :736px) {
	.-cx-PRIVATE-PostInfo__root, .-cx-PRIVATE-PostInfo__commentCreatorInput,
		.-cx-PRIVATE-PostInfo__commentsLoadMoreButton {
		font-size: 15px;
		line-height: 18px
	}
	.-cx-PRIVATE-PostInfo__root {
		padding: 0 24px
	}
	.-cx-PRIVATE-PostInfo__comments {
		margin-left: -24px;
		margin-right: -24px;
		padding-left: 24px;
		padding-right: 24px;
		margin-top: -5px;
		padding-top: 5px
	}
	.-cx-PRIVATE-PostInfo__commentsStackedVariant:first-child,
		.-cx-PRIVATE-PostInfo__likesAndTimestampStackedVariant:first-child {
		margin-top: 20px
	}
	.-cx-PRIVATE-PostInfo__feedback {
		min-height: 68px
	}
	.-cx-PRIVATE-PostInfo__feedbackStackedVariant {
		margin-top: 13px
	}
}

@media ( max-width :735px) {
	.-cx-PRIVATE-PostInfo__root, .-cx-PRIVATE-PostInfo__commentCreatorInput,
		.-cx-PRIVATE-PostInfo__commentsLoadMoreButton {
		font-size: 14px;
		line-height: 17px
	}
	.-cx-PRIVATE-PostInfo__root {
		padding: 0 20px
	}
	.-cx-PRIVATE-PostInfo__commentsLoadMoreSpinner {
		margin-bottom: -1px
	}
	.-cx-PRIVATE-PostInfo__commentsStackedVariant:first-child,
		.-cx-PRIVATE-PostInfo__likesAndTimestampStackedVariant:first-child {
		margin-top: 16px
	}
	.-cx-PRIVATE-PostInfo__feedback {
		min-height: 48px
	}
	.-cx-PRIVATE-PostInfo__feedbackStackedVariant {
		margin-top: 9px
	}
	.-cx-PRIVATE-PostInfo__likeButton {
		margin-left: -9px;
		margin-right: -1px;
		-webkit-transform: translate3d(0, 0, 0) scale(.834);
		transform: translate3d(0, 0, 0) scale(.834);
		-webkit-transform-origin: left;
		-ms-transform-origin: left;
		transform-origin: left
	}
}
</style>
<style type="text/css" data-isostyle-id="is-3bd6c73c">
.-cx-PRIVATE-Post__followAction {
	-webkit-flex-shrink: 0;
	-ms-flex-negative: 0;
	flex-shrink: 0;
	margin-left: 20px;
	max-width: 140px
}

.-cx-PRIVATE-Post__header {
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row
}

.-cx-PRIVATE-Post__feed .-cx-PRIVATE-Post__header {
	height: 64px;
	padding: 14px 20px
}

.-cx-PRIVATE-Post__locationLink {
	display: inline-block;
	max-width: 100%
}

.-cx-PRIVATE-Post__media {
	box-shadow: inset 0 0 20px 0 #edeeee
}

.-cx-PRIVATE-Post__feed .-cx-PRIVATE-Post__media {
	border-bottom: 1px solid #eeefef;
	border-top: 1px solid #eeefef
}

.-cx-PRIVATE-Post__ownerAndLocation {
	display: block;
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	-webkit-flex-shrink: 1;
	-ms-flex-negative: 1;
	flex-shrink: 1;
	overflow: hidden;
	line-height: 0
}

.-cx-PRIVATE-Post__ownerAvatar {
	background-color: #fbfbfb;
	border-radius: 50%;
	border: 1px solid #cccfd0;
	box-sizing: border-box;
	-webkit-flex-shrink: 0;
	-ms-flex-negative: 0;
	flex-shrink: 0
}

.-cx-PRIVATE-Post__feed .-cx-PRIVATE-Post__ownerAvatar {
	-webkit-flex-basis: 30px;
	-ms-flex-preferred-size: 30px;
	flex-basis: 30px;
	height: 30px;
	margin: -1px 10px -1px -5px;
	width: 30px
}

.-cx-PRIVATE-Post__ownerUserLink {
	display: inline-block;
	margin-right: 100%;
	max-width: 100%
}

.-cx-PRIVATE-Post__ownerUnlinkedName {
	color: #4b4f54;
	display: inline-block;
	font-size: 15px;
	line-height: 18px;
	max-width: 100%
}

.-cx-PRIVATE-Post__timestamp, .-cx-PRIVATE-Post__timestamp:visited {
	color: #a5a7aa;
	-webkit-flex-shrink: 0;
	-ms-flex-negative: 0;
	flex-shrink: 0
}

.-cx-PRIVATE-Post__timestamp:hover {
	color: #818488
}

.-cx-PRIVATE-Post__timestamp:active {
	color: #4b4f54
}

.-cx-PRIVATE-Post__timestampOfLocationTaggedPost {
	-webkit-align-self: flex-start;
	-ms-flex-item-align: start;
	align-self: flex-start
}

@media ( min-width :736px) {
	.-cx-PRIVATE-Post__flexible735.-cx-PRIVATE-Post__root {
		padding-right: 335px;
		width: 100%
	}
	.-cx-PRIVATE-Post__flexible735 .-cx-PRIVATE-Post__header {
		border-bottom: 1px solid #eeefef;
		height: 78px;
		padding: 20px 0;
		position: absolute;
		right: 24px;
		top: 0;
		width: 287px
	}
	.-cx-PRIVATE-Post__flexible735 .-cx-PRIVATE-Post__mediaInfo {
		bottom: 0;
		box-sizing: border-box;
		position: absolute;
		right: 0;
		top: 78px;
		width: 335px
	}
	.-cx-PRIVATE-Post__flexible735 .-cx-PRIVATE-Post__ownerAvatar {
		-webkit-flex-basis: 40px;
		-ms-flex-preferred-size: 40px;
		flex-basis: 40px;
		height: 40px;
		margin: -2px 10px -2px -2px;
		width: 40px
	}
}

@media ( min-width :876px) {
	.-cx-PRIVATE-Post__flexible875.-cx-PRIVATE-Post__root {
		padding-right: 335px;
		width: 100%
	}
	.-cx-PRIVATE-Post__flexible875 .-cx-PRIVATE-Post__header {
		border-bottom: 1px solid #eeefef;
		height: 78px;
		padding: 20px 0;
		position: absolute;
		right: 24px;
		top: 0;
		width: 287px
	}
	.-cx-PRIVATE-Post__flexible875 .-cx-PRIVATE-Post__mediaInfo {
		bottom: 0;
		box-sizing: border-box;
		position: absolute;
		right: 0;
		top: 78px;
		width: 335px
	}
	.-cx-PRIVATE-Post__flexible875 .-cx-PRIVATE-Post__ownerAvatar {
		-webkit-flex-basis: 40px;
		-ms-flex-preferred-size: 40px;
		flex-basis: 40px;
		height: 40px;
		margin: -2px 10px -2px -2px;
		width: 40px
	}
}

@media ( max-width :735px) {
	.-cx-PRIVATE-Post__flexible735 .-cx-PRIVATE-Post__header {
		height: 64px;
		padding: 18px 20px
	}
	.-cx-PRIVATE-Post__flexible735 .-cx-PRIVATE-Post__media {
		border-bottom: 1px solid #eeefef;
		border-top: 1px solid #eeefef
	}
	.-cx-PRIVATE-Post__flexible735 .-cx-PRIVATE-Post__ownerAvatar {
		-webkit-flex-basis: 30px;
		-ms-flex-preferred-size: 30px;
		flex-basis: 30px;
		height: 30px;
		margin: -1px 10px -1px -5px;
		width: 30px
	}
}

@media ( max-width :875px) {
	.-cx-PRIVATE-Post__flexible875 .-cx-PRIVATE-Post__header {
		height: 64px;
		padding: 18px 20px
	}
	.-cx-PRIVATE-Post__flexible875 .-cx-PRIVATE-Post__media {
		border-bottom: 1px solid #eeefef;
		border-top: 1px solid #eeefef
	}
	.-cx-PRIVATE-Post__flexible875 .-cx-PRIVATE-Post__ownerAvatar {
		-webkit-flex-basis: 30px;
		-ms-flex-preferred-size: 30px;
		flex-basis: 30px;
		height: 30px;
		margin: -1px 10px -1px -5px;
		width: 30px
	}
}
</style>
<style type="text/css" data-isostyle-id="is64963a74">
.-cx-PRIVATE-ImageFileForm__fileInput {
	display: none !important
}
</style>
<style type="text/css" data-isostyle-id="is4dc53ceb">
.-cx-PRIVATE-ProfilePicAdder__root {
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	background-color: #4090db;
	color: #fff;
	margin-bottom: 20px;
	padding: 10px;
	-webkit-transition: opacity .2s ease-in;
	transition: opacity .2s ease-in
}

.-cx-PRIVATE-ProfilePicAdder__uploadInFlight {
	opacity: .5;
	pointer-events: none
}

.-cx-PRIVATE-ProfilePicAdder__hideButton {
	background: 0 0;
	border: none;
	cursor: pointer;
	height: 36px;
	outline: none;
	overflow: hidden;
	padding: 0;
	position: absolute;
	right: 0;
	top: 0;
	width: 36px;
	z-index: 2
}

.-cx-PRIVATE-ProfilePicAdder__button {
	background: 0 0;
	border: none;
	color: inherit;
	cursor: pointer;
	font: inherit;
	margin: 0;
	outline: none;
	padding: 0
}

.-cx-PRIVATE-ProfilePicAdder__hideButton::before {
	color: #fff;
	content: '\00D7';
	display: block;
	font-size: 36px;
	font-weight: 100;
	line-height: 36px;
	margin: 0;
	padding: 0
}

.-cx-PRIVATE-ProfilePicAdder__plusIcon::before {
	color: #fff;
	content: '\002B';
	display: block;
	font-size: 72px;
	font-weight: 100;
	line-height: 72px
}

.-cx-PRIVATE-ProfilePicAdder__addPhotoCircle {
	border: 2px solid #fff;
	text-transform: uppercase
}

.-cx-PRIVATE-ProfilePicAdder__middleCrop {
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	border-radius: 50%;
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
	height: 150px;
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	margin: 15px auto;
	width: 150px
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
<style type="text/css" data-isostyle-id="is-5494c5a7">
.-cx-PRIVATE-UserList__root {
	background: #fff
}

.-cx-PRIVATE-UserList__avatar {
	border-radius: 15px;
	height: 30px;
	margin-right: 13px;
	width: 30px
}

.-cx-PRIVATE-UserList__continueButton {
	color: #66bd2b;
	cursor: pointer;
	background-color: transparent;
	border: 0;
	font: inherit;
	font-weight: 600;
	width: 100%
}

.-cx-PRIVATE-UserList__continueButton:hover {
	color: #47841e
}

.-cx-PRIVATE-UserList__continueButton:active {
	color: #335e15
}

.-cx-PRIVATE-UserList__fullName {
	color: #25272a
}

.-cx-PRIVATE-UserList__item {
	border-bottom: solid 1px #eee;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column;
	padding: 16px 20px
}

.-cx-PRIVATE-UserList__item:last-child {
	border-bottom: none;
	margin-bottom: 0
}

.-cx-PRIVATE-UserList__userHeader {
	-webkit-align-content: center;
	-ms-flex-line-pack: center;
	align-content: center
}

.-cx-PRIVATE-UserList__userHeader, .-cx-PRIVATE-UserList__userInfoAndPic
	{
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row
}

.-cx-PRIVATE-UserList__userInfoAndPic {
	-webkit-align-self: flex-start;
	-ms-flex-item-align: start;
	align-self: flex-start;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex
}

.-cx-PRIVATE-UserList__userFollow {
	margin-left: auto;
	width: 110px
}

.-cx-PRIVATE-UserList__userFollow, .-cx-PRIVATE-UserList__userInfo {
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center
}

.-cx-PRIVATE-UserList__userInfo {
	-webkit-box-orient: vertical;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column
}

.-cx-PRIVATE-UserList__userInfo, .-cx-PRIVATE-UserList__userInfoRow {
	-webkit-align-content: center;
	-ms-flex-line-pack: center;
	align-content: center;
	-webkit-box-direction: normal
}

.-cx-PRIVATE-UserList__userInfoRow {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: horizontal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row
}

.-cx-PRIVATE-UserList__verifiedBadge {
	margin-left: 7px
}

.-cx-PRIVATE-UserList__preview {
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row;
	margin-top: 12px
}

.-cx-PRIVATE-UserList__thumbnail {
	-webkit-flex-basis: 150px;
	-ms-flex-preferred-size: 150px;
	flex-basis: 150px;
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	-webkit-flex-shrink: 1;
	-ms-flex-negative: 1;
	flex-shrink: 1;
	margin-right: 2px
}

.-cx-PRIVATE-UserList__thumbnail:last-child {
	margin-right: 0
}

.-cx-PRIVATE-UserList__noPhotosText {
	color: #4b4f54;
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	font-size: 14px;
	line-height: 24px;
	padding: 30px 0 42px;
	text-align: center
}
</style>
<style type="text/css" data-isostyle-id="is-570bc5f1">
.-cx-PRIVATE-FeedPage__root {
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	margin: 0 auto;
	max-width: 600px;
	width: 100%
}

.-cx-PRIVATE-FeedPage__feed {
	margin-bottom: 30px
}

.-cx-PRIVATE-FeedPage__post:last-child {
	margin-bottom: 0
}

.-cx-PRIVATE-FeedPage__reloadLink,
	.-cx-PRIVATE-FeedPage__suggestedAccountsToFollow {
	text-align: center;
	margin-bottom: 20px;
	font-weight: 600
}

.-cx-PRIVATE-FeedPage__suggestedAccountsToFollow {
	color: #25272a
}

@media ( min-width :640px) {
	.-cx-PRIVATE-FeedPage__root {
		padding-top: 60px
	}
	.-cx-PRIVATE-FeedPage__post, .-cx-PRIVATE-FeedPage__suggestedUsersList {
		background-color: #fff;
		border: 1px solid #edeeee;
		border-radius: 3px;
		margin-bottom: 60px;
		margin-left: -1px;
		margin-right: -1px
	}
}

@media ( max-width :639px) {
	.-cx-PRIVATE-FeedPage__root {
		margin-bottom: 10px
	}
}

@media ( max-width :735px) {
	.-cx-PRIVATE-FeedPage__post {
		margin-bottom: 30px
	}
	.-cx-PRIVATE-FeedPage__suggestedAccountsToFollow {
		margin-top: 30px
	}
	.-cx-PRIVATE-FeedPage__suggestedUsersList {
		margin-bottom: 30px
	}
}
</style>
<style type="text/css" data-isostyle-id="is8144012">
.-cx-PRIVATE-AppInstallInterstitial__root {
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	background-color: #4090db;
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	width: 100%
}

.-cx-PRIVATE-AppInstallInterstitial__logo {
	background-image:
		url('//instagramstatic-a.akamaihd.net/bluebar/9308ef9/images/appIcon.png');
	background-size: contain;
	display: block;
	height: 75px;
	width: 75px
}

.-cx-PRIVATE-AppInstallInterstitial__text {
	color: #fff;
	margin: 20px 0;
	max-width: 230px;
	text-align: center
}

.-cx-PRIVATE-AppInstallInterstitial__title {
	font-size: 20px
}

.-cx-PRIVATE-AppInstallInterstitial__description {
	font-size: 12px;
	line-height: 16px;
	margin-top: 8px
}

a.-cx-PRIVATE-AppInstallInterstitial__actionButton, a.-cx-PRIVATE-AppInstallInterstitial__actionButton:visited
	{
	background-color: #fff;
	border-radius: 3px;
	color: #4090db;
	display: block;
	font-size: 16px;
	margin: 0;
	padding: 12px 16px;
	text-align: center
}

a.-cx-PRIVATE-AppInstallInterstitial__actionButton:hover, a.-cx-PRIVATE-AppInstallInterstitial__actionButton:active
	{
	color: #4090db
}

a.-cx-PRIVATE-AppInstallInterstitial__inverseColorButton, a.-cx-PRIVATE-AppInstallInterstitial__inverseColorButton:visited
	{
	background-color: transparent;
	color: #fff
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
		url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 0 transparent;
	_background-image:
		url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/yL/r/s816eWC-2sl.gif);
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
		url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 -15px transparent;
	_background-image:
		url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/yL/r/s816eWC-2sl.gif)
}

.fb_dialog_close_icon:active {
	background:
		url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 -30px transparent;
	_background-image:
		url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/yL/r/s816eWC-2sl.gif)
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
		url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 0;
	left: -10px;
	top: -10px
}

.fb_dialog_top_right {
	background:
		url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 -10px;
	right: -10px;
	top: -10px
}

.fb_dialog_bottom_left {
	background:
		url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 -20px;
	bottom: -10px;
	left: -10px
}

.fb_dialog_bottom_right {
	background:
		url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/ye/r/8YeTNIlTZjm.png)
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
		url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/yd/r/Cou7n-nqK52.gif)
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
		url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/ya/r/3rhSv5V8j3o.gif)
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
		url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/y9/r/jKEcVPZFk-2.gif)
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
		url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/yD/r/t-wz8gw1xG1.png);
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
		url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/y9/r/jKEcVPZFk-2.gif)
		no-repeat;
	height: 32px;
	width: 32px;
	margin-left: -16px;
	position: absolute;
	left: 50%;
	z-index: 4
}
</style>
<style type="text/css" data-isostyle-id="is-209ac46d">
.-cx-PRIVATE-AdvisoryMessage__root {
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	background-color: #fff;
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	padding: 40px;
	text-align: center
}

@media ( min-width :736px) {
	.-cx-PRIVATE-AdvisoryMessage__root {
		border: 1px solid #edeeee;
		border-radius: 3px
	}
}

@media ( max-width :735px) {
	.-cx-PRIVATE-AdvisoryMessage__root {
		border-color: #edeeee;
		border-width: 1px 0
	}
}
</style>
<style type="text/css" data-isostyle-id="is-2e87c2d4">
.-cx-PRIVATE-FollowedByStatistic__rootStacked {
	text-align: center
}

.-cx-PRIVATE-FollowedByStatistic__count {
	color: #34373b;
	font-weight: 600
}

.-cx-PRIVATE-FollowedByStatistic__countStackedVariant {
	display: block
}
</style>
<style type="text/css" data-isostyle-id="is12d03cbc">
.-cx-PRIVATE-FollowingModal__userList {
	margin: 0 auto;
	width: 600px
}
</style>
<style type="text/css" data-isostyle-id="is1ce63c1b">
.-cx-PRIVATE-FollowsStatistic__root, .-cx-PRIVATE-FollowsStatistic__root:active,
	.-cx-PRIVATE-FollowsStatistic__root:visited,
	.-cx-PRIVATE-FollowsStatistic__root:hover {
	color: inherit
}

.-cx-PRIVATE-FollowsStatistic__rootStacked {
	text-align: center
}

.-cx-PRIVATE-FollowsStatistic__count {
	color: #34373b;
	font-weight: 600
}

.-cx-PRIVATE-FollowsStatistic__countStackedVariant {
	display: block
}
</style>
<style type="text/css" data-isostyle-id="is-19fbc54f">
.-cx-PRIVATE-PostModalConsumer__root {
	background-color: rgba(0, 0, 0, .75)
}

.-cx-PRIVATE-PostModalConsumer__root .-cx-PRIVATE-Modal__contents {
	background-color: #fff
}

.-cx-PRIVATE-PostModalConsumer__leftArrow {
	left: -40px
}

.-cx-PRIVATE-PostModalConsumer__rightArrow {
	right: -40px
}

.-cx-PRIVATE-PostModalConsumer__leftArrow,
	.-cx-PRIVATE-PostModalConsumer__rightArrow {
	display: block;
	margin-top: -20px;
	pointer-events: auto;
	position: absolute;
	text-indent: -9999em;
	top: 50%
}

.-cx-PRIVATE-PostModalConsumer__paginationArrows {
	height: 100%;
	margin: 0 auto;
	max-width: 935px;
	pointer-events: none;
	width: 100%
}

.-cx-PRIVATE-PostModalConsumer__paginationWrapper {
	bottom: 0;
	left: 0;
	margin: 0 auto;
	padding: 40px;
	pointer-events: none;
	position: fixed;
	right: 0;
	top: 0
}
</style>
<style type="text/css" data-isostyle-id="is-6845c41e">
.-cx-PRIVATE-MediaBrowser__advisoryMessageHeader {
	color: #4b4f54;
	font-size: 14px;
	font-weight: 600;
	line-height: 24px
}

.-cx-PRIVATE-MediaBrowser__sectionHeader {
	color: #4b4f54;
	font-size: 14px;
	font-weight: 400;
	margin-bottom: 16px;
	text-align: left;
	text-transform: uppercase
}

.-cx-PRIVATE-MediaBrowser__topPostsGrid {
	margin-bottom: 74px
}

@media ( max-width :735px) {
	.-cx-PRIVATE-MediaBrowser__sectionHeader {
		font-size: 14px;
		margin-left: 8px
	}
}
</style>
<style type="text/css" data-isostyle-id="is50653d26">
.-cx-PRIVATE-ReportUserModal__modalMenu {
	margin: 0 auto
}
</style>
<style type="text/css" data-isostyle-id="is5c823b6c">
.-cx-PRIVATE-ProfilePage__root {
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	margin: 0 auto 30px;
	max-width: 935px;
	width: 100%
}

.-cx-PRIVATE-ProfilePage__actionsSmallScreen {
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row;
	margin-top: 11px
}

.-cx-PRIVATE-ProfilePage__advisoryMessageHeader {
	font-weight: 600
}

.-cx-PRIVATE-ProfilePage__advisoryMessageHeader+.-cx-PRIVATE-ProfilePage__advisoryMessageBodyCopy
	{
	margin-top: 13px
}

.-cx-PRIVATE-ProfilePage__advisoryMessageBodyCopy,
	.-cx-PRIVATE-ProfilePage__advisoryMessageHeader {
	color: #4b4f54;
	font-size: 14px;
	line-height: 24px
}

.-cx-PRIVATE-ProfilePage__authorInfo {
	color: #4b4f54
}

.-cx-PRIVATE-ProfilePage__avatar {
	background-color: #fbfbfb;
	border-radius: 50%;
	border: 1px solid #cccfd0;
	box-sizing: border-box;
	display: block;
	margin-left: auto;
	margin-right: auto
}

.-cx-PRIVATE-ProfilePage__avatarWrapper {
	-webkit-flex-shrink: 0;
	-ms-flex-negative: 0;
	flex-shrink: 0
}

.-cx-PRIVATE-ProfilePage__biography {
	display: block
}

.-cx-PRIVATE-ProfilePage__biography:empty {
	display: none
}

.-cx-PRIVATE-ProfilePage__countryBlockMessage .-cx-PRIVATE-ProfilePage__advisoryMessageHeader
	{
	max-width: 640px
}

.-cx-PRIVATE-ProfilePage__editProfileButton {
	text-transform: uppercase
}

.-cx-PRIVATE-ProfilePage__editProfileButtonSmallScreen,
	.-cx-PRIVATE-ProfilePage__editProfileLinkSmallScreen {
	width: 100%
}

.-cx-PRIVATE-ProfilePage__editProfileLink,
	.-cx-PRIVATE-ProfilePage__followButton {
	-webkit-flex-shrink: 0;
	-ms-flex-negative: 0;
	flex-shrink: 0;
	margin-left: 20px
}

.-cx-PRIVATE-ProfilePage__editProfileLinkSmallScreen,
	.-cx-PRIVATE-ProfilePage__followButtonSmallScreen {
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1
}

.-cx-PRIVATE-ProfilePage__fullName {
	color: #4b4f54;
	display: inline;
	font-weight: 600
}

.-cx-PRIVATE-ProfilePage__header,
	.-cx-PRIVATE-ProfilePage__headerSmallScreen {
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row
}

.-cx-PRIVATE-ProfilePage__headerSmallScreen {
	border-bottom-color: #edeeee;
	border-bottom-width: 1px;
	padding-bottom: 30px
}

.-cx-PRIVATE-ProfilePage__privateProfileMessage .-cx-PRIVATE-ProfilePage__advisoryMessageBodyCopy,
	.-cx-PRIVATE-ProfilePage__privateProfileMessage .-cx-PRIVATE-ProfilePage__advisoryMessageHeader
	{
	max-width: 230px
}

.-cx-PRIVATE-ProfilePage__reportUserButton {
	background: 0 0;
	border-color: #4090db transparent transparent transparent;
	border-style: solid;
	height: 0;
	padding: 0;
	overflow: hidden;
	width: 0
}

.-cx-PRIVATE-ProfilePage__statistic:first-child {
	margin-left: 0
}

.-cx-PRIVATE-ProfilePage__statistic:last-child {
	margin-right: 0
}

.-cx-PRIVATE-ProfilePage__statisticSmallScreen {
	text-align: center;
	width: 33.3%
}

.-cx-PRIVATE-ProfilePage__statisticsSmallScreen:last-child {
	width: 33.4%
}

.-cx-PRIVATE-ProfilePage__statistics,
	.-cx-PRIVATE-ProfilePage__statisticsSmallScreen {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row
}

.-cx-PRIVATE-ProfilePage__statisticsSmallScreen {
	-webkit-justify-content: space-around;
	-ms-flex-pack: distribute;
	justify-content: space-around;
	padding: 17px 0
}

.-cx-PRIVATE-ProfilePage__username {
	color: #4b4f54;
	font-weight: 300;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap
}

.-cx-PRIVATE-ProfilePage__usernameAndFollow {
	-webkit-box-align: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-webkit-flex-direction: row;
	-ms-flex-direction: row;
	flex-direction: row
}

.-cx-PRIVATE-ProfilePage__verifiedBadge {
	margin-left: 7px
}

.-cx-PRIVATE-ProfilePage__websiteLink {
	font-weight: 600
}

@media ( min-width :736px) {
	.-cx-PRIVATE-ProfilePage__root {
		box-sizing: content-box;
		padding: 40px 20px 0;
		width: calc(100% - 40px)
	}
	.-cx-PRIVATE-ProfilePage__authorInfo {
		-webkit-flex-basis: 30px;
		-ms-flex-preferred-size: 30px;
		flex-basis: 30px;
		-webkit-box-flex: 2;
		-webkit-flex-grow: 2;
		-ms-flex-positive: 2;
		flex-grow: 2
	}
	.-cx-PRIVATE-ProfilePage__avatar {
		height: 152px;
		margin-bottom: -7px;
		margin-top: -7px;
		width: 152px
	}
	.-cx-PRIVATE-ProfilePage__avatarWrapper {
		-webkit-flex-basis: 0;
		-ms-flex-preferred-size: 0;
		flex-basis: 0;
		-webkit-box-flex: 1;
		-webkit-flex-grow: 1;
		-ms-flex-positive: 1;
		flex-grow: 1;
		margin-right: 30px
	}
	.-cx-PRIVATE-ProfilePage__biography {
		font-size: 17px;
		line-height: 24px;
		margin-top: 14px
	}
	.-cx-PRIVATE-ProfilePage__header {
		margin-bottom: 45px
	}
	.-cx-PRIVATE-ProfilePage__header,
		.-cx-PRIVATE-ProfilePage__headerSmallScreen {
		padding: 20px 0
	}
	.-cx-PRIVATE-ProfilePage__reportUserButton {
		border-width: 12px 7px 0 7px;
		margin: 11px 10px
	}
	.-cx-PRIVATE-ProfilePage__statistic {
		font-size: 17px;
		margin-right: 40px
	}
	.-cx-PRIVATE-ProfilePage__statistics {
		margin-top: 17px
	}
	.-cx-PRIVATE-ProfilePage__username {
		font-size: 34px;
		line-height: 40px
	}
}

@media ( max-width :735px) {
	.-cx-PRIVATE-ProfilePage__authorInfo {
		-webkit-flex-basis: 0;
		-ms-flex-preferred-size: 0;
		flex-basis: 0;
		-webkit-box-flex: 1;
		-webkit-flex-grow: 1;
		-ms-flex-positive: 1;
		flex-grow: 1
	}
	.-cx-PRIVATE-ProfilePage__avatar {
		height: 77px;
		margin-bottom: -6px;
		margin-top: -6px;
		width: 77px
	}
	.-cx-PRIVATE-ProfilePage__avatarWrapper {
		margin-right: 25px
	}
	.-cx-PRIVATE-ProfilePage__biography {
		font-size: 14px;
		line-height: 17px;
		margin-top: 7px
	}
	.-cx-PRIVATE-ProfilePage__header {
		margin: 30px 20px
	}
	.-cx-PRIVATE-ProfilePage__headerSmallScreen {
		margin-left: 20px;
		margin-right: 20px;
		margin-top: 30px
	}
	.-cx-PRIVATE-ProfilePage__reportUserButton {
		border-width: 7px 4px 0 4px;
		margin: 7px 6px
	}
	.-cx-PRIVATE-ProfilePage__statistic {
		font-size: 14px;
		margin-left: 10px;
		margin-right: 10px
	}
	.-cx-PRIVATE-ProfilePage__statistics {
		margin-top: 10px
	}
	.-cx-PRIVATE-ProfilePage__username {
		font-size: 21px
	}
}
</style>
<style type="text/css" data-isostyle-id="is6f3d39b7">
.-cx-PRIVATE-TagPage__root {
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	margin: 0 auto 30px;
	max-width: 935px;
	width: 100%
}

.-cx-PRIVATE-TagPage__advisoryMessageActions {
	margin: 2em auto 0;
	text-align: center
}

.-cx-PRIVATE-TagPage__advisoryMessageActions li {
	display: inline-block;
	margin-left: 1em
}

.-cx-PRIVATE-TagPage__advisoryMessageActions li:first-child {
	margin-left: 0
}

.-cx-PRIVATE-TagPage__advisoryMessageHeader {
	font-weight: 600
}

.-cx-PRIVATE-TagPage__advisoryMessageHeader+.-cx-PRIVATE-TagPage__advisoryMessageBodyCopy
	{
	margin-top: 13px
}

.-cx-PRIVATE-TagPage__advisoryMessageBodyCopy,
	.-cx-PRIVATE-TagPage__advisoryMessageHeader {
	color: #4b4f54
}

.-cx-PRIVATE-TagPage__advisoryMessageBodyCopy,
	.-cx-PRIVATE-TagPage__advisoryMessageHeader,
	.-cx-PRIVATE-TagPage__advisoryMessageLearnMoreLink {
	font-size: 14px;
	line-height: 24px
}

.-cx-PRIVATE-TagPage__header {
	text-align: center
}

.-cx-PRIVATE-TagPage__tagName {
	color: #4b4f54;
	font-weight: 300;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap
}

@media ( min-width :736px) {
	.-cx-PRIVATE-TagPage__root {
		box-sizing: content-box;
		padding: 0 20px;
		width: calc(100% - 40px)
	}
	.-cx-PRIVATE-TagPage__header {
		font-size: 17px;
		margin-top: 56px;
		margin-bottom: 44px
	}
	.-cx-PRIVATE-TagPage__tagName {
		font-size: 34px;
		margin-bottom: 13px
	}
}

@media ( max-width :735px) {
	.-cx-PRIVATE-TagPage__header {
		font-size: 14px;
		margin-top: 31px;
		margin-bottom: 31px
	}
	.-cx-PRIVATE-TagPage__tagName {
		font-size: 21px;
		margin-bottom: 8px
	}
}
</style>
<script>

$(function(){
	$('.commentBtn').each(function() {
		$(this).click(function(){
			
			var pid = $(this).data('photo');
			var comment = $('#c'+pid).val();
			
			if(trim(comment) != ""){
				$.ajax({
					type: 'POST',
					url: 'ajaxtimelinecomment',
					data:{
						content:comment,
						seq_photo:pid
					},
					success:function(){
						location.reload();
					},
					error:function(){
						alert("error");
					}
				});
			}
		});
	});
});

</script>
</head>
<body>
	<span id="react-root" aria-hidden="false">
		<section class="-cx-PRIVATE-Shell__main">
			<main class="-cx-PRIVATE-Shell__content" role="main">
				<section class="-cx-PRIVATE-FeedPage__root">
					<div class="-cx-PRIVATE-FeedPage__feed">
						<div>
							<%
								if (articleList == null || articleList.size() == 0) {
							
								} else {
									for (int i = 0; i < articleList.size(); i++) {
										ArticleVO article = articleList.get(i);
										HashMap userInfo = article.getUserInfo();
							%>
							<article class="-cx-PRIVATE-FeedPage__post -cx-PRIVATE-Post__root -cx-PRIVATE-Post__feed">
								<header class="-cx-PRIVATE-Post__header">
							<%
									if (userInfo.get("PROFILE") != null) {
							%>
									<img class='-cx-PRIVATE-Post__ownerAvatar' src='./personalImg/<%= userInfo.get("EMAIL")%>/<%= userInfo.get("PROFILE")%>'/>
							<%
									} else {
							%>
									<img class='-cx-PRIVATE-Post__ownerAvatar' src='./personalImg/profile.jpg'>
							<%
									}
							%>
									<div class="-cx-PRIVATE-Post__ownerAndLocation">
										<a class="-cx-PRIVATE-UserLink__root -cx-PRIVATE-Post__ownerUserLink" href="./<%= userInfo.get("NICKNAME") %>"><%= userInfo.get("NICKNAME") %></a>
									</div>
							<%
									PhotoInfoVO photo = article.getPhoto();
									String time = "";
									long uploadTime = System.currentTimeMillis() - photo.getReg_date().getTime();
									if ( uploadTime/(1000*60*60*24*7) != 0 ) {
										time = uploadTime/(1000*60*60*24*7) +"주 전";
									} else if ( uploadTime/(1000*60*60*24) != 0 ) {
										time = uploadTime/(1000*60*60*24) + "일 전";
									} else if ( uploadTime/(1000*60*60) != 0 ) {
										time = uploadTime/(1000*60*60) + "분 전";
									} else if ( uploadTime/(1000*60) != 0 ) {
										time = uploadTime/(1000*60) + "초 전";
									} else if ( uploadTime/(1000*30) != 0 ) {
										time = "방금";
									}
							%>
									<a class="-cx-PRIVATE-Post__timestamp" href="">
										<span class="-cx-PRIVATE-Timestamp__root"><%= time %></span>
									</a>
								</header>
								<div class="ResponsiveBlock -cx-PRIVATE-Post__media -cx-PRIVATE-PhotoWithUserTags__root">
									<div class="-cx-PRIVATE-Photo__root -cx-PRIVATE-PhotoWithUserTags__photo">
										<div style="padding-bottom: 100%;" class="-cx-PRIVATE-Photo__placeholder">
											<img class="-cx-PRIVATE-Photo__image" src='./personalImg/<%= userInfo.get("EMAIL")%>/<%= photo.getSeq_photo()%>.jpg'>
										</div>
										<div class="-cx-PRIVATE-Photo__clickShield"></div>
									</div>
								</div>
								<div class="-cx-PRIVATE-PostInfo__root -cx-PRIVATE-Post__mediaInfo">
							<%
									List<HashMap> likeList = article.getLikeList();
							%>
									<section class="-cx-PRIVATE-PostInfo__likesAndTimestamp -cx-PRIVATE-PostInfo__likesAndTimestampStackedVariant">
										<div class="-cx-PRIVATE-PostInfo__likesInfo -cx-PRIVATE-PostLikers__root">
											<span class="-cx-PRIVATE-PostLikers__likeCount">
							<%
									if ( likeList.size() == 0 ) {
							%>
										<span>♥ 좋아요</span>
							<%
									}
									else if ( likeList.size() < 6 ) {
										for ( int j = 0; j < likeList.size(); j++ ) {
											HashMap like = likeList.get(j);
							%>
											<span><a href='./<%= like.get("NICKNAME")%>'><%= like.get("NICKNAME") %></a></span>
							<%
											if ( j != likeList.size() - 1 ) {
												out.print(", ");
											}
										}
							%>
										<span>님이 좋아합니다.</span>
							<%
									} else {
							%>
										<span>좋아요 </span>
										<span><%= likeList.size() %></span>
										<span>개</span>
							<%
									}
							%>
											</span>
										</div>
									</section>
									<ul class="-cx-PRIVATE-PostInfo__comments -cx-PRIVATE-PostInfo__commentsStackedVariant">
										<li class="-cx-PRIVATE-PostInfo__comment">
											<h1>
							<%
									String content = photo.getContent();
									if ( content != null ) {
										StringTokenizer stk = new StringTokenizer(content);
										while(stk.hasMoreTokens()) {
											String token = stk.nextToken();
											if ( token.startsWith("#") ) {
							%>
												<a href='./hashtag/<%= token.substring(1) %>'><%= token %></a>
							<%
											} else if ( token.startsWith("@") ) {
							%>
												<a href='./<%= token.substring(1) %>'><%= token %></a>
							<%
											} else {
							%>
												<%= token %>
							<%
											}
										}
									}
							%>
											</h1>
										</li>
								<div id="ccomment">
							<%
									List<HashMap> commentList = article.getCommentList();
								
									if ( commentList != null && commentList.size() > 0 ) {
										for ( int j = 0; j < commentList.size(); j++ ) {
											HashMap comment = commentList.get(j);
							%>
											<li><a href='./<%= comment.get("NICKNAME")%>'><%= comment.get("NICKNAME")%> </a>
							<%
											String cmtContent = (String)comment.get("CONTENT");
											
											if ( cmtContent != null ) {
												StringTokenizer stk = new StringTokenizer(cmtContent);
												while(stk.hasMoreTokens()) {
													String token = stk.nextToken();
													if ( token.startsWith("#") ) {
							%>
														<a href='./hashtag/<%= token.substring(1) %>'><%= token %></a>
							<%
													} else if ( token.startsWith("@") ) {
							%>
														<a href='./<%= token.substring(1) %>'><%= token %></a>
							<%
													} else {
							%>
														<%= token %>
							<%
													}
												}
							%>
											</li>
							<%
											}
										}
									}
									
							%>
								</div>
									</ul>
									<section class="-cx-PRIVATE-PostInfo__feedback -cx-PRIVATE-PostInfo__feedbackStackedVariant">
										<a class="-cx-PRIVATE-PostInfo__likeButton -cx-PRIVATE-LikeButton__root -cx-PRIVATE-Util__hideText coreSpriteHeartOpen" href="#" role="button">좋아요</a>
										<form class="-cx-PRIVATE-PostInfo__commentCreator" method="POST">
											<table> 
												<tr>
													<td width="430">
														<input class="-cx-PRIVATE-PostInfo__commentCreatorInput" placeholder="댓글 달기..." type="text" value="" id="c<%= photo.getSeq_photo()%>">
													</td>
													<td>
														<input class="commentBtn" type="button" value="확인 " name="submit" data-photo="<%= photo.getSeq_photo()%>">
													</td>
												</tr>
											</table>
										</form>
										<button class="-cx-PRIVATE-PostInfo__optionsButton coreSpriteEllipsis -cx-PRIVATE-Util__hideText">옵션 더 보기</button>
									</section>
								</div>
							</article>
							<%
									}
								}
							%>
						</div>
					</div>
				</section>
			</main>
			<jsp:include page="top.jsp" flush="true" />
			<footer class="-cx-PRIVATE-Shell__footer" role="contentinfo">
				<div class="-cx-PRIVATE-Footer__main -cx-PRIVATE-Footer__slim" style="max-width: 600px;">
					<nav class="-cx-PRIVATE-Footer__nav" role="navigation"></nav>
					<span class="-cx-PRIVATE-Footer__copyright">© 2015 Kostagram</span>
				</div>
			</footer>
			<noscript></noscript>
		</section>
	</span>
</body>
</html>
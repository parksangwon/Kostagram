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
		<style type="text/css"> 
		.profileImg { 
			-webkit-border-radius: 100px; 
			border-radius: 100px; 
		} 
		</style> 
	</head>
	<body>
		<div id="loginform" data-role="page" data-theme="b" >
		
			<div data-role="header" data-theme="b">
				<h1>둘러보기</h1>
				<a href="#" data-rel="back"><</a>
			</div>
			
			<div>
				<table width="100%">
					<tr>
						<td width="60"><image src="./image/test.jpg" width="60" class="profileImg"/></td>
						<td align="left">이성경존나이뻐요</td>
						<td align="right"><a href="#"><image src="./image/follow.jpg" width="80"/></a></td>
					</tr>
				</table>
			</div>
			
			<div>
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td width="100%" colspan="2"><image src="./image/test.jpg" width="100%"/></td>
					</tr>
					<tr>
						<td align="left"><a href="#"><image src="./image/icon/heart.png" width="25"/></a>&nbsp;&nbsp;<a href="#"><image src="./image/icon/chat_bubble.png" width="25"/></a></td>
						<td align="right"><a href="#"><image src="./image/icon/warning.png" width="25"/></a></td>
					</tr>
				</table>
			</div>
			<div>
				<table>
					<tr>
						<td>좋아요 몇개</td>
					</tr>
					<tr>
						<td>댓글</td>
					</tr>
					<tr>
						<td>댓글</td>
					</tr>
					<tr>
						<td>댓글</td>
					</tr>
					<tr>
						<td>댓글</td>
					</tr>
					<tr>
						<td>댓글</td>
					</tr>
				</table>
			</div>
			<div>
				댓글 달기
			</div>
		</div>
	</body>
</html>
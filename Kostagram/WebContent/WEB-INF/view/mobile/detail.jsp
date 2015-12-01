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
				<h1>�ѷ�����</h1>
				<a href="#" data-rel="back"><</a>
			</div>
			
			<div>
				<table width="100%">
					<tr>
						<td width="60"><image src="./image/test.jpg" width="60" class="profileImg"/></td>
						<td align="left">�̼��������̻���</td>
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
						<td>���ƿ� �</td>
					</tr>
					<tr>
						<td>���</td>
					</tr>
					<tr>
						<td>���</td>
					</tr>
					<tr>
						<td>���</td>
					</tr>
					<tr>
						<td>���</td>
					</tr>
					<tr>
						<td>���</td>
					</tr>
				</table>
			</div>
			
			<div>
				��� �ޱ�
			</div>
			
			<div data-role="footer" data-theme="b">
				<div data-role="navbar" class="ui-btn-active">
					<ul>
						<li><a data-role="button" data-icon="home" data-iconpos="notext"></a></li>
						<li><a href="./round" data-role="button" data-icon="search" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="star" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="star" data-iconpos="notext"></a></li>
						<li><a href="./userpage" data-role="button" data-icon="info" data-iconpos="notext"></a></li>
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>
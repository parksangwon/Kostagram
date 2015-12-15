<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0,user-scalable=no" />
<TITLE>Kostagram</TITLE>

<script src="jquery-mobile/jquery-1.6.4.js"></script>
<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
<script src="js/common.js"></script>
<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet"
	type="text/css" />
<%
	
%>
<body>
	<div id="option" data-role="page" data-theme="a">

		<div data-role="header">
			<table>
				<tr>
					<td><a href="#" data-rel="back"><image
								src="./image/icon/back.png" width="20"
								style="padding-left:10px;" /></a> <span
						style="height: 35px; font-size: 20px; color: #ffffff; line-height: 35px; text-align: left; background-color: transparent; border: 0px; text-shadow: 0px 0px 0px black; padding-left: 5px;">
							댓글 </span></td>
				</tr>
			</table>
		</div>

		<div data-rol="content">
			
		</div>
		
		<div data-role="footer" data-position="fixed">
			<table border="0">
				<tr>
					<td width="99%"><input type="text" placeholder="댓글 달기..." /></td>
					<td><img src="./image/icon/pencil.png"></td>
				</tr>
			</table>
			
		</div>
	</div>
</body>
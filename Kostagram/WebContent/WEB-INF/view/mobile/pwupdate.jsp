<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>


<!DOCTYPE html> 
<html> 
	<head>
		<title>jQuery Mobile</title>
		<meta charset="euc-kr" /> 	
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		
		
		
		
		<script src="jquery-mobile/jquery-1.6.4.js"></script>
		<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
		<script src="js/common.js"></script>
		<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet" type="text/css" />
			
		
							
	</head> 
		
<body>
	<div data-role="page" data-theme="d">
			
			<div data-role="header" data-theme="b">
				<table width="100%">
					<tr>
						<td>
						<!--  뒤로가기  --><img src="./m/image/icon/back.png" width="20" onclick="window.location.href = './userpage.jsp'" >
						<span style="height:35px;
							font-size:15px;
							color:#ffffff;
							line-height:35px;
							text-align:left;
							background-color:transparent;
							border:0px;
							text-shadow: 0px 0px 0px black;
							padding-left:5px;">
							비밀번호 변경
							</span>				
						</td>
						
						<td align="right">
						<!--  확인 --><a href="./detail"><img src="./m/image/icon/tick.png" width="20"></a>
						</td>
					</tr>
				</table>
			</div>
			
			
			<div data-role="content"	 data-theme="d">
				<p><font color="#004879">비밀번호를 잊으셨나요??</font></p>
				
				<img src="./m/image/icon/lock.png"><input type="password" placeholder="현재 비밀번호" >
				<br>
				<img src="./m/image/icon/lock.png" ><input type="password" placeholder="새 비밀번호">
				<br>
				<img src="./m/image/icon/lock.png" ><input type="password" placeholder="새 비밀번호 다시 입력" >
				<br>
				
			</div>
			
			<div data-role="footer" data-theme="b" data-position="fixed">
				<div data-role="navbar" class="ui-btn-active">
					<ul>
						<li><a href="./"><image src="./image/icon/house.png" width="20"/></a></li>
						<li><a href="./round"><image src="./image/icon/search.png" width="20"/></a></li>
						<li><a href="#"><image src="./image/icon/camera.png" width="20"/></a></li>
						<li><a href="./mynews"><image src="./image/icon/info.png" width="20"/></a></li>
						<li><a href="./userpage"><image src="./image/icon/user.png" width="20"/></a></li>
					</ul>
				</div>
			</div>
		</div>
</body>
</html>
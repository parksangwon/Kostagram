<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
	ArrayList likeNoticeList =(ArrayList)request.getAttribute("likeNoticeList"); ;
%>
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
			
		
		<style>
			.ui-bar-f {
			    color:#004879;
			    background-color: #004879;
			}
		</style>
							
	</head> 
		
<body>
	<div data-role="page" data-theme="d">
			
			
			<div data-role="header" data-theme="b">
				<table>
					<tr>
						<td>
							<!--  뒤로가기  --><img src="./m/image/icon/back.png" onclick="#" >
							<font color="white">좋아요</font>				
						</td>
					</tr>
				</table>
			</div>
			
			
			
			
			<div data-role="content"	 data-theme="d">
				
				<%
					if (likeNoticeList == null || likeNoticeList.size() == 0 ) {
				%>
						<center>좋아요 한 글이 없습니다.</center>
				<%	
					} else {
						for ( int i = 0; i < likeNoticeList.size(); i++ ) {
				%>	
				
				<table>
					<tr>
						<td width="30%"><a href="./detail"><img src="./m/image/testImage3.jpg" width="100%" onclick="#"></a></td>
						<td width="30%"><a href="./detail"><img src="./m/image/testImage3.jpg" width="100%" onclick="#"></a></td>
						<td width="30%"><a href="./detail"><img src="./m/image/testImage3.jpg" width="100%" onclick="#"></a></td>
					</tr>
					
					<tr>
						<td width="30%"><a href="./detail"><img src="./m/image/testImage3.jpg" width="100%" onclick="#"></a></td>
						
					</tr>
					
			
				</table>
				<%}
				}%>
		
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
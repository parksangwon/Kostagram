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
		
		<link rel="shortcut icon" href="../image/icon.png">
		<link rel="apple-touch-icon" href="../image/icon.png"> 
		
		
		
				
		<!-- Include jQuery Mobile stylesheets -->
		<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
		
		<!-- Include the jQuery library -->
		<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
		
		<!-- Include the jQuery Mobile library -->
		<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
			
		
		<style>
			.ui-bar-f {
			    color:#004879;
			    background-color: #004879;
			}
		</style>
							
	</head> 
		
<body>
	<div data-role="page">
		
			<div data-role="header"	data-theme="f" >
				<table width="100%">
					<tr>
						<td>
							<!--  뒤로가기  --><input type="image" src="./m/image/icon/cross.png" onclick="#" >
							<font color="white">좋아요</font>				
						</td>
					</tr>
				</table>
			</div>
			
			<div data-role="content"	 data-theme="d">
				
		<%
			if (likeNoticeList == null || likeNoticeList.size() == 0 ) {
		%>
				좋아요 한 글이 없습니다.
		<%	
			} else {
				for ( int i = 0; i < likeNoticeList.size(); i++ ) {
		%>	
				
				<table>
					<tr>
						<td width="30%"><input type="image" src="./m/image/testImage3.jpg" width="100%" onclick="#"></td>
						<td width="30%"><input type="image" src="./m/image/testImage3.jpg" width="100%" onclick="#"></td>
						<td width="30%"><input type="image" src="./m/image/testImage3.jpg" width="100%" onclick="#"></td>
					</tr>
					
					<tr>
						<td width="30%"><input type="image" src="./m/image/testImage3.jpg" width="100%" onclick="#"></td>
						
					</tr>
					
			
				</table>
		<%	}
		}	%>
			</div>
			
			
			<div data-role="footer" data-theme="b"		data-position="fixed">
				<div data-role="navbar" >
					<ul data-theme="f">
						<li><a data-role="button" data-icon="home" data-iconpos="notext" ></a></li>
						<li><a data-role="button" data-icon="search" data-iconpos="notext" ></a></li>
						<li><a data-role="button" data-icon="star" data-iconpos="notext"	class="ui-btn-active 	ui-state-persist"></a></li>
						<li><a data-role="button" data-icon="star" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="info" data-iconpos="notext" ></a></li>
					</ul>
				</div>
			</div> 
			
		</div>


</body>
</html>
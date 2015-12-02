<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
	ArrayList followingList =(ArrayList)request.getAttribute("followingList"); ;
%>

<!DOCTYPE html> 
<html> 
	<head>
		<title>following</title>
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
				<left><font color="white" size="3">활동</font></left>
			</div>
		
			<div data-role="content" >
				<table width="100%">
					<tr >
						<td align="left" width="50%">
							<a href="#" class="ui-btn ui-btn-inline ui-shadow ui-corner-all" style="text-decoration:none"><center>팔로잉</center></a>
							<hr>
						</td>
						
						<td  align="right" width="50%">
							<a href="#" class="ui-btn ui-btn-inline ui-shadow ui-corner-all" style="text-decoration:none"><center>내 게시물</center></a>
							<hr>
						</td>
					</tr>
				</table>
		
		
		<div data-role="content"	 data-theme="d">		
					<%
			if (followingList == null || followingList.size() == 0 ) {
		%>
				<center>
					<h3>내가 팔로우 하는 사람들의 활동</h3>
					<font size="2">내가 팔로우 하는 사람이 게시물에 댓글을 달거나 좋아요를 클릭하면 표시됩니다.</font>
				</center>
				
		<%	
			} else {
				for ( int i = 0; i < followingList.size(); i++ ) {
		%>
			
				<ul data-role="listview">
					<li>
						<a href="./detail"><img src="./m/image/testImage1.jpg" class="ul-li-icon" />
							<table style="word-break:break-all">
								<tr>
									<td>qkrwnsgur0605</td>
								</tr>
								
								<tr>
									<td><font size="1">회원님이 좋아요!</font></td>
								</tr>

							</table>		
						</a>
					</li>
					
					<li>
						<a href="./detail"><img src="./m/image/testImage1.jpg" class="ul-li-icon" />
							<table style="word-break:break-all">
								<tr>
									<td >hihi123</td>
								</tr>
								
								<tr>
									<td><font size="1">회원님이 좋아요!</font></td>
								</tr>
							</table>		
						</a>
					</li>
					
					<li>
						<a href="./detail"><img src="./m/image/testImage1.jpg" class="ul-li-icon" />
							<table style="word-break:break-all">
								<tr>
									<td >ohyegood422 님이 회원님의 게시물을 팔로우 하셨습니다.</td>
								</tr>
								
								<tr>
									<td><font size="1">회원님의 글이 좋아요!</font></td>
								</tr>
							</table>		
						</a>
					</li>
					
				</ul>
			<%}
				
				}%>
		</div>
		
		
		  </div>
		  
			<div data-role="footer" data-theme="b"		data-position="fixed">
				<div data-role="navbar" >
					<ul>
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
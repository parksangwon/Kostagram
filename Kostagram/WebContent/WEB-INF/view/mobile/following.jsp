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
			<div data-role="content"	 data-theme="d">
				<ul data-role="listview" data-inset="true">
					<li >
						<table>
							<tr>
								<td width="5%">프사</td>
								<td width="20%"><a href="#" style="text-decoration:none"><font color="#004879">Hihi123</font></a></td>							
								<td width="70%"	align="right">10분</td>
							</tr>			
						</table>
					</li>
						<img src="./framework/images/testImage3.jpg"  width="100%">
					<li>	
						<table width="100%">
							<tr>
								<td>			
									<input type="image" src="./m/image/icon/heart.png" onclick="#">
								</td>
								<td>
									<input type="image" src="./m/image/icon/chat_bubble.png" onclick="#">
								</td>
								<td>
									<input type="image" src="./m/image/icon/plus.png" onclick="#">
								</td>
								<td align="right">
									<right><a href="#smenu" data-rel="popup" class="ui-btn ui-btn-inline ui-corner-all" data-inline="true" >:</a></right>
								</td>
							</tr>
						</table>	
							    
							    
							    <div data-role="popup" id="smenu" data-overlay-theme="b">
							      <input type="button" value="신고">
							    </div>

					</li>
					<li>
						<p><a href="#" style="text-decoration:none" ><font color="#004879">♥ 좋아요 142개</font></a></p>
						<br>
						<p><a href="#" style="text-decoration:none"><font color="#004879">Hihi123</font></a> I see you. 
						<a href="#" style="text-decoration:none"><font color="#OD37CA">#widewhynot</font></a></p>
						
						<p><a href="#" style="text-decoration:none"><font color="gray">댓글 ???개 모두보기</font></a></p>
						<p><a href="#" style="text-decoration:none"><font color="#004879">borouhhin</font></a>	Fire~</p>
						<p><a href="#" style="text-decoration:none"><font color="#004879">junhyck</font></a>	Awesome</p>
						<p><a href="#" style="text-decoration:none"><font color="#004879">rossmansusna</font></a>	Going up or going down1 Great, ILove this pic.</p>
						<p><a href="#comment" style="text-decoration:none"><font color="gray">댓글 달기</font></a></p>
					</li>
				</ul>
			</div>
			
			<div id="comment" data-role="page"  data-theme="d">
				<div data-role="header">
					<h1>댓글 달기</h1>
					<a href="#" data-rel="back" data-icon="arrow-1"></a>
				</div>
				<div data-role="content">
					<h1>댓글 다는 페이지</h1>
				</div>
			</div>
		
		<%}
				}%>
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
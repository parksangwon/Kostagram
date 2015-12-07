<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	ArrayList followingList =(ArrayList)request.getAttribute("followingList"); ;
%>

<title>Kostagram</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<script src="jquery-mobile/jquery-1.6.4.js"></script>
<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
<script src="js/common.js"></script>
<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet"
	type="text/css" />

<body>
	<div data-role="page" data-theme="d">

		<div data-role="header" data-theme="b">
				<table>
					<tr>
						<td>
							<span style="height:35px;
							font-size:20px;
							color:#ffffff;
							line-height:35px;
							text-align:left;
							background-color:transparent;
							border:0px;
							text-shadow: 0px 0px 0px black;
							padding-left:5px;">
							활동
							</span>
						</td>
					</tr>
				</table>
			</div>
		
			<div data-role="content" data-theme="d">
				<table width="100%">
						<tr>
							<td onclick="window.location.href = './following.jsp'" align="center">팔로잉</td>
							<td onclick="window.location.href = './mynews.jsp'" align="center">내 게시물</td>
						</tr>
				</table>
			</div>	
		
			<div data-role="content" data-theme="d">
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
						<a href="./detail"><img src="./m/image/testImage3.jpg" class="ul-li-icon" />
							<table width="100%">
								<tr>
									<td><font size="2"><!-- 나를 좋아요한 아이디 --></font></td>
								</tr>
								
								<tr>
									<td><font size="1">회원님을 팔로잉</font></td>
								</tr>

							</table>		
						</a>
					</li>					
				</ul>
			<%  }
				}	%>
			</div>



		<div data-role="footer" data-theme="b" data-position="fixed">
			<div data-role="navbar" class="ui-btn-active">
				<ul>
					<li><a href="./"><image src="./image/icon/house.png"
								width="20" /></a></li>
					<li><a href="./round"><image src="./image/icon/search.png"
								width="20" /></a></li>
					<li><a href="#"><image src="./image/icon/camera.png"
								width="20" /></a></li>
					<li><a href="./mynews"><image src="./image/icon/info.png"
								width="20" /></a></li>
					<li><a href="./userpage"><image
								src="./image/icon/user.png" width="20" /></a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
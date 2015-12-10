<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	ArrayList chattingMemberList =(ArrayList)request.getAttribute("chattingMemberList"); ;
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

	<div id="chattinglist" data-role="page" data-theme="a">

		<div data-role="header">
			<table>
				<tr>
					<td>
						<!--  뒤로가기  --> <img src="./m/image/icon/back.png"
						onclick="window.location.href = './timeline.jsp'"> <font
						color="white">DIRECT</font>
					</td>
				</tr>
			</table>
		</div>

		<div data-role="content" >
		     	<input type="text" id="add" placeholder="대화상대 추가"> <input type="submit" value="추가"><br>		
			
			
			<%
			if (chattingMemberList == null || chattingMemberList.size() == 0 ) {
			%>
				<center>채팅 상대를 추가해주세요.</center>
			<%	
				} else {
					for ( int i = 0; i < chattingMemberList.size(); i++ ) {
			%>						
				<ul data-role="listview">
					<li>
						<a href="./chatting.jsp"><img src="./m/image/testImage1.jpg" width="20" class="ul-li-icon" />
							<table>
								<tr>
									<td><!-- 아이디 --></td>
								</tr>
								<tr>
									<td>
										<font size="2" color="gray"><!-- 상대의 마지막 말 --></font> 
										<font size="1" color="gray"><!-- 마지막 말을 받은 시간 --></font>
									</td>
								</tr>
							</table>		
						</a>
					</li>
				</ul>
			<% }
				}%>
		
			</div>

		<div data-role="footer" data-position="fixed">
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
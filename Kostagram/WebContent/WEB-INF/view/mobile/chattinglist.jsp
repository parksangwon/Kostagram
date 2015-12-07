<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
	ArrayList chattingMemberList =(ArrayList)request.getAttribute("chattingMemberList"); ;
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
				
	</head> 
<body>

	<div data-role="page"  data-theme="d">
			
			
			<div data-role="header" data-theme="b">
				<table>
					<tr>
						<td>
						<!--  뒤로가기  --><img src="./m/image/icon/back.png" width="20" onclick="window.location.href = './timeline.jsp'" >
						<span style="height:35px;
							font-size:15px;
							color:#ffffff;
							line-height:35px;
							text-align:left;
							background-color:transparent;
							border:0px;
							text-shadow: 0px 0px 0px black;
							padding-left:5px;">
							DIRECT
							</span>				
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
									<td>qkrwnsgur0605</td>
								</tr>
								<tr>
									<td>
										<font size="2" color="gray">안녕하세요??</font> 
										<font size="1" color="gray">18분</font>
									</td>
								</tr>
							</table>		
						</a>
					</li>
					<li>
						<a href="./chatting.jsp"><img src="./m/image/testImage2.jpg" class="ul-li-icon" />
							<table>
								<tr>
									<td>hihihi10234</td>
								</tr>
								<tr>
									<td>
										<font size="2" color="gray">뭐함??</font> 
										<font size="1" color="gray">39분</font>
									</td>
								</tr>
							</table>		
						</a>
					</li>
					<li>
						<a href="./chatting.jsp"><img src="./m/image/testImage3.jpg" class="ul-li-icon" />
							<table>
								<tr>
									<td>heyhey5252</td>
								</tr>
								<tr>
									<td>
										<font size="2" color="gray">ㅇㅋ알겠음</font> 
										<font size="1" color="gray">50분</font>
									</td>
								</tr>
							</table>		
						</a>
					</li>
				</ul>
			<% }
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
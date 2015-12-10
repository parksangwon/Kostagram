<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	ArrayList chattingList =(ArrayList)request.getAttribute("chattingList");
	String chattingSection = (String)request.getAttribute("chattingSection");
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

	<div id="chatting" data-role="page" data-theme="a">

		<div data-role="header">
			<table>
				<tr>
					<td>
						<!--  뒤로가기  --> <img src="./m/image/icon/back.png"
						onclick="window.location.href = './chattinglist.jsp'"> <font
						color="white">아이디</font>
					</td>
				</tr>
			</table>
		</div>

		<!--  
				
				$('#p태그 id').innerHTML=채팅내용 변수;
				
				 if(상대가 채팅을 쳤다면)
				 {
				 	<table width="100%">
					<tr >	
							 시간 
							<td align="right">
							<font size="1">오후 12:11</font>
							</td>
							<자신 
							<td   style="word-break:break-all">
								<p id="me" >ㅎㅇ</p>
							</td>				
					</tr>
				</table>
				}
				
				else if(내가 채팅을 쳤다면)
				{	
					<table width="100%">	
					<tr>
						
						  상대 
						<td style="word-break:break-all">
								<p id="someone">gd</p>			
						</td>
						<  시간 
						<td align="left">
							<font size="1">오후 12:11</font>
						</td>
					</tr>				
					</table>
				}
				
				 -->
		<div data-role="content">		
				

				<%
					if (chattingList == null || chattingList.size() == 0 ) {
				%>
						<center>채팅을 시작해보세요!</center>
				<%	
					} else if(chattingSection.equals("M")) {
						for ( int i = 0; i < chattingList.size(); i++ ) {
				%>
				<table width="100%">
					<tr >	
							<!--  시간 -->
							<td align="right">
							<font size="1"><!-- 시간 --></font>
							</td>
							<!--  자신 -->
							<td   style="word-break:break-all">
								<p id="me" ><!-- 채팅 --></p>
							</td>				
					</tr>
				</table>
				
				<%}
				}else if(chattingSection.equals("S")){
					for(int i=0; i< chattingList.size(); i++) 
				{%>
				
				<table width="100%">	
					<tr>
						
						<!--  상대 -->
						<td style="word-break:break-all">
								<p id="someone" ><!-- 채팅 --></p>			
						</td>
						<!--  시간 -->
						<td align="left">
							<font size="1"><!-- 시간 --></font>
						</td>
					</tr>				
				</table>
				
				<%}
				}
				%>
				
			</div>

		<div data-role="footer" data-position="fixed">
			<div data-role="navbar">
				<table width="100%">
					<tr>
						<td><input type="text" id="messasgeText"
							placeholder="메시지 쓰기..."></td>
						<td align="right"><img src="./m/image/icon/heart.png">
						</td>
					</tr>
				</table>
			</div>
		</div>

	</div>
</body>
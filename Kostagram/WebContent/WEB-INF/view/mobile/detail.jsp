<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<TITLE>Kostagram</TITLE>
		<script src="jquery-mobile/jquery-1.6.4.js"></script>
		<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
		<script src="js/common.js"></script>
		<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div id="loginform" data-role="page" data-theme="b" >
		
			<div data-role="header" data-theme="b">
				<h1>둘러보기</h1>
				<a href="#" data-rel="back"><</a>
			</div>
			
			<div>
				<table width="100%">
					<tr>
						<td width="60"><image src="./image/test.jpg" width="60" style="-webkit-border-radius: 100px; 
								border-radius: 100px;"/></td>
						<td align="left">이성경존나이뻐요</td>
						<td align="right"><a href="#"><image src="./image/follow.jpg" width="80"/></a></td>
					</tr>
				</table>
			</div>
			
			<div>
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td width="100%" colspan="2"><image src="./image/test.jpg" width="100%"/></td>
					</tr>
					<tr>
						<td align="left"><a href="#"><image src="./image/icon/heart.png" width="25"/></a>&nbsp;&nbsp;<a href="#"><image src="./image/icon/chat_bubble.png" width="25"/></a></td>
						<td align="right"><a href="#"><image src="./image/icon/warning.png" width="25"/></a></td>
					</tr>
				</table>
			</div>
			<div>
				<table>
					<tr>
			<%
				// 좋아요 부분, 좋아요가 5개 이하이면 아이디를, 초과되면 갯수를
				ArrayList likelist = new ArrayList();
				for(int i=0; i<5; i++)
				{
					likelist.add(i);
				}
				
				if(likelist.size()<6)
				{
			%>			
						<td>♥ 
					<%
						for(int i=0; i<likelist.size(); i++)
						{
					%>
						 <%= likelist.get(i) %>
					<%
						} 
					%> 
						</td>
			<%
				}
				else
				{
			%>
					<td>♥ <%= likelist.size()%>개</td>
			<%
				}
			%>
					</tr>
			<%
				// 댓글 시작
				// 임시로 댓글 리스트 추가
				ArrayList replylist = new ArrayList();
				for(int i=0; i<4; i++)
				{
					replylist.add(i);
				}
				
				if(replylist!=null && replylist.size()>=0)
				{
					for(int i=0; i<replylist.size(); i++)
					{
			%>
					<tr>
						<td><%= replylist.get(i) %></td>
					</tr>
			<%
					}
				}
				
				else{}
			%>
				</table>
			</div>
			
			<div>
				댓글 달기
			</div>
			
			<div data-role="footer" data-theme="b">
				<div data-role="navbar" class="ui-btn-active">
					<ul>
						<li><a href="#"><image src="./image/icon/house.png" width="20"/></a></li>
						<li><a href="./round"><image src="./image/icon/search.png" width="20"/></a></li>
						<li><a href="#"><image src="./image/icon/camera.png" width="20"/></a></li>
						<li><a href="#"><image src="./image/icon/info.png" width="20"/></a></li>
						<li><a href="./userpage"><image src="./image/icon/user.png" width="20"/></a></li>
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>
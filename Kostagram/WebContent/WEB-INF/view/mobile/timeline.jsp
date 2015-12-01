<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>

<%
	//ArrayList timeLineList =(ArrayList)request.getAttribute("timeLineList");
	ArrayList timeLineList = new ArrayList();
	for(int i=0; i<5; i++)
	{
		timeLineList.add(i);
	}
%>
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
		<div data-role="page" >
		
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
							Kostagram
							</span>
						</td>
					</tr>
				</table>
			</div>
			
		<% 
			if (timeLineList == null || timeLineList.size() == 0 )
			{ 
		%>
			<div>
				<center>팔로잉이 없습니다.</center>
			</div> 
		<%	
			}
			else
			{
				for (int i=0; i<timeLineList.size(); i++ )
				{ 
		%>
			<div>
				<table width="100%">
					<tr>
						<td width="60"><image src="./image/test.jpg" width="60" style="-webkit-border-radius: 100px; 
								border-radius: 100px;"/></td>
						<td align="left"><a href="#" style="text-decoration:none;
							text-shadow: 0px 0px 0px;
							color: #004879;
							font-weight: normal;">이성경 존나이뻐요</a></td>
						<td align="right" style="text-decoration:none;
							text-shadow: 0px 0px 0px;
							color: #004879;
							font-weight: normal;">올린시간</td>
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
				for(int j=0; j<5; j++)
				{
					likelist.add(j);
				}
				
				if(likelist.size()<6)
				{
			%>			
						<td><a href="#" style="text-decoration:none;
						text-shadow: 0px 0px 0px;
						color: #004879;
						font-weight: normal;">♥ 
					<%
						for(int k=0; k<likelist.size(); k++)
						{
					%>
						 <%= likelist.get(k) %>
					<%
						} 
					%> 
						</a></td>
			<%
				}
				else
				{
			%>
					<td><a href="#" style="text-decoration:none;
					text-shadow: 0px 0px 0px;
					color: #004879;
					font-weight: normal;">♥ <%= likelist.size()%>개</a></td>
			<%
				}
			%>
					</tr>
					
					<tr>
						<td><a href="#" style="text-decoration:none;
							text-shadow: 0px 0px 0px;
							color: #004879;
							font-weight: normal;">아이디</a>
							게시글 내용
							</td>
						</tr>
					<tr>
			<%
				// 댓글 시작
				// 임시로 댓글 리스트 추가
				ArrayList replylist = new ArrayList();
				for(int n=0; n<4; n++)
				{
					replylist.add(n);
				}
				
				if(replylist!=null && replylist.size()>=0)
				{
					if(likelist.size()>3)
					{
			%>
					<tr>
						<td><a href="#" style="text-decoration:none;
						text-shadow: 0px 0px 0px;
						color:#353535;
						font-weight:normal;">댓글 더보기</a></td>
					</tr>
			<%
					}
					for(int m=0; m<4; m++)
					{
			%>
					<tr>
						<td><a href="#" style="text-decoration:none;
						text-shadow: 0px 0px 0px;
						color: #004879;
						font-weight: normal;"><%= replylist.get(m) %></a> 댓글</td>
					</tr>
			<%
					}
				}
				
				else{}
			%>
				</table>
			</div>
			
			<div>
				<a href="#" style="text-decoration:none;
				text-shadow: 0px 0px 0px;
				color:#353535;
				font-weight:normal;">댓글 달기</a>
			</div>
			<br>
			<%
				}
			}
			%>			
	
			
			<div data-role="footer" data-theme="b">
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


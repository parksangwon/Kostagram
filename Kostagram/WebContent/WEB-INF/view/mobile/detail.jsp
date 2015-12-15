<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>Kostagram</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0,user-scalable=no" />
<script src="jquery-mobile/jquery-1.6.4.js"></script>
<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
<script src="js/common.js"></script>
<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet"
	type="text/css" />

<body>
	<div id="detail" data-role="page" data-theme="a">

		<div data-role="header">
				<table>
					<tr>
						<td>
							<a href="#" data-rel="back"><image src="./image/icon/back.png" width="20" style="padding-left:10px;"/></a>
							<span style="height:35px;
							font-size:20px;
							color:#ffffff;
							line-height:35px;
							text-align:left;
							background-color:transparent;
							border:0px;
							text-shadow: 0px 0px 0px black;
							padding-left:5px;">
							확대 보기
							</span>
						</td>
					</tr>
				</table>
			</div>

		<div>
			<table width="100%">
				<tr>
					<td width="60"><image src="./image/test.jpg" width="60"
							style="-webkit-border-radius: 100px; 
								border-radius: 100px;" /></td>
					<td align="left"><a href="#"
						style="text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;">닉네임</a></td>
					<td align="right"><a href="#"><image
								src="./image/follow.jpg" width="80" /></a></td>
				</tr>
			</table>
		</div>

		<div>
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="100%" colspan="2"><image src="./image/test.jpg"
							width="100%" /></td>
				</tr>
				<tr>
					<td align="left"><a href="#"><image
								src="./image/icon/heart.png" width="25" /></a>&nbsp;&nbsp;<a
						href="#"><image src="./image/icon/chat_bubble.png" width="25" /></a></td>
					<td align="right"><a href="#"><image
								src="./image/icon/warning.png" width="25" /></a></td>
				</tr>
			</table>
		</div>
		<div>
			<table>
				<tr>
					<%
						// 좋아요 부분, 좋아요가 5개 이하이면 아이디를, 초과되면 갯수를
						ArrayList likelist = new ArrayList();
						for (int i = 0; i < 5; i++) {
							likelist.add(i);
						}

						if (likelist.size() < 6) {
					%>
					<td><a href="#"
						style="text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;">♥
							<%
						for (int i = 0; i < likelist.size(); i++) {
					%> <%=likelist.get(i)%> <%
 	}
 %>
					</a></td>
					<%
						} else {
					%>
					<td><a href="#"
						style="text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;">♥
							<%=likelist.size()%>개
					</a></td>
					<%
						}
					%>
				</tr>

				<tr>
					<td><a href="#"
						style="text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;">아이디</a>
						게시글 내용</td>
				</tr>
				<tr>
					<%
						// 댓글 시작
						// 임시로 댓글 리스트 추가
						ArrayList replylist = new ArrayList();
						for (int i = 0; i < 4; i++) {
							replylist.add(i);
						}

						if (replylist != null && replylist.size() >= 0) {
							if (likelist.size() > 3) {
					%>
				
				<tr>
					<td><a href="#"
						style="text-decoration: none; text-shadow: 0px 0px 0px; color: #353535; font-weight: normal;">댓글
							더보기</a></td>
				</tr>
				<%
					}
						for (int i = 0; i < 4; i++) {
				%>
				<tr>
					<td><a href="#"
						style="text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;"><%=replylist.get(i)%></a>
						댓글</td>
				</tr>
				<%
					}
					}

					else {
					}
				%>
			</table>
		</div>

		<div>
			<a href="#"
				style="text-decoration: none; text-shadow: 0px 0px 0px; color: #353535; font-weight: normal;">댓글
				달기</a>
		</div>

		<div data-role="footer" data-position="fixed">
			<div data-role="navbar" class="ui-btn-active">
				<ul>
					<li><a href="/Kostagram/m/"><img src="/Kostagram/m/image/icon/house.png"
							width="20" /></a></li>
					<li><a href="/Kostagram/m/round"><img src="/Kostagram/m/image/icon/search.png"
							width="20" /></a></li>
					<li><a href="#"><img src="/Kostagram/m/image/icon/camera.png"
							width="20" /></a></li>
					<li><a href="/Kostagram/m/mynews"><img src="/Kostagram/m/image/icon/info.png"
							width="20" /></a></li>
					<li><a href='/Kostagram/m/<%= session.getAttribute("nickname")%>'><img src="/Kostagram/m/image/icon/user.png"
							width="20" /></a></li>
				</ul>
			</div>
		</div>

	</div>
</body>
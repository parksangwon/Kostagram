<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0,user-scalable=no" />
<TITLE>Kostagram</TITLE>
<script src="jquery-mobile/jquery-1.6.4.js"></script>
<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
<script src="js/common.js"></script>
<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet"
	type="text/css" />

<body>
	<div id="loginform" data-role="page" data-theme="b">

		<div data-role="header" data-theme="b">
			<table onclick="$.mobile.changePage('search_home')">
				<tr>
					<td><image src="./image/icon/search.png" width="20"
							style="padding-left:10px;" /></td>
					<td><span
						style="height: 35px; font-size: 15px; color: #ffffff; line-height: 35px; text-align: left; background-color: transparent; border: 0px; text-shadow: 0px 0px 0px black; padding-left: 5px;">
							검색 </span></td>
				</tr>
			</table>
		</div>

		<div>
			<center>
				<table width="100%" align="center">
					<tr>
						<td align="left">&nbsp;&nbsp;<span
							style="font-size: 11pt; font-weight: bolder;">사람찾아보기</span><br>
							&nbsp;&nbsp;<span style="font-size: 7pt;">새로 팔로우할 사람을
								찾아보세요</span>
						</td>
						<td align="right">
							<%
							    // 리스트 받아오기 전, 임시로 값 준 것
							    // 이 부분은 리스트가 null 값인 경우가 없어서 null 체크안함
							    ArrayList profilelist = new ArrayList();
							    for (int i = 0; i < 4; i++) {
									profilelist.add(i);
							    }

							    for (int i = 0; i < profilelist.size(); i++) {
							%> <a href="./detail"><image src="./image/test.jpg"
									width="45"
									style="-webkit-border-radius: 100px; 
								border-radius: 100px;" /></a>
							<%
							    }
							%>
						</td>
					</tr>
				</table>
			</center>
		</div>
		<%
		    int count = 0;
		    // 리스트 받아오기 전, 임시로 값 준 것
		    ArrayList list = new ArrayList();
		    for (int i = 0; i < 20; i++) {
				list.add(i);
		    }
		%>
		<div data-rol="content">
			<center>
				<table cellspacing="0" cellpadding="0" width="100%">
					<tr>
						<%
						    if (list != null && list.size() >= 0) {
								for (int i = 0; i < list.size(); i++) {
						%>
						<td><a href="./detail"><image src="./image/test.jpg"
									width="100%" /></a></td>
						<%
						    if (count == 2) {
									count = 0;
						%>
					</tr>

					<tr>
						<td><a href="./detail"><image src="./image/test.jpg"
									width="100%" /></a></td>
						<%
						    }
								    count++;
								}
						    } else {
						    }
						%>
					
				</table>
			</center>
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
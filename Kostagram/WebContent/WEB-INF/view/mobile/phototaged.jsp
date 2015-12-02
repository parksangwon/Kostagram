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
		<div data-role="page" data-theme="b" >
			
			<div data-role="header" data-theme="b">
				<table onclick="location.href='search'">
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
							회원님이 태그된 사진
							</span>
						</td>
					</tr>
				</table>
			</div>
			
			<%
				int count=0;
				// 리스트 받아오기 전, 임시로 값 준 것
				ArrayList list = new ArrayList();
				for(int i=0; i<20; i++)
				{
					list.add(i);
				}
			%>
			<div data-rol="content">
				<center>
					<table cellspacing="0" cellpadding="0"  width="100%">
						<tr>
						<%
							if(list!=null && list.size()>=0)
							{
								for(int i=0; i<list.size(); i++)
								{
						%>
									<td><a href="./detail"><image src="./image/test.jpg" width="100%"/></a></td>
						<%
									if(count==2)
									{
										count=0;
						%>
								</tr>
						
								<tr>
								<td><a href="./detail"><image src="./image/test.jpg" width="100%"/></a></td>
						<%
									}
									count++;
								}
							}
							else {}
						%>
					</table>
				</center>
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
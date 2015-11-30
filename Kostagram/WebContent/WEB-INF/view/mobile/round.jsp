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
		<style type="text/css"> 
		.profileImg { 
			-webkit-border-radius: 100px; 
			border-radius: 100px; 
		} 
		</style> 
	</head>
	<body>
		<div id="loginform" data-role="page" data-theme="b" >
		
			<div data-role="header" data-theme="b">
				<table>
					<tr>
						<td>
							<image src="./image/icon/search.png" width="20"/>
						</td>
						<td>
							<input type="text" placeholder="검색" style="width:300px;
							height:35px;
							font-size:15px;
							line-height:35px;
							text-align:left;
							background-color:transparent;
							border:0px;
							-webkit-border-radius:0px; 
							border-radius:0px;">
						</td>
					</tr>
				</table>
			</div>
			
			<div>
				<center>
					<table width="100%" align="center">
						<tr>
							<td width="50%" align="left">
								<span>사람찾아보기</span><br>
								<span>새로 팔로우할 사람을 찾아보세요</span>
							</td>
							<td width="50%" align="right">
								<image src="./image/test.jpg" width="50" class="profileImg"/>
								<image src="./image/test.jpg" width="50" class="profileImg"/>
								<image src="./image/test.jpg" width="50" class="profileImg"/>
								<image src="./image/test.jpg" width="50" class="profileImg"/>
							</td>
						</tr>
					</table>
				</center>
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
			
			<div data-role="footer" data-theme="b">
				<div data-role="navbar" class="ui-btn-active">
					<ul>
						<li><a data-role="button" data-icon="home" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="search" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="star" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="star" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="info" data-iconpos="notext"></a></li>
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
	int count=0;
	//ArrayList likeNoticeList =(ArrayList)request.getAttribute("likeNoticeList"); ;
%>

<%
	ArrayList likeNoticeList = new ArrayList();
	for(int i=0; i<11; i++)
	{
		likeNoticeList.add(i);
	}
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
			
		
		<style>
			.ui-bar-f {
			    color:#004879;
			    background-color: #004879;
			}
		</style>
							
	</head> 
		
<body>
	<div data-role="page" data-theme="d">
			
			
			<div data-role="header" data-theme="b">
				<table>
					<tr>
						<td>
							<!--  뒤로가기  --><img src="./m/image/icon/back.png" width="20" onclick="#" >
							<span style="height:35px;
							font-size:15px;
							color:#ffffff;
							line-height:35px;
							text-align:left;
							background-color:transparent;
							border:0px;
							text-shadow: 0px 0px 0px black;
							padding-left:5px;">
							좋아요
							</span>			
						</td>
					</tr>
				</table>
			</div>
			
			<div data-rol="content">
				<center>		
					<%
					if (likeNoticeList == null || likeNoticeList.size() == 0 ) {
					%>
		
						좋아요 한 글이 없습니다.
				
					
					<%
					}else{
					%>
						<table cellspacing="0" cellpadding="0"  width="100%">
							<tr>
					<% 
							for(int i=0; i<likeNoticeList.size(); i++)
							{
					%>
								<td><a href="./detail"><image src="./m/image/testImage3.jpg" width="100%"/></a></td>
							
								
						
						<%	count++;
							if(count==3 )
							{
								count=0;
						%>
							</tr>
						
						<% 	
							}
							}
							
							}
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
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0,user-scalable=no" />
<TITLE>Kostagram</TITLE>

<script src="jquery-mobile/jquery-1.6.4.js"></script>
<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
<script src="js/common.js"></script>
<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet"
	type="text/css" />
<%
	List<HashMap> commentList = (List<HashMap>)request.getAttribute("commentList");
%>
	<div id="option" data-role="page" data-theme="a">

		<div data-role="header">
			<table>
				<tr>
					<td><a href="#" data-rel="back"><image
								src="./image/icon/back.png" width="20"
								style="padding-left:10px;" /></a> <span
						style="height: 35px; font-size: 20px; color: #ffffff; line-height: 35px; text-align: left; background-color: transparent; border: 0px; text-shadow: 0px 0px 0px black; padding-left: 5px;">
							댓글 </span></td>
				</tr>
			</table>
		</div>

		<div data-rol="content">
			<table border="0">
		<%
			if (commentList != null && commentList.size() > 0)
			{
				for ( HashMap comment : commentList ) 
					{
						String content = (String)comment.get("CONTENT");
						String nickname = (String)comment.get("NICKNAME");
						String email = (String)comment.get("EMAIL");
						String profile = (String)comment.get("PROFILE_IMG");
		%>
				<tr>
		<%
					if(profile == null)
					{
		%>
					<td ><img src="/Kostagram/personalImg/profile.jpg" width="55" style="-webkit-border-radius: 100px; border-radius: 100px;" /></td>
		<%
					}
					else
					{
		%>
					<td ><img src="/Kostagram/personalImg/<%=email %>/profile.jpg" width="55" style="-webkit-border-radius: 100px; border-radius: 100px;"></td>
		<%
					}
		%>
					<td> <a><%=nickname %></a></td>
					<td width="100%"><%= content %></td>
				</tr>
		<%
					}
			}
		%>
				
			</table>
		</div>
		
		<div data-role="footer" data-position="fixed">
			<table border="0">
				<tr>
					<td width="99%"><input type="text" placeholder="댓글 달기..." /></td>
					<td><img src="./image/icon/pencil.png"></td>
				</tr>
			</table>
			
		</div>
	</div>
</body>
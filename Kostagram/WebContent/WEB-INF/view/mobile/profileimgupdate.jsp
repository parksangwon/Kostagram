<%@page import="com.kostagram.service.beans.PhotoInfoVO"%>
<%@page import="com.kostagram.service.beans.ActivityVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String email = (String)session.getAttribute("email");
	List<PhotoInfoVO> myPhotoList = (List<PhotoInfoVO>)request.getAttribute("myPhotoList");
%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0,user-scalable=no" />
<TITLE>Kostagram</TITLE>
<script src="jquery-mobile/jquery-1.6.4.js"></script>
<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
<script src="js/common.js"></script>
<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet"
	type="text/css" /><script src="jquery-mobile/jquery-1.6.4.js"></script>
<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
<script src="js/common.js"></script>
<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet"
	type="text/css" />

<body>
	<div id=profileimgupdate data-role="page" data-theme="a">

		<div data-role="header">
			<table onclick="$.mobile.changePage('search_people')">
				<tr>
					<td><image src="./image/icon/search.png" width="20"
							style="padding-left:10px;" /></td>
					<td><span
						style="height: 35px; font-size: 15px; color: #ffffff; line-height: 35px; text-align: left; background-color: transparent; border: 0px; text-shadow: 0px 0px 0px black; padding-left: 5px;">
							검색 </span></td>
				</tr>
			</table>
		</div>

		<div data-rol="content" align="center">
			
			<div id="photoArea">
				<div id='photoList' align="center">
					<ul class='myPhotoListByGrid'>
					<%
						for (int i = 0; i < myPhotoList.size(); i++) {
							PhotoInfoVO photo = myPhotoList.get(i);
							String seq_photo = photo.getSeq_photo();
					%>
						<li>
							<a href="./profileimgupdateaction?pid=<%=seq_photo%>"><img src="../personalImg/<%=email%>/<%=seq_photo%>.jpg"/></a></li>
					<%	}
					%>
					</ul>
				</div>
			</div>
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
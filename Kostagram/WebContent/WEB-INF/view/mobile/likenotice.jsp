<%@page import="com.kostagram.service.beans.ActivityVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<HashMap> mylikeList = (List<HashMap>)request.getAttribute("mylikeList");
%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0,user-scalable=no" />
<TITLE>Kostagram</TITLE>
<script src="jquery-mobile/jquery-1.6.4.js"></script>
<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
<script src="js/common.js"></script>
<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet"
	type="text/css" />

<body>
	<div id="likenotice" data-role="page" data-theme="a">

		<div data-role="header">
			<table>
				<tr>
					<td><a href="#" data-rel="back"><image
								src="./image/icon/back.png" width="20"
								style="padding-left:10px;" /></a> <span
						style="height: 35px; font-size: 20px; color: #ffffff; line-height: 35px; text-align: left; background-color: transparent; border: 0px; text-shadow: 0px 0px 0px black; padding-left: 5px;">
							내가 좋아한 게시물 </span></td>
				</tr>
			</table>
		</div>
		
		<div data-rol="content" align="center">
			<div id="photoArea">
				<div id='photoList'>
					<ul class='myPhotoListByGrid'>
						<%
							// 활동 리스트
							if (mylikeList != null && mylikeList.size() > 0) {
								for ( HashMap like : mylikeList ) {
									String seq_photo = (String)like.get("SEQ_PHOTO");
									String to_email = (String)like.get("TO_EMAIL");
									String from_email = (String)like.get("FROM_EMAIL");
						%>
						<li>
							<a href="./detail?pid=<%= seq_photo%>"><img src="../personalImg/<%= to_email%>/<%= seq_photo%>.jpg"/></a>
						</li>
						<%
								}
						%>
					</ul>
						<%
							}
						%>
				</div>
			</div>
		</div>

		<div data-role="footer" data-theme="a" data-position="fixed">
			<div data-role="navbar" class="ui-btn-active">
				<ul>
					<li><a href="/Kostagram/m/"><img
							src="/Kostagram/m/image/icon/house.png" width="20" /></a></li>
					<li><a href="/Kostagram/m/round"><img
							src="/Kostagram/m/image/icon/search.png" width="20" /></a></li>
					<li><a href="/Kostagram/m/write"><img
							src="/Kostagram/m/image/icon/camera.png" width="20" /></a></li>
					<li><a href="/Kostagram/m/mynews"><img
							src="/Kostagram/m/image/icon/info.png" width="20" /></a></li>
					<li><a href="/Kostagram/m/userpage"><img
							src="/Kostagram/m/image/icon/user.png" width="20" /></a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
<%@page import="com.kostagram.service.beans.ActivityVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<HashMap> roundList = (List<HashMap>)request.getAttribute("roundList");
	List<HashMap> round_profileList = (List<HashMap>)request.getAttribute("round_profileList");
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
	<div id="round" data-role="page" data-theme="a">

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
			<div>
				<table width="100%">
					<%
						if (round_profileList != null && round_profileList.size() > 0) {
					%>
					<td align="left">&nbsp;&nbsp;<span
						style="font-size: 11pt; font-weight: bolder;">사람찾아보기</span><br>
						&nbsp;&nbsp;<span style="font-size: 7pt;">새로 팔로우할 사람을 찾아보세요</span></td>
					<td align="right">
						<%
							int count=0;
							for (HashMap round_profile : round_profileList) {
								if(count==4){
									break;
								}
								String email = (String) round_profile.get("EMAIL");
								String profile = (String) round_profile.get("PROFILE_IMG");
								String nick_name = (String) round_profile.get("NICKNANE");
								System.out.println(email);
								count++;
								if(profile!=null && profile!="")
								{
						%>
									<a href="/Kostagram/m/<%= nick_name%>"><img
									src="/Kostagram/personalImg/<%= email%>/profile.jpg" width="40"
									style="-webkit-border-radius: 100px; border-radius: 100px;" /></a>
						<%
								}
								else {
						%>
									<a href="/Kostagram/m/<%= nick_name%>"><img
									src="/Kostagram/personalImg/profile.jpg" width="40"
									style="-webkit-border-radius: 100px; border-radius: 100px;" /></a> 
						<%
				 				}
					 		}
						}
					 %>
					</td>
				</table>
			</div>

			<div id="photoArea">
				<div id='photoList'>
					<ul class='myPhotoListByGrid'>
						<%
							// 활동 리스트
							if (roundList != null && roundList.size() > 0) {
								for (HashMap round : roundList) {
									String seq_photo = (String) round.get("SEQ_PHOTO");
									String email = (String) round.get("EMAIL");
									String profile = (String) round.get("PROFILE");
						%>
						<li><a href="./detail?pid=<%=seq_photo%>"><img
								src="../personalImg/<%=email%>/<%=seq_photo%>.jpg"/></a></li>
						<%
								}
							} else {
						%>
						<li>팔로우를 추가해 주세요.</li>
						<%
							}
						%>
					</ul>
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
					<li><a href="#"><img
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
<%@page import="java.util.ArrayList"%>
<%@page import="com.kostagram.service.beans.UserInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	UserInfoVO userInfo = (UserInfoVO)request.getAttribute("userinfo");
	
	String email = (String)userInfo.getEmail();
	String nickname = (String)userInfo.getNickname();
	String name = (String)userInfo.getName();
	String mobile = (String)userInfo.getMobile();
	String message = (String)userInfo.getMessage();
	String gender = (String)userInfo.getGender();
	if (mobile == null)
	{
		mobile="";
	}
	if (message == null)
	{
		message="";
	}
	if(gender == null)
	{
		gender = "x";
	}
%>
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
	<div id="profileupdate" data-theme="a" data-role="page">
		<form method="POST" accept-charset="utf-8">
			<div data-role="header">
				<table width="100%">
					<tr>
						<td width="95%"><a href="userpage" data-rel="back"><image
									src="./image/icon/back.png" width="20"
									style="padding-left:10px;" /></a> <span
							style="height: 35px; font-size: 20px; color: #ffffff; line-height: 35px; text-align: left; background-color: transparent; border: 0px; text-shadow: 0px 0px 0px black; padding-left: 5px;">
								프로필 수정 </span></td>

					</tr>
				</table>
			</div>

			<div data-rol="content" align="center">
				<div>
					<table border="0" width="80%">
						<Tr>
							<td height="30" colspan="2"></td>
						</Tr>
						<tr>
							<td width="18%" height="20%"><img src="image/icon/user.png"></td>
							<td><input type="text" id="name" name="name"
								placeholder="name" value="<%= name %>"></td>
						</tr>
						<tr>
							<td width="18%"><img src="image/icon/stamp.png"></td>
							<td><inpyt type="label" value="닉네임" /><input type="text"
								id="nickname2" name="nickname2" placeholder="nickname"
								value="<%= nickname %>"></td>
						</tr>
						<tr>
							<td width="18%"><img src="image/icon/chat_bubble.png">
							</td>
							<td><input type="text" id="message" name="message"
								placeholder="상태메세지" value="<%= message %>"></td>
						</tr>
					</table>
				</div>

				<div>
					<table width="80%" border="0">
						<tr>
							<td width="18%"><img src="image/icon/address_book.png"></td>
							<td><input type="text" id="email" name="email"
								placeholder="email-id" value="<%= email %>"></td>
						</tr>
						<tr>
							<td width="18%"><img
								src="image/icon/proper-fucking-phone.png"></td>
							<td><input type="text" id="mobile" name="mobile"
								placeholder="( - )를 제외한 숫자만 입력해주십시오." value="<%= mobile %>"></td>
						</tr>
						<tr>
							<td width="18%"><img src="image/icon/heart.png"></td>
							<td><select id="gender" name="gender">
									<option value="x" <% if(gender.equals("x")){ %> selected <%}%>>선택안함</option>
									<option value="m" <% if(gender.equals("m")){ %> selected <%}%>>남성</option>
									<option value="w" <% if(gender.equals("w")){ %> selected <%}%>>여성</option>
							</select></td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" id="submit"
								name="submit" value="수정" size="10" /></td>
						</tr>
						<Tr>
							<Td colspan="2"><center>
									<font color="red"><p id="resultMessage"></p></font>
								</center></Td>
						</Tr>
					</table>
				</div>
			</div>
		</form>
	</div>
</body>
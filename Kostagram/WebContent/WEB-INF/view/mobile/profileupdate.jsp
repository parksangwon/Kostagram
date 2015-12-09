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
	<div>
		<div data-role="header" data-theme="b">
			<table width="100%">
				<tr>
					<td width="95%"><a href="#" data-rel="back"><image
								src="./image/icon/back.png" width="20"
								style="padding-left:10px;" /></a> <span
						style="height: 35px; font-size: 20px; color: #ffffff; line-height: 35px; text-align: left; background-color: transparent; border: 0px; text-shadow: 0px 0px 0px black; padding-left: 5px;">
							프로필 수정 </span>
					</td>
					<td width="5%" align="right">
						<a href="#" data-rel="back"><image
								src="./image/icon/tick.png" width="20"
								style="padding-left:10px;" /></a>
					</td>
				</tr>
			</table>
		</div>
		<div data-rol="content">
			<ul data-insert="true">
				<li>
					<div>
						<table border="0" width="90%">
							<tr>
								<td width="10%"><img src="image/icon/user.png"></td>
								<td><input type="text" id="name" placeholder="name">
								</td>
							</tr>
							<tr>
								<td width="10%"><img src="image/icon/stamp.png"></td>
								<td><input type="text" id="nickname" placeholder="nickname">
								</td>
							</tr>
							<tr>
								<td width="10%"><img src="image/icon/chat_bubble.png">
								</td>
								<td><input type="text" id="profilemassage"
									placeholder="상태메세지"></td>
							</tr>
						</table>
					</div>
				</li>
			</ul>
			<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개인 정보</h3>
			<hr>
			<ul data-insert="true">
				<li>
					<div>
						<table width="90%">
							<tr>
								<td width="10%"><img src="image/icon/pencil.png"></td>
								<td><input type="text" id="email" placeholder="email-id">
								</td>
							</tr>
							<tr>
								<td width="10%"><img src="image/icon/address_book.png">
								</td>
								<td><input type="text" id="email"
									placeholder="phone number"></td>
							</tr>
							<tr>
								<td width="10%"><img src="image/icon/heart.png"></td>
								<td><select id="sex">
										<option value="0">선택 안 함</option>
										<option value="m">남성</option>
										<option value="w">여성</option>
								</select></td>
							</tr>
						</table>
					</div>
				</li>
			</ul>
			<hr>
		</div>
	</div>
</body>
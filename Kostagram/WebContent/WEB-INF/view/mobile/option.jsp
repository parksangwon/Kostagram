<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0,user-scalable=no" />
		<TITLE>Kostagram</TITLE>
		
		<script src="jquery-mobile/jquery-1.6.4.js"></script>
		<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
		<script src="js/common.js"></script>
		<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet" type="text/css" />
		
	</head>
	<body>
		<div data-role="page">
		
			<div data-role="header" data-theme="b">
				<table>
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
							옵션
							</span>
						</td>
					</tr>
				</table>
			</div>
			
			<div data-rol="content" >
				<ul data-insert="true">
					<div>
						<table width="90%" border="0">
							<tr>
								<Td>
									<h4><a href="./profileupdate">프로필 수정</a></h4>
								</Td>
							</tr>
							<tr>
								<Td>
									<h4><a href="./findphonenumber">연락처로 친구 찾기</a></h4>
								</Td>
							</tr>
							<tr>
								<Td>
									<h4>비밀번호 변경</h4>
								</Td>
							</tr>
							<tr>
								<Td>
									<h4>회원님이 좋아한 게시물</h4><hr>
								</Td>
							</tr>
							<tr>
								<Td>
									<input type="button" onclick="location.href='./logout'" value="로그아웃" data-inline="true"/>
								</Td>
							</tr>
						</table>
					</div>
				</ul>
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
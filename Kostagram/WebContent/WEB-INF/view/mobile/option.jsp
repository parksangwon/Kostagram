<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0,user-scalable=no" />
		<TITLE>Kostagram</TITLE>
		
		<script src="jquery-mobile/jquery-1.6.4.js"></script>
		<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
		<script src="js/common.js"></script>
		<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet" type="text/css" />
		
	</head>
	<body>
		<div>
			<div data-role="header" data-theme="b">
				<h2>옵션</h2> <a data-icon="check" class="ui-btn-right" data-iconpos="notext"></a>
				<a href="./userpage" data-icon="delete" class="ui-btn-left" data-iconpos="notext"></a>
			</div>
			<div data-rol="content" >
				<ul data-insert="true">
					<div>
						<table width="90%" border="0">
							<Tr>
								<Td>
									<h3>설정</h3><hr>
								</Td>
							</Tr>
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
									<h4>로그아웃</h4><hr>
								</Td>
							</tr>
						</table>
					</div>
				</ul>
			</div>
			
			<div data-role="footer" data-theme="b">
				<div data-role="navbar" class="ui-btn-active">
					<ul>
						<li><a data-role="button" data-icon="home" data-iconpos="notext"></a></li>
						<li><a href="./round" data-role="button" data-icon="search" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="star" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="star" data-iconpos="notext"></a></li>
						<li><a href="./userpage" data-role="button" data-icon="info" data-iconpos="notext"></a></li>
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>
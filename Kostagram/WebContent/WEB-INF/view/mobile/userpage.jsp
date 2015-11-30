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
		
	</head>
	<body>
		<div id="loginform" data-role="page" data-theme="e">
			<div data-role="header" data-theme="b">
				<h2>Park.Sang.Won</h2> <a href="./option" data-icon="grid" class="ui-btn-right" data-iconpos="notext"></a>
			</div>
			
			<div data-rol="content" >
				<ul data-insert="true">
					<div>
						<table border="0" width="100%">
							<tr>
								<td rowspan="2" width="30%">
									<image src="image/park.jpg"/>
								</td>
								<td align="center">
									0<br>
									게시물
								</td>
								<td align="center">
									30<br>
									팔로잉
								</td>
								<td align="center">
									30<br>
									팔로워
								</td>
							</tr>
							<tr>
								<td align="center" colspan="3">
									<a href="./profileupdate">프로필 수정</a>
								</td>
							</tr>
						</table>
					</div>
				</ul>	
				<div>
					<ul data-insert="true">박상원</ul>
					
				</div>
				<div data-role="navbar">
					<ul>
						<li><a data-icon="grid">격자형 리스트</a></li>
						<li><a data-icon="grid">상세보기</a></li>
						<li><a data-icon="grid">포토맵</a></li>
						<li><a data-icon="grid">회원님이 나온사진</a></li>
					</ul>
				</div>
				<div>
					<ul align="center" data-insert="true">소중한 순간을 포착하여 공유해보세요</ul>
					
				</div>
			</div>
			
			<div data-role="footer" data-theme="b">
				<div data-role="navbar" class="ui-btn-active">
					<ul>
						<li><a data-role="button" data-icon="home" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="search" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="star" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="star" data-iconpos="notext"></a></li>
						<li><a href="./userpage" data-role="button" data-icon="info" data-iconpos="notext"></a></li>
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>
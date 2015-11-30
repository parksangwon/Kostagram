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
		
			<script type="text/javascript" >
				function numbersearch() 
				{
					$.mobile.changePage("./numbersearch");
				}
			</script>		
		
			<center><h1>친구 찾기</h1></center>
	
			<div data-role="content">
				<form id="joinForm" method="post" action="#" align="center">
									팔로우할 연락처 찾기
									누가 Kostagram을 사용 중인지<br>
									 확인하고 원하는 친구를 선택하여 팔로우해보세요.
					<div data-role="fieldcontain">
						<center>
							<input type="button" value="연락처 검색" data-inline="true" onclick="numbersearch()"/><br><br>
							회원 가입시 입력하셨던 전화번호로 서버에 저장됩니다.<br>
						</center>
					</div>
				</form>
			</div>
			
			<div data-role="footer" data-theme="b">
				<center><a href="#"><h4>건너뛰기</h4></a></center>
			</div>
		</div>	
	</body>
</html>
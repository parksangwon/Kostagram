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
		
			<center><h1>ģ�� ã��</h1></center>
	
			<div data-role="content">
				<form id="joinForm" method="post" action="#" align="center">
									�ȷο��� ����ó ã��
									���� Kostagram�� ��� ������<br>
									 Ȯ���ϰ� ���ϴ� ģ���� �����Ͽ� �ȷο��غ�����.
					<div data-role="fieldcontain">
						<center>
							<input type="button" value="����ó �˻�" data-inline="true" onclick="numbersearch()"/><br><br>
							ȸ�� ���Խ� �Է��ϼ̴� ��ȭ��ȣ�� ������ ����˴ϴ�.<br>
						</center>
					</div>
				</form>
			</div>
			
			<div data-role="footer" data-theme="b">
				<center><a href="#"><h4>�ǳʶٱ�</h4></a></center>
			</div>
		</div>	
	</body>
</html>
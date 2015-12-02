<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<TITLE>Kostagram</TITLE>
		
		<script src="jquery-mobile/jquery-1.6.4.js"></script>
		<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
		<script src="js/common.js"></script>
		<script src="js/emailcheck.js"></script>
		<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet" type="text/css" />
	
	</head>
	<body>
		<div id="loginform" data-role="page" data-theme="e">
			
			<script type="text/javascript">
				function login() 
				{
					var idInput = $('input:text[name=id]');
					var idValue = trim(idInput.val());
					if(idValue === "")
					{
						window.alert("E-mail ID�� �Է��ϼ���.");
						idInput.select();
						return false;
					}
					else if(idValue !== "")
					{
						if(isEmailChar(idValue))
						{
							window.alert("E-mail ID ���� ���� �ҹ��ڿ� ����, '@', '.' ���� �Է°����մϴ�.");
							idInput.select();
							return false;
						}
						if(idValue.indexOf("@") == -1 || idValue.indexOf(".") == -1 || idValue.indexOf(".")<idValue.indexOf("@") || isNum(idValue.charAt(0)))
						{
							window.alert("E-mail ID�� Ȯ�� �ϼ���.");
							idInput.select();
							return false;
						}
					}
					
					var pw = $('input:password[name=pw]');
					if(pw.val() == "")
					{
						window.alert("��й�ȣ�� �ݵ�� �Է��ؾ� �մϴ�.");
						pw.focus();
						return false;
					}
					if(pw.val().length < 4 || pw.val().length > 20)
					{
						window.alert("��й�ȣ�� 4�� �̻� 20�� ���� �Դϴ�.");
						pw.select();
						return false;
					}
				}
			</script>
			
			<center><h1>Kostagram</h1></center>
			
			<div data-role="content">
				<form id="loginForm" method="post" action="#" align="center">
					<div data-role="fieldcontain" align="center">
						<input id="id" type="text" name="id" placeholder="���̵�"/> 
					</div>					
					<div data-role="fieldcontain" align="center">
						<input id="pw" type="password" name="pw" placeholder="��й�ȣ"/> 
					</div>					
					<div data-role="fieldcontain">
						<center>
							<input type="button" value="�α���" data-inline="true" onclick="login()"/>
						</center>
					</div>
				</form>
			</div>
			
			<div data-role="footer" data-theme="b">
				<center><a href="./emailcheck"><h4>������ �����Ű���? �����ϱ�.</h4></a></center>
			</div>
		</div>	
	</body>
</html>
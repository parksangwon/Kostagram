<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0,user-scalable=no"/>
		<TITLE>Kostagram</TITLE>
		
		<script src="jquery-mobile/jquery-1.6.4.js"></script>
		<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
		<script src="js/common.js"></script>
		<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet" type="text/css" />
	
	</head>
	<body>
		<div id="loginform" data-role="page" data-theme="e">
			
			<script type="text/javascript">
				function login() 
				{
					var idInput = $('input:text[name=nickname]');
					var idValue = trim(idInput.val());
					var message = $('#check')
					if(idValue === "")
					{
						message.text("E-mail ID�� �Է��ϼ���.");
						idInput.select();
						return false;
					}

					
					var pw = $('input:password[name=pass]');
					if(pw.val() == "")
					{
						message.text("��й�ȣ�� �ݵ�� �Է��ؾ� �մϴ�.");
						pw.focus();
						return false;
					}
					if(pw.val().length < 4 || pw.val().length > 20)
					{
						message.text("��й�ȣ�� 4�� �̻� 20�� ���� �Դϴ�.");
						pw.select();
						return false;
					}
					
					$.ajax({
		                type:'POST',
		                url:'login',
		                dataType:'text',
		                data:{nickname:idValue, pass:pw.val()},
		                success:function(text){
		                  if ( text === "loginSuccess" ) {
		                     location.href=""
		                  } else if ( text === "loginFail" ) {
		                     message.text("������� �̸��� ��й�ȣ�� ��Ȯ���� �ʽ��ϴ�.");
		                  }
		                },
		                error:function() {
		                   alert("error");
		                }
		             });
				}
			</script>
			
			<div align="center">
				<br>
				<image src="./image/banner.png" width="200"/>
			</div>
			
			<div data-role="content">
				<form id="loginForm" method="post" action="#" align="center">
					<div align="center">
						<input id="nickname" type="text" name="nickname" placeholder="����� �̸�"/> 
						<br>
						<input id="pass" type="password" name="pass" placeholder="��й�ȣ"/> 	
						<br>		
						<input type="button" value="�α���" data-inline="true" onclick="login()"/>
						<br>
						<p align="center" id="check" style="color:red"></p>
					</div>
				</form>
			</div>
			
			<div data-role="footer" data-theme="b" data-position="fixed">
				<div data-role="navbar" class="ui-btn-active">
					<ul>
						<li>
							<a href="./emailcheck" data-ajax="false" style="text-decoration:none;
							text-shadow: 0px 0px 0px;
							color: #fff;
							font-weight: normal;">������ �����Ű���? �����ϱ�.</a>
						</li>
					</ul>
				</div>
			</div>

		</div>	
	</body>
</html>
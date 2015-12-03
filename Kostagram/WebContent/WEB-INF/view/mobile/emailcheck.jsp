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
		
		<script type="text/javascript">
		$(function(){
			var joinForm = $("#joinForm");
			
			$('#joinbutton').click(function(){
		
				var idInput = $('input:text[name=email]');
				var idValue = trim(idInput.val());
				
				if(idValue === "")
				{
					window.alert("E-mail ID�� �Է��ϼ���.");
					idInput.select();
					return false;
				}
				
				if(idValue !== "")
				{
					if(isEmailChar(idValue))
					{
						window.alert("E-mail ID ���� ���� �ҹ��ڿ� ����, '@', '.' ���� �Է°����մϴ�.");
						idInput.select();
						return false;
					}
					else if(idValue.indexOf("@") == -1 || idValue.indexOf(".") == -1 || idValue.indexOf(".")<idValue.indexOf("@") || isNum(idValue.charAt(0)))
					{
						window.alert("E-mail ID�� Ȯ�� �ϼ���.");
						idInput.select();
						return false;
					}
					else
					{
						$.ajax({
			                type:'POST',
			                url:'validationEmail',
			                dataType:'text',
			                data:{email:idValue},
			                success:function(text){
			                  if ( text === "availableEmail" ) {
			                     location.href="usercheck?email="+idValue;
			                  } else if ( text === "existedEmail" ) {
			                     message.text("����� �� ���� �̸��� �Դϴ�.");
			                  }
			                },
			                error:function() {
			                   alert("error");
			                }
			             });
					}
				}
			});
		});
		</script>
	</head>
	<body>
		<div data-role="page" data-theme="e">
		
			<div align="center">
				<br>
				<image src="./image/banner.png" width="200"/>
			</div>
	
			<div data-role="content">
				<form id="joinForm" method="post" action="usercheck" align="center">
					<div align="center">
						<input id="email" type="text" name="email" placeholder="�̸���"/>
						<br>
						<a data-ajax="false"><input type="button" id="joinbutton" value="����" data-inline="true"/></a>
						<br>
						<p align="center" id="check" style="color:red"></p>
					</div>
				</form>
			</div>
			
			<div data-role="footer" data-theme="b" data-position="fixed">
				<div data-role="navbar" class="ui-btn-active">
					<ul>
						<li>
							<a href="./" data-ajax="false" style="text-decoration:none;
							text-shadow: 0px 0px 0px;
							color: #fff;
							font-weight: normal;">�̹� ������ �����Ű���? �α���.</a>
						</li>
					</ul>
				</div>
			</div>

		</div>	
	</body>
</html>
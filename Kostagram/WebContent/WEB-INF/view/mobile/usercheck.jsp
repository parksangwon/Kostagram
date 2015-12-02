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
		<div data-role="page" data-theme="e">
			
			<script>
			$(function(){
				var joinForm = $("#joinForm");
				
				$('#joinbutton').click(function(){
					
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
						else if(idValue.indexOf("@") == -1 || idValue.indexOf(".") == -1 || idValue.indexOf(".")<idValue.indexOf("@") || isNum(idValue.charAt(0)))
						{
							window.alert("E-mail ID�� Ȯ�� �ϼ���.");
							idInput.select();
							return false;
						}
					}	
					var idInputName = $('input:text[name=name]');
					var idValueName = trim(idInputName.val());
					
					if(idValueName === "")
					{
						window.alert("�̸��� �Է��� �ּ���.");
						idInputName.select();
						return false;
					}
					
					var idInputNickName = $('input:text[name=nickname]');
					var idValueNickName = trim(idInputNickName.val());
					if(idValueNickName === "")
					{
						window.alert("������̸�(�г���) �� �Է��� �ּ���.");
						idInputNickName.select();
						return false;
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
					
						
					joinForm.submit();
					//$.mobile.changePage("./usercheck");
								
				});
			});
		</script>
			
			<center><h1>Kostagram</h1></center>
<%
	String id = (String)request.getParameter("id");
%>
			<div data-role="content">
				<form id="joinForm" method="post" action="userpage" align="center">
					<div data-role="fieldcontain" align="center">
						<input id="id" type="text" name="id" placeholder="email-id" value="<%= id %>"/> 
					</div>
					<div data-role="fieldcontain" align="center">
						<input id="name" type="text" name="name" placeholder="�̸�"/> 
					</div>
					<div data-role="fieldcontain" align="center">
						<input id="nickname" type="text" name="nickname" placeholder="����� �̸�(�г���)"/> 
					</div>
					<div data-role="fieldcontain" align="center">
						<input id="pw" type="password" name="pw" placeholder="��й�ȣ"/> 
					</div>				
					
					<div data-role="fieldcontain">
						<center>
							<input type="button" value="�����ϱ�" data-inline="true" id="joinbutton"/>
						</center>
					</div>
				</form>
			</div>
			
			<div data-role="footer" data-theme="b">
				<center><a href="./login"><h4>�̹� ������ �����Ű���? �α���.</h4></a></center>
			</div>
		</div>	
	</body>
</html>
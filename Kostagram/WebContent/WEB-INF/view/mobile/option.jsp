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
		<div>
			<div data-role="header" data-theme="b">
				<h2>�ɼ�</h2> <a data-icon="check" class="ui-btn-right" data-iconpos="notext"></a>
				<a href="./userpage" data-icon="delete" class="ui-btn-left" data-iconpos="notext"></a>
			</div>
			<div data-rol="content" >
				<ul data-insert="true">
					<div>
						<table width="90%" border="0">
							<Tr>
								<Td>
									<h3>����</h3><hr>
								</Td>
							</Tr>
							<tr>
								<Td>
									<h4><a href="./profileupdate">������ ����</a></h4>
								</Td>
							</tr>
							<tr>
								<Td>
									<h4><a href="./findphonenumber">����ó�� ģ�� ã��</a></h4>
								</Td>
							</tr>
							<tr>
								<Td>
									<h4>��й�ȣ ����</h4>
								</Td>
							</tr>
							<tr>
								<Td>
									<h4>ȸ������ ������ �Խù�</h4><hr>
								</Td>
							</tr>
							<tr>
								<Td>
									<h4>�α׾ƿ�</h4><hr>
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
						<li><a href="./search" data-role="button" data-icon="search" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="star" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="star" data-iconpos="notext"></a></li>
						<li><a href="./userpage" data-role="button" data-icon="info" data-iconpos="notext"></a></li>
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>
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
			<div data-role="header" data-theme="a">
				<h2>������ ����</h2> <a data-icon="check" class="ui-btn-right" data-iconpos="notext"></a>
				<a href="./userpage" data-icon="delete" class="ui-btn-left" data-iconpos="notext"></a>
			</div>
			<div data-rol="content" >
				<ul data-insert="true">
					<div>
						<table border="0" width="90%">
							<tr>
								<td width="10%">
									<img src="image/icon/user.png">
								</td>
								<td>
									<input type="text" id="name" placeholder="name">
								</td>
							</tr>
							<tr>
								<td width="10%">
									<img src="image/icon/stamp.png">
								</td>
								<td>
									<input type="text" id="nickname" placeholder="nickname">
								</td>
							</tr>
							<tr>
								<td width="10%">
									<img src="image/icon/chat_bubble.png">
								</td>
								<td>
									<input type="text" id="profilemassage" placeholder="���¸޼���">
								</td>
							</tr>
						</table>
					</div>
				</ul>
				<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���� ����</h3><hr>
				<ul data-insert="true">
					<div>
						<table width="90%">
							<tr>
								<td width="10%">
									<img src="image/icon/pencil.png">
								</td>
								<td>
									<input type="text" id="email" placeholder="email-id">
								</td>
							</tr>
							<tr>
								<td width="10%">
									<img src="image/icon/address_book.png">
								</td>
								<td>
									<input type="text" id="email" placeholder="phone number">
								</td>
							</tr>
							<tr>
								<td width="10%">
									<img src="image/icon/heart.png">
								</td>
								<td>
									<select id="sex">
										<option value="0">���� �� ��</option>
										<option value="m">����</option>
										<option value="w">����</option>
									</select>
								</td>
							</tr>
						</table>
					</div>
				</ul><hr>	
			</div>
		</div>
	</body>
</html>
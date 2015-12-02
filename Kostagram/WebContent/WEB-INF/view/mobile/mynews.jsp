<%@page import="java.util.ArrayList"%>
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
		<div id="following" data-role="page" data-theme="d">
			<div data-role="header" data-theme="b">
				<table>
					<tr>
						<td>
							<span style="height:35px;
							font-size:20px;
							color:#ffffff;
							line-height:35px;
							text-align:left;
							background-color:transparent;
							border:0px;
							text-shadow: 0px 0px 0px black;
							padding-left:5px;">
							Ȱ��
							</span>
						</td>
					</tr>
				</table>
			</div>
			
			<div>
				<div>
					<table width="100%">
						<tr>
							<td onclick="location.href='./mynews#following'" align="center">�ȷ���</td>
							<td onclick="location.href='./mynews#mynews'" align="center">�� �Խù�</td>
						</tr>
					</table>
				</div>
				<div>
				<%
					// �ӽ÷� Ȱ�� ����Ʈ �߰�
					ArrayList follwingList = new ArrayList();
					for(int i=0; i<10; i++)
					{
						follwingList.add(i);
					}
					
					if(follwingList!=null && follwingList.size()>=0)
					{
						for(int i=0; i<follwingList.size(); i++)
						{
				%>
							<table width="100%">
								<tr>
									<td align="center">
										<a href="./detail"><image src="./image/test.jpg" width="40" style="-webkit-border-radius: 100px; 
										border-radius: 100px;"/></a>
										<a href="#" style="text-decoration:none;
										text-shadow: 0px 0px 0px;
										color: #004879;
										font-weight: normal;">���澲</a>
										����</a>
										<a href="#" style="text-decoration:none;
										text-shadow: 0px 0px 0px;
										color: #004879;
										font-weight: normal;">������</a>
										���� ������ �����մϴ�.
										<a href="./detail"><image src="./image/park.jpg" width="40"/></a>
									</td>
								</tr>
							</table>
							<hr>
				<%
						}	
					}
					else
					{
				%>
					<div>
						�ȷ����� �����ϴ�.
					</div>
				<%		
					}
				%>
				</div>	
			</div>
			
			<div data-role="footer" data-theme="b" data-position="fixed">
				<div data-role="navbar" class="ui-btn-active">
					<ul>
						<li><a href="./"><image src="./image/icon/house.png" width="20"/></a></li>
						<li><a href="./round"><image src="./image/icon/search.png" width="20"/></a></li>
						<li><a href="#"><image src="./image/icon/camera.png" width="20"/></a></li>
						<li><a href="./mynews"><image src="./image/icon/info.png" width="20"/></a></li>
						<li><a href="./userpage"><image src="./image/icon/user.png" width="20"/></a></li>
					</ul>
				</div>
			</div>
		</div>
		
		<div id="mynews" data-role="page" data-theme="d">
			
			<div data-role="header" data-theme="b">
				<table>
					<tr>
						<td>
							<span style="height:35px;
							font-size:20px;
							color:#ffffff;
							line-height:35px;
							text-align:left;
							background-color:transparent;
							border:0px;
							text-shadow: 0px 0px 0px black;
							padding-left:5px;">
							Ȱ��
							</span>
						</td>
					</tr>
				</table>
			</div>
			
			<div>
				<div>
					<table width="100%">
						<tr>
							<td onclick="location.href='./mynews#following'" align="center">�ȷ���</td>
							<td onclick="location.href='./mynews#mynews'" align="center">�� �Խù�</td>
						</tr>
					</table>
				</div>
				
				<div>
				<%
					// �ӽ÷� Ȱ�� ����Ʈ �߰�
					ArrayList newsList = new ArrayList();
					for(int i=0; i<10; i++)
					{
						newsList.add(i);
					}
					
					if(newsList!=null && newsList.size()>=0)
					{
						for(int i=0; i<newsList.size(); i++)
						{
				%>
							<table width="100%">
								<tr>
									<td align="center">
										<a href="./detail"><image src="./image/test.jpg" width="40" style="-webkit-border-radius: 100px; 
										border-radius: 100px;"/></a>
										<a href="#" style="text-decoration:none;
										text-shadow: 0px 0px 0px;
										color: #004879;
										font-weight: normal;">���澲</a>
										���� ȸ������ ������ �����մϴ�.
										<a href="./detail"><image src="./image/park.jpg" width="40"/></a>
									</td>
								</tr>
							</table>
							<hr>
				<%
						}	
					}
					else
					{
				%>
					<div>
						Ȱ�� ������ �����ϴ�.
					</div>
				<%		
					}
				%>
				</div>	
			</div>
			
			<div data-role="footer" data-theme="b" data-position="fixed">
				<div data-role="navbar" class="ui-btn-active">
					<ul>
						<li><a href="./"><image src="./image/icon/house.png" width="20"/></a></li>
						<li><a href="./round"><image src="./image/icon/search.png" width="20"/></a></li>
						<li><a href="#"><image src="./image/icon/camera.png" width="20"/></a></li>
						<li><a href="./mynews"><image src="./image/icon/info.png" width="20"/></a></li>
						<li><a href="./userpage"><image src="./image/icon/user.png" width="20"/></a></li>
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>
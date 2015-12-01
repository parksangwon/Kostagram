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
		<div id="loginform" data-role="page" data-theme="b" >
			
			<div data-role="header" data-theme="b">
				<table onclick="location.href='search'">
					<tr>
						<td>
							<a href="#" data-rel="back"><image src="./image/icon/cross.png" width="20" style="padding-left:10px;"/></a>
							<span style="height:35px;
							font-size:20px;
							color:#ffffff;
							line-height:35px;
							text-align:left;
							background-color:transparent;
							border:0px;
							text-shadow: 0px 0px 0px black;
							padding-left:5px;">
							�ѷ�����
							</span>
						</td>
					</tr>
				</table>
			</div>
			
			
			<div>
				<table width="100%">
					<tr>
						<td width="60"><image src="./image/test.jpg" width="60" style="-webkit-border-radius: 100px; 
								border-radius: 100px;"/></td>
						<td align="left"><a href="#" style="text-decoration:none;
							text-shadow: 0px 0px 0px;
							color: #004879;
							font-weight: normal;">�̼��� �����̻���</a></td>
						<td align="right"><a href="#"><image src="./image/follow.jpg" width="80"/></a></td>
					</tr>
				</table>
			</div>
			
			<div>
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td width="100%" colspan="2"><image src="./image/test.jpg" width="100%"/></td>
					</tr>
					<tr>
						<td align="left"><a href="#"><image src="./image/icon/heart.png" width="25"/></a>&nbsp;&nbsp;<a href="#"><image src="./image/icon/chat_bubble.png" width="25"/></a></td>
						<td align="right"><a href="#"><image src="./image/icon/warning.png" width="25"/></a></td>
					</tr>
				</table>
			</div>
			<div>
				<table>
					<tr>
			<%
				// ���ƿ� �κ�, ���ƿ䰡 5�� �����̸� ���̵�, �ʰ��Ǹ� ������
				ArrayList likelist = new ArrayList();
				for(int i=0; i<5; i++)
				{
					likelist.add(i);
				}
				
				if(likelist.size()<6)
				{
			%>			
						<td><a href="#" style="text-decoration:none;
						text-shadow: 0px 0px 0px;
						color: #004879;
						font-weight: normal;">�� 
					<%
						for(int i=0; i<likelist.size(); i++)
						{
					%>
						 <%= likelist.get(i) %>
					<%
						} 
					%> 
						</a></td>
			<%
				}
				else
				{
			%>
					<td><a href="#" style="text-decoration:none;
					text-shadow: 0px 0px 0px;
					color: #004879;
					font-weight: normal;">�� <%= likelist.size()%>��</a></td>
			<%
				}
			%>
					</tr>
					
					<tr>
						<td><a href="#" style="text-decoration:none;
							text-shadow: 0px 0px 0px;
							color: #004879;
							font-weight: normal;">���̵�</a>
							�Խñ� ����
							</td>
						</tr>
					<tr>
			<%
				// ��� ����
				// �ӽ÷� ��� ����Ʈ �߰�
				ArrayList replylist = new ArrayList();
				for(int i=0; i<4; i++)
				{
					replylist.add(i);
				}
				
				if(replylist!=null && replylist.size()>=0)
				{
					if(likelist.size()>3)
					{
			%>
					<tr>
						<td><a href="#" style="text-decoration:none;
						text-shadow: 0px 0px 0px;
						color:#353535;
						font-weight:normal;">��� ������</a></td>
					</tr>
			<%
					}
					for(int i=0; i<4; i++)
					{
			%>
					<tr>
						<td><a href="#" style="text-decoration:none;
						text-shadow: 0px 0px 0px;
						color: #004879;
						font-weight: normal;"><%= replylist.get(i) %></a> ���</td>
					</tr>
			<%
					}
				}
				
				else{}
			%>
				</table>
			</div>
			
			<div>
				<a href="#" style="text-decoration:none;
				text-shadow: 0px 0px 0px;
				color:#353535;
				font-weight:normal;">��� �ޱ�</a>
			</div>
			
			<div data-role="footer" data-theme="b">
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
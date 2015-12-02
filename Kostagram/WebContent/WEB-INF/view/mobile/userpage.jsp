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
		<!-- ����׸��� ���� -->
		<div id="photogrid" data-role="page" data-theme="e">
			<div data-role="header" data-theme="b">
				<table width="100%">
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
							Park Sang Won
							</span>
						</td>
						<td align="right">
							<a href="./option"><image src="./image/icon/settings.png" width="20" style="padding-right:10px;"/></a>
						</td>
					</tr>
				</table>
			</div>
			
			<div data-rol="content" >
				<ul data-insert="true">
					<div>
						<table border="0" width="100%">
							<tr>
								<td rowspan="2" width="30%">
									<image src="image/park.jpg"/>
								</td>
								<td align="center">
									0<br>
									�Խù�
								</td>
								<td align="center">
									30<br>
									�ȷ���
								</td>
								<td align="center">
									30<br>
									�ȷο�
								</td>
							</tr>
							<tr>
								<td align="center" colspan="3" onclick="location.href='./profileupdate'">������ ����</td>
							</tr>
						</table>
					</div>
				</ul>	
			</div>
				
			<div>
				<ul data-insert="true">�ڻ��</ul>
				
			</div>
				
			<div>
				<table width="100%">
					<tr>
						<td onclick="location.href='./userpage#photogrid'" align="center"><image src="./image/icon/grid.png" width="20"/></td>
						<td onclick="location.href='./userpage#photolist'" align="center"><image src="./image/icon/stamp.png" width="20"/></td>
						<td onclick="location.href='./" align="center"><image src="./image/icon/pin.png" width="20"/></td>
						<td onclick="location.href='./phototaged" align="center"><image src="./image/icon/bookmark.png" width="20"/></td>
					</tr>
				</table>
			</div>
			<br>
			<%
				int count=0;
				// ����Ʈ �޾ƿ��� ��, �ӽ÷� �� �� ��
				ArrayList list = new ArrayList();
				for(int i=0; i<20; i++)
				{
					list.add(i);
				}
			%>
			<div data-rol="content">
				<center>
					<table cellspacing="0" cellpadding="0"  width="100%">
						<tr>
						<%
							if(list!=null && list.size()>=0)
							{
								for(int i=0; i<list.size(); i++)
								{
						%>
									<td><a href="./detail"><image src="./image/test.jpg" width="100%"/></a></td>
						<%
									if(count==2)
									{
										count=0;
						%>
								</tr>
						
								<tr>
								<td><a href="./detail"><image src="./image/test.jpg" width="100%"/></a></td>
						<%
									}
									count++;
								}
							}
							else {}
						%>
					</table>
				</center>
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
		
		<!-- ����׸��� �� -->
		
		<!-- ���丮��Ʈ ���� -->
		<div id="photolist" data-role="page" data-theme="e">
			<div data-role="header" data-theme="b">
				<table width="100%">
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
							Park Sang Won
							</span>
						</td>
						<td align="right">
							<a href="./option"><image src="./image/icon/settings.png" width="20" style="padding-right:10px;"/></a>
						</td>
					</tr>
				</table>
			</div>
			
			<div data-rol="content" >
				<ul data-insert="true">
					<div>
						<table border="0" width="100%">
							<tr>
								<td rowspan="2" width="30%">
									<image src="image/park.jpg"/>
								</td>
								<td align="center">
									0<br>
									�Խù�
								</td>
								<td align="center">
									30<br>
									�ȷ���
								</td>
								<td align="center">
									30<br>
									�ȷο�
								</td>
							</tr>
							<tr>
								<td align="center" colspan="3" onclick="location.href='./profileupdate'">������ ����</td>
							</tr>
						</table>
					</div>
				</ul>	
			</div>
				
			<div>
				<ul data-insert="true">�ڻ��</ul>
				
			</div>
				
			<div>
				<table width="100%">
					<tr>
						<td onclick="location.href='./userpage#photogrid'" align="center"><image src="./image/icon/grid.png" width="20"/></td>
						<td onclick="location.href='./userpage#photolist'" align="center"><image src="./image/icon/stamp.png" width="20"/></td>
						<td onclick="location.href='./'" align="center"><image src="./image/icon/pin.png" width="20"/></td>
						<td onclick="location.href='./phototaged'" align="center"><image src="./image/icon/bookmark.png" width="20"/></td>
					</tr>
				</table>
			</div>
			<br>
		<% 
			ArrayList timeLineList = new ArrayList();
			for(int p=0; p<5; p++)
			{
				timeLineList.add(p);
			}
			
			if(timeLineList==null || timeLineList.size()==0 )
			{ 
		%>
			<div>
				<center>�ȷ����� �����ϴ�.</center>
			</div> 
		<%	
			}
			else
			{
				for(int i=0; i<timeLineList.size(); i++ )
				{ 
		%>
			<div>
				<table width="100%">
					<tr>
						<td width="60"><image src="./image/test.jpg" width="60" style="-webkit-border-radius: 100px; 
								border-radius: 100px;"/></td>
						<td align="left"><a href="#" style="text-decoration:none;
							text-shadow: 0px 0px 0px;
							color: #004879;
							font-weight: normal;">�̼��� �����̻���</a></td>
						<td align="right" style="text-decoration:none;
							text-shadow: 0px 0px 0px;
							color: #004879;
							font-weight: normal;">�ø��ð�</td>
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
				for(int j=0; j<5; j++)
				{
					likelist.add(j);
				}
				
				if(likelist.size()<6)
				{
			%>			
						<td><a href="#" style="text-decoration:none;
						text-shadow: 0px 0px 0px;
						color: #004879;
						font-weight: normal;">�� 
					<%
						for(int k=0; k<likelist.size(); k++)
						{
					%>
						 <%= likelist.get(k) %>
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
				for(int n=0; n<4; n++)
				{
					replylist.add(n);
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
					for(int m=0; m<4; m++)
					{
			%>
					<tr>
						<td><a href="#" style="text-decoration:none;
						text-shadow: 0px 0px 0px;
						color: #004879;
						font-weight: normal;"><%= replylist.get(m) %></a> ���</td>
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
			<br>
			<%
				}
			}
			%>
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
		
		<!-- ���丮��Ʈ �� -->	
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>

<%
	ArrayList photoList =(ArrayList)request.getAttribute("photoList"); ;
%>

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
			<div data-role="header" data-theme="b">
				<h2>Park.Sang.Won</h2> <a href="./option" data-icon="grid" class="ui-btn-right" data-iconpos="notext"></a>
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
								<td align="center" colspan="3">
									<a href="./profileupdate">������ ����</a>
								</td>
							</tr>
						</table>
					</div>
				</ul>	
				<div>
					<ul data-insert="true">�ڻ��</ul>
					
				</div>
				<div data-role="navbar">
					<ul>
						<li><a data-icon="grid">������ ����Ʈ</a></li>
						<li><a data-icon="grid">�󼼺���</a></li>
						<li><a data-icon="grid">�����</a></li>
						<li><a data-icon="grid">ȸ������ ���»���</a></li>
					</ul>
				</div>
				<div>
					
					

					<%
			if (photoList == null || photoList.size() == 0 ) {
		%>
				<ul align="center" data-insert="true">����� ���� �����ϴ�.</ul>
				<ul align="center" data-insert="true">������ ������ �����Ͽ� �����غ�����</ul>
		<%	
			} else {
				for ( int i = 0; i < photoList.size(); i++ ) {
		%>

				<ul data-role="listview" >
					<li >
						<table>
							<tr>
								<td width="5%">����</td>
								<td width="20%"><a href="#" style="text-decoration:none"><font color="#004879">���� ���̵�</font></a></td>							
								<td width="70%"	align="right">10��</td>
							</tr>			
						</table>
					</li>
						<img src="./framework/images/testImage3.jpg"  width="100%">
					<li>
							
							<div data-role="main" class="ui-content">
								<a href="#love" class="ui-btn ui-btn-inline ui-shadow ui-corner-all" data-rel="dialog"><font size="2">��</font></a>
							    <a href="#commant" class="ui-btn ui-btn-inline ui-shadow ui-corner-all" data-rel="dialog"><font size="2">���</font></a>
							    <a href="#submit" class="ui-btn ui-btn-inline ui-shadow ui-corner-all" data-rel="dialog"><font size="2">��</font></a>
							    <a href="#smenu" data-rel="popup" class="ui-btn ui-btn-inline ui-corner-all" >:</a>
							    
							    <div data-role="popup" id="smenu" data-overlay-theme="b">
							      <input type="button" value="�Ű�">
							    </div>
							</div>

					</li>
					<li>
						<p><a href="#" style="text-decoration:none" ><font color="#004879">�� ���ƿ� 142��</font></a></p>
						<br>
						<p><a href="#" style="text-decoration:none"><font color="#004879">Hihi123</font></a> I see you. 
						<a href="#" style="text-decoration:none"><font color="#OD37CA">#widewhynot</font></a></p>
						
						<p><a href="#" style="text-decoration:none"><font color="gray">��� ???�� ��κ���</font></a></p>
						<p><a href="#" style="text-decoration:none"><font color="#004879">borouhhin</font></a>	Fire~</p>
						<p><a href="#" style="text-decoration:none"><font color="#004879">junhyck</font></a>	Awesome</p>
						<p><a href="#" style="text-decoration:none"><font color="#004879">rossmansusna</font></a>	Going up or going down1 Great, ILove this pic.</p>
						<p><a href="#comment" style="text-decoration:none"><font color="gray">��� �ޱ�</font></a></p>
					</li>
				</ul>
		
			
			<div id="comment" data-role="page"  data-theme="d">
				<div data-role="header">
					<h1>��� �ޱ�</h1>
					<a href="#" data-rel="back" data-icon="arrow-1"></a>
				</div>
				<div data-role="content">
					<h1>��� �ٴ� ������</h1>
				</div>
			</div>
		
		<%}
				}%>
			
		</div>
	</div>
	
		<div data-role="footer" data-theme="b"		data-position="fixed">
					<div data-role="navbar" >
						<ul data-theme="f">
							<li><a data-role="button" data-icon="home" data-iconpos="notext" ></a></li>
							<li><a data-role="button" data-icon="search" data-iconpos="notext" ></a></li>
							<li><a data-role="button" data-icon="star" data-iconpos="notext"	class="ui-btn-active 	ui-state-persist"></a></li>
							<li><a data-role="button" data-icon="star" data-iconpos="notext"></a></li>
							<li><a data-role="button" data-icon="info" data-iconpos="notext" ></a></li>
						</ul>
					</div>
		</div> 
</div>

</body>
</html>
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
		<div id="home" data-role="page" data-theme="d">
			
			<div data-role="header" data-theme="b">
				<table class="search">
					<tr>
						<td>
							<image src="./image/icon/search.png" width="20" style="padding-left:10px;"/>
						</td>
						<td>
							<input type="text" placeholder="�˻�" style="width:300px;
							height:35px;
							font-size:15px;
							line-height:35px;
							text-align:left;
							background-color:transparent;
							border:0px;
							-webkit-border-radius:0px; 
							border-radius:0px;
							box-shadow:0 0 0px;
							text-shadow: 0px 0px;">
						</td>
					</tr>
				</table>
			</div>
			
			<div data-role="content">
				<div data-role="navbar">
					<ul>
						<li><a href="#home">�˻�</a></li>
						<li><a href="#people">��� �˻�</a></li>
						<li><a href="#hashtag">�ؽ��±� �˻�</a></li>
						<li><a href="#place">��� �˻�</a></li>
					</ul>
				</div>
				<div>
					<ul data-insert="true">
						�˻�
					</ul>
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
		
		<div id="people" data-role="page" data-theme="a">
			
			<div data-role="header" data-theme="b">
				<table class="search">
					<tr>
						<td>
							<image src="./image/icon/search.png" width="20" style="padding-left:10px;"/>
						</td>
						<td>
							<input type="text" placeholder="��� �˻�" style="width:300px;
							height:35px;
							font-size:15px;
							line-height:35px;
							text-align:left;
							background-color:transparent;
							border:0px;
							-webkit-border-radius:0px; 
							border-radius:0px;
							box-shadow:0 0 0px;
							text-shadow: 0px 0px;">
						</td>
					</tr>
				</table>
			</div> 
			
			<div data-role="content">
				<div data-role="navbar">
					<ul>
						<li><a href="#home">�˻�</a></li>
						<li><a href="#people">��� �˻�</a></li>
						<li><a href="#hashtag">�ؽ��±� �˻�</a></li>
						<li><a href="#place">��� �˻�</a></li>
					</ul>
				</div>
				<div>
					<ul data-insert="true">
						��� �˻�
					</ul>
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
		
		<div id="hashtag" data-role="page" data-theme="c">
			
			<div data-role="header" data-theme="b">
				<table class="search">
					<tr>
						<td>
							<image src="./image/icon/search.png" width="20" style="padding-left:10px;"/>
						</td>
						<td>
							<input type="text" placeholder="�ؽ��±� �˻�" style="width:300px;
							height:35px;
							font-size:15px;
							line-height:35px;
							text-align:left;
							background-color:transparent;
							border:0px;
							-webkit-border-radius:0px; 
							border-radius:0px;
							box-shadow:0 0 0px;
							text-shadow: 0px 0px;">
						</td>
					</tr>
				</table>
			</div>  
			
			<div data-role="content">
				<div data-role="navbar">
					<ul>
						<li><a href="#home">�˻�</a></li>
						<li><a href="#people">��� �˻�</a></li>
						<li><a href="#hashtag">�ؽ��±� �˻�</a></li>
						<li><a href="#place">��� �˻�</a></li>
					</ul>
				</div>
				<div>
					<ul data-insert="true">
						�ؽ��±� �˻�
					</ul>
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

		<div id="place" data-role="page" data-theme="e">
			
			<div data-role="header" data-theme="b">
				<table class="search">
					<tr>
						<td>
							<image src="./image/icon/search.png" width="20" style="padding-left:10px;"/>
						</td>
						<td>
							<input type="text" placeholder="��� �˻�" style="width:300px;
							height:35px;
							font-size:15px;
							line-height:35px;
							text-align:left;
							background-color:transparent;
							border:0px;
							-webkit-border-radius:0px; 
							border-radius:0px;
							box-shadow:0 0 0px;
							text-shadow: 0px 0px;">
						</td>
					</tr>
				</table>
			</div>  
			
			<div data-role="content">
				<div data-role="navbar">
					<ul>
						<li><a href="#home">�˻�</a></li>
						<li><a href="#people">��� �˻�</a></li>
						<li><a href="#hashtag">�ؽ��±� �˻�</a></li>
						<li><a href="#place">��� �˻�</a></li>
					</ul>
				</div>
				<div>
					<ul data-insert="true">
						��� �˻�
					</ul>
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
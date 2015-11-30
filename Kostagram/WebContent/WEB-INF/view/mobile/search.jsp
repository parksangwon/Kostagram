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
			<div data-role="header" data-theme="c">
				<input type="search" name="search" placeholder="�˻�" data-inline="true"/>
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
			
			<div data-role="footer" data-theme="b">
				<div data-role="navbar" class="ui-btn-active">
					<ul>
						<li><a data-role="button" data-icon="home" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="search" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="star" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="star" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="info" data-iconpos="notext"></a></li>
					</ul>
				</div>
			</div>
		</div>
		
		<div id="people" data-role="page" data-theme="a">
			<div data-role="header">
				<input type="search" name="search" placeholder="��� �˻�"/>
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
			
			<div data-role="footer" data-theme="b">
				<div data-role="navbar" class="ui-btn-active">
					<ul>
						<li><a data-role="button" data-icon="home" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="search" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="star" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="star" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="info" data-iconpos="notext"></a></li>
					</ul>
				</div>
			</div>
		</div>
		
		<div id="hashtag" data-role="page" data-theme="c">
			<div data-role="header">
				<input type="search" name="search" placeholder="�ؽ��±� �˻�"/>
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
			
			<div data-role="footer" data-theme="b">
				<div data-role="navbar" class="ui-btn-active">
					<ul>
						<li><a data-role="button" data-icon="home" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="search" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="star" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="star" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="info" data-iconpos="notext"></a></li>
					</ul>
				</div>
			</div>
		</div>

		<div id="place" data-role="page" data-theme="e">
			<div data-role="header">
				<input type="search" name="search" placeholder="��Ұ˻�"/>
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
			
			<div data-role="footer" data-theme="b">
				<div data-role="navbar" class="ui-btn-active">
					<ul>
						<li><a data-role="button" data-icon="home" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="search" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="star" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="star" data-iconpos="notext"></a></li>
						<li><a data-role="button" data-icon="info" data-iconpos="notext"></a></li>
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>
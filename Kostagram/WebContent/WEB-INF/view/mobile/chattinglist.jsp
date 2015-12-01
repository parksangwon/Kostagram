<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>


<!DOCTYPE html> 
<html> 
	<head>
		<title>jQuery Mobile</title>
		<meta charset="euc-kr" /> 	
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		
		
		
		
				
		<!-- Include jQuery Mobile stylesheets -->
		<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
		
		<!-- Include the jQuery library -->
		<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
		
		<!-- Include the jQuery Mobile library -->
		<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
			
		
		<style TYPE="text/css"> 
			.ui-bar-f {
			    color:#004879;
			    background-color: #004879;
			}
			
		</style>
							
	</head> 
<body>

	<div data-role="page">
		
			<div data-role="header"	data-theme="f" >
				<table width="100%">
					<tr>
						<td>
						<!--  뒤로가기  --><input type="image" src="./m/image/icon/cross.png" onclick="#" >
						<font color="white">DIRECT</font>				
						</td>
						
						<td align="right">
							<input type="image" src="./m/image/icon/plus.png" onclick="#"  >
						</td>
					</tr>
				</table>
			</div>
			
			
			<div data-role="content" >
				<ul data-role="listview">
					<li>
						<a href="./detail"><img src="./m/image/testImage1.jpg" class="ul-li-icon" />
							<table>
								<tr>
									<td>qkrwnsgur0605</td>
								</tr>
								<tr>
									<td>
										<font size="2" color="gray">안녕하세요??</font> 
										<font size="1" color="gray">18분</font>
									</td>
								</tr>
							</table>		
						</a>
					</li>
					<li>
						<a href="./detail"><img src="./m/image/testImage2.jpg" class="ul-li-icon" />
							<table>
								<tr>
									<td>hihihi10234</td>
								</tr>
								<tr>
									<td>
										<font size="2" color="gray">뭐함??</font> 
										<font size="1" color="gray">39분</font>
									</td>
								</tr>
							</table>		
						</a>
					</li>
					<li>
						<a href="./detail"><img src="./m/image/testImage3.jpg" class="ul-li-icon" />
							<table>
								<tr>
									<td>heyhey5252</td>
								</tr>
								<tr>
									<td>
										<font size="2" color="gray">ㅇㅋ알겠음</font> 
										<font size="1" color="gray">50분</font>
									</td>
								</tr>
							</table>		
						</a>
					</li>
				</ul>
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
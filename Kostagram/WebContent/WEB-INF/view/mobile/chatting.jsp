<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<title>Kostagram</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

<script src="jquery-mobile/jquery-1.6.4.js"></script>
<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
<script src="js/common.js"></script>
<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet"
	type="text/css" />

<style TYPE="text/css">
.ui-bar-f {
	color: #004879;
	background-color: #004879;
}

#someone {
	position: relative;
	background: #e0e0e0;
}

#someone:after {
	right: 100%;
	top: 50%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
	border-color: rgba(224, 224, 224, 0);
	border-right-color: #e0e0e0;
	border-width: 5px;
	margin-top: -5px;
}

#me {
	position: relative;
	background: #e0e0e0;
}

#me:after {
	left: 100%;
	top: 50%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
	border-color: rgba(224, 224, 224, 0);
	border-left-color: #e0e0e0;
	border-width: 5px;
	margin-top: -5px;
}
</style>

<body>

	<div data-role="page">

		<div data-role="header" data-theme="b">
			<table>
				<tr>
					<td>
						<!--  뒤로가기  --> <img src="./m/image/icon/back.png"
						onclick="window.location.href = './chattinglist.jsp'"> <font
						color="white">아이디</font>
					</td>
				</tr>
			</table>
		</div>

		<!--  
				
				$('#p태그 id').innerHTML=채팅내용 변수;
				
				 if(상대가 채팅을 쳤다면)
				 {
				 	<table width="100%">
					<tr >	
							 시간 
							<td align="right">
							<font size="1">오후 12:11</font>
							</td>
							<자신 
							<td   style="word-break:break-all">
								<p id="me" >ㅎㅇ</p>
							</td>				
					</tr>
				</table>
				}
				
				else if(내가 채팅을 쳤다면)
				{	
					<table width="100%">	
					<tr>
						
						  상대 
						<td style="word-break:break-all">
								<p id="someone">gd</p>			
						</td>
						<  시간 
						<td align="left">
							<font size="1">오후 12:11</font>
						</td>
					</tr>				
					</table>
				}
				
				 -->
		<div data-role="content">
			<table width="100%">
				<tr>
					<!--  시간 -->
					<td align="right"><font size="1">12:11</font></td>
					<!--  자신 -->
					<td style="word-break: break-all">
						<p id="me">ㅎgdgdgdgdgdggggdgdㅇ</p>
					</td>
				</tr>
			</table>


			<table width="100%">
				<tr>
					<!--  상대 -->
					<td style="word-break: break-all">
						<p id="someone">gdgdgdgdgdgdgdgdgddgdgdgdgdgdgddgdgddgdgdsgdgdgddddgdgdgdgdgdg</p>
					</td>
					<!--  시간 -->
					<td align="left"><font size="1">12:11</font></td>
				</tr>
			</table>

			<table width="100%">
				<tr>
					<!--  시간 -->
					<td align="right"><font size="1">12:11</font></td>
					<!--  자신 -->
					<td style="word-break: break-all">
						<p id="me">안녕하세요??</p>
					</td>
				</tr>
			</table>

			<table width="100%">
				<tr>
					<!--  상대 -->
					<td style="word-break: break-all">
						<p id="someone">안녕하세요!!</p>
					</td>
					<!--  시간 -->
					<td align="left"><font size="1">12:11</font></td>
				</tr>
			</table>

			<table width="100%">
				<tr>
					<!--  상대 -->
					<td style="word-break: break-all">
						<p id="someone">그런데 누구시죠??</p>
					</td>
					<!--  시간 -->
					<td align="left"><font size="1">12:11</font></td>
				</tr>
			</table>

			<table width="100%">
				<tr>
					<!--  시간 -->
					<td align="right"><font size="1">12:11</font></td>
					<!--  자신 -->
					<td style="word-break: break-all">
						<p id="me">준혁입니다</p>
					</td>
				</tr>
			</table>

			<table width="100%">
				<tr>
					<!--  상대 -->
					<td style="word-break: break-all">
						<p id="someone">오랜만이다</p>
					</td>
					<!--  시간 -->
					<td align="left"><font size="1">12:11</font></td>
				</tr>
			</table>

		</div>

		<div data-role="footer" data-theme="c" data-position="fixed">
			<div data-role="navbar">
				<table width="100%">
					<tr>
						<td><input type="text" id="messasgeText"
							placeholder="메시지 쓰기..."></td>
						<td align="right"><img src="./m/image/icon/heart.png">
						</td>
					</tr>
				</table>
			</div>
		</div>

	</div>

</body>
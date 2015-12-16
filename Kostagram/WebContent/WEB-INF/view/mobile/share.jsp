<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>공유하기</title>

<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0,user-scalable=no"/>
<script src="jquery-mobile/jquery-1.6.4.js"></script>
<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
<script src="js/common.js"></script>
<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet"
	type="text/css" />






<body>		
	<div  data-role="page" data-theme="a">
		<div data-role="header">
			<table>
				<tr>
					<td><a href="#" data-rel="back"><img
								src="./image/icon/back.png" width="20"
								style="padding-left:10px;" /></a> <span
						style="height: 35px; font-size: 20px; color: #ffffff; line-height: 35px; text-align: left; background-color: transparent; border: 0px; text-shadow: 0px 0px 0px black; padding-left: 5px;">
							공유하기 </span></td>
				</tr>
			</table>
		</div>
		
		<div id="content" data-role="content" data-scroll="false">
			<table>
				<tr>
					<td width="30%">
						<img width="100%"  src="./image/testImage3.jpg">
					</td>
					
					<td>
						<input type="text"  style="height:50px;" class="infotext" placeholder="설명 쓰기...">
					</td>
				</tr>			
			</table>
				<hr>		
			<a href="#" data-role="button" ><img height="20px"  src="./image/icon/pin.png">위치추가</a>
		</div>
		
		
		
		<div data-role="footer" data-position="fixed">
			<div data-role="navbar" class="ui-btn-active">
				<ul>
					<li><a href="#" style="color: #DFE1E3;">공유하기</a></li>
				</ul>
			</div>
		</div>		
	</div>
	
	
</body>


	





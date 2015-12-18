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
	<div id="fileForm" data-role="page" data-theme="a">
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
		<form id="uploadForm" enctype="multipart/form-data">
			<table>
				<tr>
					<td width="30%">
						<img id="blah" src="" width="100%"/><br>
					</td>
				</tr>
				<tr>
					<td>
						<input type="file" id="fileId" name="file-data"/>
					</td>
				</tr>
				<tr>
					<td>
						<textarea rows="100%" cols="" style="height:70px;" class="infotext" placeholder="설명 쓰기..." name="content"></textarea>
					</td>
				</tr>
				
				<tr>
					<td>
						<a href="" data-role="button" id="btn-gps"><img height="20px"  src="./image/icon/pin.png">위치추가</a>
					</td>
				</tr>
				
				<tr>
					<td id="locationtd">
						<select id="location" name="location">
							<option>위치 선택안함</option>
							
						</select>
					</td>
				</tr>
						
			</table>
				<hr>		
			
			
			<input type="hidden" value="" id="lat" name="lat">
			<input type="hidden" value="" id="lon" name="lon">
		
		</form>
		</div>
		
	
		<div data-role="footer" data-position="fixed">
			<div data-role="navbar" class="ui-btn-active">
				<ul>
					<li><a href="#" style="color: #DFE1E3;" id="btn-upload">공유하기</a></li>
				</ul>
			</div>
		</div>		
	</div>
	
	
</body>


	





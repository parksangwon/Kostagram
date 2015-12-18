<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>

<%
	int count=0;
	//ArrayList photoList =(ArrayList)request.getAttribute("photoList");
	ArrayList photoList = new ArrayList();
	for(int i=0; i<4; i++)
	{
		photoList.add(i);
	}
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>SearchPhotoMap</title>

<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0,user-scalable=no"/>
<!-- 구글 맵 api -->
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
<!--   -->
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>

<script>
	$(document).bind('pagecreate',function(){

		if( navigator.geolocation == undefined ) {
	
			alert(" 위치 정보를 이용할 수 없습니다. ");
	
			return; 
	
		}
	//구글맵을 생성시킬 DIV값 받아오기
	var myMap = document.getElementById("Map");
	
	//임시로 준 좌표 값
	var loc = new google.maps.LatLng(37.478683, 126.880691);

	//	div 에 구글맵 보이기
	var gmap = new google.maps.Map(
			myMap,	//지도가 보여질 div
			{
				zoom:16,//	지도 확대 정보
			 	center:loc,
				mapTypeId:google.maps.MapTypeId.ROADMAP //	지도타입
			}
	);
	
	//	위치에 마커 표시하기
	var gmarker = new google.maps.Marker(
		{
			position:loc,
			map:gmap,
			
		});
	
	// 말풍선 안에 들어갈 사진과 사진갯수
	var content = "<a href=./detail><img src=./m/image/3.jpg width=70px></a> <br> <font size=1><%= photoList.size() %>개의 사진이 있습니다.</font>";
	
	//마커 클릭시 말풍선이 뜸
	var infowindow = new google.maps.InfoWindow({ content: content});
	 
       google.maps.event.addListener(gmarker, "click", function() {
           infowindow.open(gmap,gmarker);
       });
});	
</script>



<body>
	<div data-role="page">
		<div data-role="header" data-theme="b" id="header">
			<!--  뒤로가기  -->
			<img src="./m/image/icon/back.png" width="20"
			onclick="window.location.href = './.jsp'"> 
			
			<span
			style="height: 35px; font-size: 15px; color: #ffffff; line-height: 35px; text-align: left; background-color: transparent; border: 0px; text-shadow: 0px 0px 0px black; padding-left: 5px;">
				지역 이름</span>
		</div>
		
		<div data-role="content">
			<div id="Map" style="width:100%;height:270px;"></div>
				<p align="left"><font color="gray" size="2">최신글</font></p>
			
			<%
				if (photoList == null || photoList.size() == 0 ) {
			%>
				검색 결과가 없습니다.
			<%
				}else{
			%>
				<table cellspacing="0" cellpadding="0" width="100%">
					<tr>
					<% 
						for(int i=0; i<photoList.size(); i++)
							{
					%>
						<td><a href="./detail"><image
									src="./m/image/3.jpg" width="100%" /></a></td>
						<%	count++;
								if(count==3 )
								{
									count=0;
						%>
					</tr>
					<% 	
								}
							}
						}
					%>
				</table>			
		</div>
		
		<div data-role="footer" data-position="fixed">
			<div data-role="navbar" class="ui-btn-active">
				<ul>
					<li><a href="/Kostagram/m/"><img src="/Kostagram/m/image/icon/house.png"
							width="20" /></a></li>
					<li><a href="/Kostagram/m/round"><img src="/Kostagram/m/image/icon/search.png"
							width="20" /></a></li>
					<li><a href="/Kostagram/m/write"><img src="/Kostagram/m/image/icon/camera.png"
							width="20" /></a></li>
					<li><a href="/Kostagram/m/mynews"><img src="/Kostagram/m/image/icon/info.png"
							width="20" /></a></li>
					<li><a href='/Kostagram/m/<%= session.getAttribute("nickname")%>'><img src="/Kostagram/m/image/icon/user.png"
							width="20" /></a></li>
				</ul>
			</div>
		</div>
		
	</div>
</body>


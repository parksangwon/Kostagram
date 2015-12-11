<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>

<%
	int count=0;
	//ArrayList photoList =(ArrayList)request.getAttribute("likeNoticeList");
	ArrayList photoList = new ArrayList();
	for(int i=0; i<4; i++)
	{
		photoList.add(i);
	}
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<meta charset="UTF-8">
<title>PhotoMap</title>
<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0,user-scalable=no"/>
<!-- 구글 맵 api -->
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script>
	
	//마커 변수
    var markers = [
                   {	
                   	//좌표
                       "lat": '37.478683',
                       "lng": '126.880501',
                       //마커  내용
                       "description": '<a href=./detail><img src=./m/image/1.jpg width=60px></a>'
                   },
                   {
                       "lat": '37.478683',
                       "lng": '126.880550',
                       "description": '<a href=./detail><img src=./m/image/2.jpg width=60px></a>'
                   },
                   {
                       "lat": '37.478683',
                       "lng": '126.880600',
                       "description": '<a href=./detail><img src=./m/image/3.jpg width=60px></a>'
                   },
                   {
                       "lat": '37.478683',
                       "lng": '126.880650',
                       "description": '<a href=./detail><img src=./m/image/4.jpg width=60px></a>'
                   },
                   {
                       "lat": '37.478683',
                       "lng": '126.880700',
                       "description": '<a href=./detail><img src=./m/image/2.jpg width=60px></a>'
                   }
    				];
	
	    window.onload = function () {
	        LoadMap();
	    }
	    
	    function LoadMap() {
	        var mapOptions = {
	            center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
	            zoom: 16,
	            mapTypeId: google.maps.MapTypeId.ROADMAP
	        };
	        var map = new google.maps.Map(document.getElementById("Map"), mapOptions);
	 
	        var infoWindow = new google.maps.InfoWindow();
	 
	        for (var i = 0; i < markers.length; i++) {
	            var data = markers[i];
	            var myLatlng = new google.maps.LatLng(data.lat, data.lng);
	            var marker = new google.maps.Marker({
	                position: myLatlng,
	                map: map,
	            });
	 
	            (function (marker, data) {
	                google.maps.event.addListener(marker, "click", function (e) {
	                	//마커에 넣을 내용 가져오기
	                    infoWindow.setContent(data.description);
	                	//
	                    infoWindow.open(map, marker);
	                });
	            })(marker, data);
	        }
	    }
	
</script>
</head>

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
			<div id="Map" style="width:100%;height:200px;"></div>
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
		
		<div data-role="footer" data-theme="b" data-position="fixed">
			<div data-role="navbar" class="ui-btn-active">
				<ul>
					<li><a href="/Kostagram/m/"><img
							src="/Kostagram/m/image/icon/house.png" width="20" /></a></li>
					<li><a href="/Kostagram/m/round"><img
							src="/Kostagram/m/image/icon/search.png" width="20" /></a></li>
					<li><a href="#"><img
							src="/Kostagram/m/image/icon/camera.png" width="20" /></a></li>
					<li><a href="/Kostagram/m/mynews"><img
							src="/Kostagram/m/image/icon/info.png" width="20" /></a></li>
					<li><a href="/Kostagram/m/userpage"><img
							src="/Kostagram/m/image/icon/user.png" width="20" /></a></li>
				</ul>
			</div>
		</div>
		
	</div>
</body>


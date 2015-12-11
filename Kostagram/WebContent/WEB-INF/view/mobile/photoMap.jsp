<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>

<%
//ArrayList photoList =(ArrayList)request.getAttribute("likeNoticeList");
	ArrayList photoList = new ArrayList();
	for(int i=0; i<11; i++)
	{
		photoList.add(i);
	}
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>PhotoMap</title>

<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0,user-scalable=no"/>
<!-- 구글 맵 api -->
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
<!--  -->
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
	var content = "<a href=./detail><img src=./m/image/3.jpg width=100%></a> <font size=1><%= photoList.size() %>개의 사진이 있습니다.</font>";
	
	//마커 클릭시 말풍선이 뜸
	var infowindow = new google.maps.InfoWindow({ content: content});
	 
       google.maps.event.addListener(gmarker, "click", function() {
           infowindow.open(gmap,gmarker);
       });
});	
</script>

<!-- 지도 꽉차게 해주는 CSS -->
<style>
        body, div[data-role ="page"] {
            height: 100%;
            width: 100%;
            margin: 0px;
            padding: 0px;
        }
 
         #content{
            height: 100%;
            width: 100%;
            margin: 0px;
            padding: 0px;
        }
 
        #map {
            height: 100%;
            width: 100%;
            padding: 0px;
        }
</style>

<body>
	<div data-role="page" id="page" >
		<div data-role="header" data-theme="b" id="header">
			<!--  뒤로가기  -->
			<img src="./m/image/icon/back.png" width="20"
			onclick="window.location.href = './userpage.jsp'"> <span
			style="height: 35px; font-size: 15px; color: #ffffff; line-height: 35px; text-align: left; background-color: transparent; border: 0px; text-shadow: 0px 0px 0px black; padding-left: 5px;">
				포토맵 </span>
		</div>
		
		<div id="content" data-role="content" data-scroll="false">
			<div id="Map">
			</div>			
		</div>		
	</div>
</body>


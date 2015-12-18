<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration"%>

<%
	String input_place = (String)request.getAttribute("place");
	String intput_lat = (String)request.getAttribute("lat");
	String intput_lon = (String)request.getAttribute("lon");
	System.out.println("VIEW input_place = " + input_place);
	
	List<HashMap> locationList = (List<HashMap>) request.getAttribute("locationList");
	System.out.println("locationList = " + locationList);
	String data= "[";
	
	if (locationList != null && locationList.size() > 0) {
		for (int i=0; i<locationList.size();i++) {
						
			HashMap lo = (HashMap)locationList.get(i);	
			String location = (String) lo.get("LOCATION");
			String count = (String) lo.get("COUNT");
			String lon = (String) lo.get("LON");
			String email = (String) lo.get("EMAIL");
			String seq_photo = (String) lo.get("SEQ_PHOTO");
			String lat = (String) lo.get("LAT");
			
			data += "['" + location + "', " + lat + ", " + lon + "," + count + ",'" + seq_photo + "','" + email +"']";
			if ( i != locationList.size() - 1) {
			data += ", ";
			}
		}
	}

	data+= "]";
	System.out.println("photomap : " + data);	
%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0,user-scalable=no" />
<TITLE>Kostagram</TITLE> 

<script src="jquery-mobile/jquery-1.6.4.js"></script>
<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
<script src="js/common.js"></script>
<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet"
	type="text/css" />

<body>
	<div id="searchplace_result" data-role="page" data-theme="a">
		<input type="hidden" name="place" value="<%= input_place %>"/>
		<input type="hidden" name="lat" value="<%= intput_lat %>"/>
		<input type="hidden" name="lon" value="<%= intput_lon %>"/>
		<input type="hidden" id="locations" value="<%= data %>"/>
		<div data-role="header">
			<table>
				<tr>
					<td>
						<a href="#" data-rel="back"><image
								src="/Kostagram/m/image/icon/back.png" width="20"
								style="padding-left:10px;" /></a> <span
						style="height: 35px; font-size: 20px; color: #ffffff; line-height: 35px; text-align: left; background-color: transparent; border: 0px; text-shadow: 0px 0px 0px black; padding-left: 5px;">
							<%= input_place%> </span></td>
				</tr>
			</table>
		</div>
		
		<div id="mapArea" data-role="content" data-scroll="false">
			<div id="map">						
			</div>			
		</div>	
		
		<div id="photoArea">
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
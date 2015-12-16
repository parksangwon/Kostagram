<%@ page import="com.kostagram.service.beans.LocationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	
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
			System.out.println(seq_photo);
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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>PhotoMap</title>

<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0,user-scalable=no"/>
<!-- 구글 맵 api -->
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
<!--  -->
<script src="jquery-mobile/jquery-1.6.4.js"></script>
<script src="jquery-mobile/jquery.mobile-1.0.js"></script>
<script src="js/common.js"></script>
<link href="jquery-mobile/jquery.mobile-1.0.css" rel="stylesheet"
	type="text/css" />








<body>		
	<div id="photomap" data-role="page" data-theme="a">
		<div data-role="header">
			<table>
				<tr>
					<td><a href="#" data-rel="back"><img
								src="./image/icon/back.png" width="20"
								style="padding-left:10px;" /></a> <span
						style="height: 35px; font-size: 20px; color: #ffffff; line-height: 35px; text-align: left; background-color: transparent; border: 0px; text-shadow: 0px 0px 0px black; padding-left: 5px;">
							포토맵 </span></td>
				</tr>
			</table>
		</div>
		
		
		<div id="photomapcontent" data-role="content" data-scroll="false">
			<input type="hidden" id="locations" value="<%= data %>"/>
			<div id="map">						
			</div>			
		</div>		
	</div>
	
	
</body>






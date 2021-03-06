<%@page import="java.sql.Timestamp"%>
<%@page import="com.kostagram.service.beans.ReportVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>


<%
	List<HashMap> findList = (List<HashMap>)request.getAttribute("findList");
%>

<!DOCTYPE html>
<html lang="ko" class="no-js logged-in ">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>신고 관리 &bull; Kostagram</title>
		<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
		<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script> 
	  $(function(){
		  var report_form=$('#report_form'); 
		  $('.reportDel').each(function(){
			  $(this).click(function(){
				  if(confirm("이 신고를 삭제 하시겠습니까?"))
					{	
					  	$('input:hidden[name=seq_report]').val($(this).attr('seq'));
						report_form.submit();
					} 
			  });
		  });
		  var photo_form=$('#photo_form'); 
		  $('.photoDel').each(function(){
			  $(this).click(function(){
				  if(confirm("신고된 게시물을 삭제 하시겠습니까?"))
					{	
					  	$('input:hidden[name=seq_photo]').val($(this).attr('seq'));
					  	photo_form.submit();
					} 
			  });
		  });
	  });
		  
		  
		</script>
		
<script src="//instagramstatic-a.akamaihd.net/bluebar/5829dff/scripts/webfont.js" type="text/javascript" async></script>

<style type="text/css">
  @font-face {
    font-family: 'proxima-nova';
    src: url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-bold-webfont.eot');
    src: url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-bold-webfont.eot?#iefix') format("embedded-opentype"),
      url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-bold-webfont.woff') format("woff"),
      url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-bold-webfont.ttf') format("truetype"),
      url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-bold-webfont.svg#ProximaNovaBold') format("svg");
    font-weight: bold;
    font-style: normal; }

  @font-face {
    font-family: 'proxima-nova';
    src: url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-boldit-webfont.eot');
    src: url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-boldit-webfont.eot?#iefix') format("embedded-opentype"),
      url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-boldit-webfont.woff') format("woff"),
      url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-boldit-webfont.ttf') format("truetype"),
      url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-boldit-webfont.svg#ProximaNovaBoldItalic') format("svg");
    font-weight: bold;
    font-style: italic; }

  @font-face {
    font-family: 'proxima-nova';
    src: url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-reg-webfont.eot');
    src: url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-reg-webfont.eot?#iefix') format("embedded-opentype"),
      url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-reg-webfont.woff') format("woff"),
      url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-reg-webfont.ttf') format("truetype"),
      url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-reg-webfont.svg#ProximaNovaRegular') format("svg");
    font-weight: normal;
    font-style: normal; }

  @font-face {
    font-family: 'proxima-nova';
    src: url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-regit-webfont.eot');
    src: url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-regit-webfont.eot?#iefix') format("embedded-opentype"),
      url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-regit-webfont.woff') format("woff"),
      url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-regit-webfont.ttf') format("truetype"),
      url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-regit-webfont.svg#ProximaNovaRegularItalic') format("svg");
    font-weight: normal;
    font-style: italic; }

  @font-face {
    font-family: 'proxima-nova';
    src: url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-sbold-webfont.eot');
    src: url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-sbold-webfont.eot?#iefix') format("embedded-opentype"),
      url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-sbold-webfont.woff') format("woff"),
      url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-sbold-webfont.ttf') format("truetype"),
      url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-sbold-webfont.svg#ProximaNovaSemibold') format("svg");
    font-weight: 600;
    font-style: normal; }
</style>

  <style type="text/css">
  @font-face {
    font-family: 'proxima-nova';
    src: url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-light-webfont.eot');
    src: url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-light-webfont.eot?#iefix') format("embedded-opentype"),
      url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-light-webfont.woff') format("woff"),
      url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-light-webfont.ttf') format("truetype"),
      url(' //instagramstatic-a.akamaihd.net/bluebar/5829dff/webfonts/proximanova-light-webfont.svg#ProximaNovaLight') format("svg");
    font-weight: 300;
    font-style: normal; }
</style>


        
    
        <meta name="robots" content="noimageindex">
        
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">


        
    <meta id="viewport" name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, minimum-scale=1, maximum-scale=1">


        <script type="text/javascript">
        (function() {
            var docElement = document.documentElement;
            var classRE = new RegExp('(^|\\s)no-js(\\s|$)');
            var className = docElement.className;
            docElement.className = className.replace(classRE, '$1js$2');
        })();
        </script>

        
    
    
        <link rel="Shortcut Icon" type="image/x-icon" href="//instagramstatic-a.akamaihd.net/bluebar/5829dff/images/ico/favicon.ico"><link rel="mask-icon" href="//instagramstatic-a.akamaihd.net/bluebar/5829dff/images/ico/favicon.svg" color="#125688">
    
        <link rel="apple-touch-icon-precomposed" href="//instagramstatic-a.akamaihd.net/bluebar/5829dff/images/ico/apple-touch-icon-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="//instagramstatic-a.akamaihd.net/bluebar/5829dff/images/ico/apple-touch-icon-72x72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="//instagramstatic-a.akamaihd.net/bluebar/5829dff/images/ico/apple-touch-icon-114x114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="//instagramstatic-a.akamaihd.net/bluebar/5829dff/images/ico/apple-touch-icon-144x144-precomposed.png">
    
    
    	<link href="./CSS/edit.css" type="text/css" rel="stylesheet"></link>

    
    
    <script src="//instagramstatic-a.akamaihd.net/bluebar/5829dff/scripts/jquery.js" type="text/javascript"></script>
    <script src="//instagramstatic-a.akamaihd.net/bluebar/5829dff/scripts/bluebar.js" type="text/javascript"></script>
    <script src="//instagramstatic-a.akamaihd.net/bluebar/5829dff/scripts/navigation.js" type="text/javascript"></script>


    </head>
    <body class="sidebar-page page-accounts">
        
    
        <div class="root">
        
            <div class="page">
                
                    
                        <header class="top-bar top-bar-new">
    <div class="top-bar-wrapper">
        <center><img src="img/web/KakaoTalk_20151204_145110288.png" ></center>
        <div class="top-bar-left">
            <ul class="top-bar-actions">
                <li>
                    <a class="top-bar-home" href="/Kostagram" label=홈><i></i></a>
                </li>
            </ul>
        </div>

        
            <div class="top-bar-right account-state" id="top_bar_right">
                <ul class="top-bar-actions">
                    
                    
                    <li id="link_profile" class="link-profile has-dropdown">
                        <a href="javascript:;">
                            
    <span class="img img-outset current-user-avatar" style="background-image: url(${profile_img});">
        <img src="${profile_img}" onerror="imageFallback(this);" alt="" />
        <b></b>
    </span>

                            <strong>${nickname}</strong>
                        </a>

                        <div class="dropdown">
                            <i></i>

                             <ul role="navigation">
                                <li><a href="#">프로필 보기</a></li>
                                <li><a href="/Kostagram/profileupdate">프로필 편집</a></li>
                                <li><a href="/Kostagram/logout">로그아웃</a></li>     
                                <li><a href="/Kostagram/report">신고 관리</a></li>  
                            </ul>
                        </div>
                    </li>
                    
                </ul>
            </div>
        
    </div>
</header> <!-- .top-bar -->
                    
                

                
    <div class="sidebar">
        <div class="wrapper">
            <nav class="sidebar-nav">
                <div class="sidebar-content">
                
    <h2><i></i>회원님의 계정<span class="separator"> &bull; </span><span class="subtitle"></span></h2>
    <ul>
        <li class="active">
	        <a href="/Kostagram/profileupdate">
	            
	            프로필 편집
	            
	            <i class="disclosure"></i>
	        </a>
        
    	</li>
        <li >
        <a href="/Kostagram/pwupdate">
            
            비밀번호 변경
            
            <i class="disclosure"></i>
            
        </a>
        
        <li >
        <a href="/Kostagram/report">
            
       	신고 관리
            
            <i class="disclosure"></i>
            
        </a>
        </li>
        
        </li>
        
        <li >
        <a href="/Kostagram/logout">
            
            로그아웃
            
            <i class="disclosure"></i>
            
        </a>
        </li>
    </ul>

                </div>
            </nav>
        </div>
    </div>
    
	<form id="report_form" name="report_form" action="report_delete">
		<input type="hidden" name="seq_report" value="">
	</form>
	<form id="photo_form" name="photo_form" action="photo_delete">
		<input type="hidden" name="seq_photo" value="">	
	</form>
	
    <div class="main">
        <div class="wrapper">
            <section class="nav-page-content" role="main">
            	 <header>
			    	<h1>신고 관리 (관리자 전용)</h1>
			    </header>
			    
                <table border="0">
                	<tr align="center">
                		<td>신고된 사진</td>
                		<td>신고사유</td>
                		<td>날짜</td>
                		<td>신고된 사람</td>
                		<td>신고 삭제</td>
                		<td>게시물 삭제</td>
                	</tr>
                	
			<!--  신고가 들어오는 공간 -->
				<% 
						if (findList != null && findList.size() > 0) {
							for ( HashMap report : findList ) {
								String seq_report = (String)report.get("SEQ_REPORT");
								String seq_photo = (String)report.get("SEQ_PHOTO");
								String content_id = (String)report.get("CONTENT_ID");
								String to_email = (String)report.get("TO_EMAIL");
								String from_email = (String)report.get("FROM_EMAIL");
								Timestamp reg_date = (Timestamp)report.get("REG_DATE");
								
								String content ="욕설";
								if(content_id.equals("2"))
								{
									content = "음란물";
								}
								else if (content_id.equals("3"))
								{
									content = "개인정보 유출";
								}				
							
				%>
                	
                	<tr align="center">
                		
                		<td width="300">
                			<!-- 신고된 사진-->
                			<img src="/Kostagram/personalImg/<%= from_email %>/<%= seq_photo %>.jpg" width='100%' />
                
                		
                		<td width="100">
                			<!-- 신고 사유 -->
                			<%= content %>
                		</td>
                		
                		<td>
                			<!-- 신고된 날짜 -->
                			<%= reg_date %>
                		</td>
                		
                		<td>
                			<!-- 신고당한 사람 이름 -->
                			<%= to_email %>
                		</td>
                		
                		<td>
                			<input type="button" value="신고 삭제" class="reportDel" seq="<%=seq_report%>">
                		</td>
                		
                		<td>
                			<input type="button" value="게시물 삭제" class="photoDel" seq="<%=seq_photo%>">
                		</td>
                	</tr>
 				<%
 					} 
 				} 
 				%>
                </table>
			
    		


            </section>
        </div> <!-- .main -->
    </div> <!-- .main -->


            </div> <!-- .page -->

            
            <footer class="page-footer" role="contentinfo">
                <div class="wrapper">
                    <nav>
                        <ul>
                            <li><a href="/about/us/">소개</a></li>
                            <li><a href="http://help.instagram.com/">지원</a></li>
                            <li><a href="http://blog.instagram.com/">블로그</a></li>
                            <li><a href="http://instagram.com/press/">관련 기사</a></li>
                            <li><a href="/developer/">API</a></li>
                            <li><a href="/about/jobs/">채용 정보</a></li>
                            <li><a href="/legal/privacy/">개인 정보 보호</a></li>
                            <li><a href="/legal/terms/">약관</a></li>
                        </ul>
                    </nav>

                    <p class="copyright">&copy; 2015 Kostagram</p>
                </div>
            </footer>
            
        
        <div id="reactModalMountPoint"></div>
    </div> <!-- .root -->
    
    

        
    
<script type="text/javascript">window._sharedData = {"static_root":"\/\/instagramstatic-a.akamaihd.net\/bluebar\/5829dff","entry_data":{"ReactComponent":[{"reactRoot":".rRrC0","componentName":null,"moduleName":"lib\/ui\/common\/FormLink","containerID":"rC0","props":{"text":"\ub85c\uadf8\uc544\uc6c3","href":"\/accounts\/logout\/"}},{"reactRoot":".rRrC1","componentName":null,"moduleName":"lib\/ui\/common\/FormLink","containerID":"rC1","props":{"text":"\ub85c\uadf8\uc544\uc6c3","href":"\/accounts\/logout\/"}}]},"hostname":"www.instagram.com","platform":"web","qe":{"su":{"p":{},"g":""}},"display_properties_server_guess":{"viewport_width":1143,"pixel_ratio":1.0},"country_code":"KR","language_code":"ko","gatekeepers":{"rhp":true,"addpp":true,"sfbf":true},"config":{"dismiss_app_install_banner_until":null,"viewer":{"username":"jaewoo18","website":"","profile_picture":"https:\/\/igcdn-photos-f-a.akamaihd.net\/hphotos-ak-xtp1\/t51.2885-19\/s150x150\/12317353_778068599005413_920942073_a.jpg","bio":"","has_profile_pic":true,"is_advertiser":false,"is_staff":false,"full_name":"","id":"2274463293"},"csrf_token":"6b8b715a6bc8ee8c7076912eaaff7167"},"environment_switcher_visible_server_guess":true};</script>
<script src="//instagramstatic-a.akamaihd.net/bluebar/5829dff/bundles/ko_KR_webpack-common.js" type="text/javascript"></script>
<script src="//instagramstatic-a.akamaihd.net/bluebar/5829dff/bundles/ko_KR_ReactComponent.js" type="text/javascript"></script>
        
<script>
!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
document,'script','//connect.facebook.net/en_US/fbevents.js');
fbq('init', '1425767024389221');
fbq('track', 'PageView');


</script>
<noscript>


</noscript>

    

    </body>
</html>
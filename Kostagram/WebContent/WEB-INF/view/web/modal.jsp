<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kostagram.service.beans.PhotoInfoVO"%>
<%@ page import="com.kostagram.service.beans.ArticleVO"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

<%
	ArticleVO article = (ArticleVO) request.getAttribute("article");
	HashMap userInfo = article.getUserInfo();
	PhotoInfoVO photo = article.getPhoto();
	List<HashMap> likeList = article.getLikeList();
	List<HashMap> commentList = article.getCommentList();
%>
<div class="modal fade bs-example-modal-lg in" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" style="display: flex; padding-right: 17px;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header"><%
				if ( userInfo.get("PROFILE") != null ) {
%>
					<img src='./personalImg/<%= userInfo.get("EMAIL") %>/<%= userInfo.get("PROFILE") %>.jpg' width='40' id='profileImg' style='-webkit-border-radius: 100px; border-radius: 100px;' />
<%
				} else {
%>
					<img src='./personalImg/profile.jpg' width='40' id='profileImg' style='-webkit-border-radius: 100px; border-radius: 100px;' />
<%
				}
%>
				<h4 class="modal-title" id="exampleModalLabel">
				<%= userInfo.get("NICKNAME") %>
				</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<img src='./personalImg/<%= userInfo.get("EMAIL")%>/<%= photo.getSeq_photo()%>.jpg' />
				<ul>
<%
				for ( int i = 0; i < commentList.size(); i++ ) {
					HashMap comment = commentList.get(i);
%>
					<li><a href='/Kostagram/<%= comment.get("NICKNAME") %>' ><%= comment.get("NICKNAME") %></a> <%= comment.get("CONTENT") %></li>
<%
				}
%>
				</ul>
			</div>
			<div class="modal-footer">댓글 남기기</div>
		</div>
	</div>
</div>
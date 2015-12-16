<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kostagram.service.beans.PhotoInfoVO"%>
<%@ page import="com.kostagram.service.beans.ArticleVO"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.List"%>

<%
	ArticleVO article = (ArticleVO) request.getAttribute("article");
	HashMap userInfo = article.getUserInfo();
	PhotoInfoVO photo = article.getPhoto();
	List<HashMap> commentList = article.getCommentList();
	
	System.out.println("commentList ="+commentList);
	System.out.println("article ="+article);

	String seq_photo = (String)commentList.get(0).get("SEQ_PHOTO");

%>

				<div id="cccomment"><ul>
<%
				for ( int i = 0; i < commentList.size(); i++ ) {
					HashMap comment = commentList.get(i);
%>
					<li><a href='/Kostagram/<%= comment.get("NICKNAME") %>' ><%= comment.get("NICKNAME") %></a> <%= comment.get("CONTENT") %></li>
<%
				}
%>
				</ul></div>

			
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page import="com.kostagram.service.beans.ArticleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
 <%
 	ArrayList<ArticleVO> articleList = (ArrayList<ArticleVO>) request.getAttribute("timeline");
 	
 System.out.println("article = " +articleList);
 %>

	<div id="ccomment">
<%
if (articleList == null || articleList.size() == 0) {

} else {
	for (int i = 0; i < articleList.size(); i++) {
		ArticleVO article = articleList.get(i);
		List<HashMap> commentList = article.getCommentList();
	
		if ( commentList != null && commentList.size() > 0 ) {
			for ( int j = 0; j < commentList.size(); j++ ) {
				HashMap comment = commentList.get(j);
%>
				<li><a href='./<%= comment.get("NICKNAME")%>'><%= comment.get("NICKNAME")%> </a>
<%
				String cmtContent = (String)comment.get("CONTENT");
				
				if ( cmtContent != null ) {
					StringTokenizer stk = new StringTokenizer(cmtContent);
					while(stk.hasMoreTokens()) {
						String token = stk.nextToken();
						if ( token.startsWith("#") ) {
%>
							<a href='./hashtag/<%= token.substring(1) %>'><%= token %></a>
<%
						} else if ( token.startsWith("@") ) {
%>
							<a href='./<%= token.substring(1) %>'><%= token %></a>
<%
						} else {
%>
							<%= token %>
<%
						}
					}
%>
				</li>
<%
				}
			}
		}
		
%>
	</div>
<%
	}
}
%>
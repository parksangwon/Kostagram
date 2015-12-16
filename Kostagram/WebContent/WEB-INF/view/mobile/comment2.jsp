<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>

<%
	List<HashMap> commentList = (List<HashMap>)request.getAttribute("commentList");
	
	String seq_photo = "";
	String session_email = (String)session.getAttribute("email");
	if (commentList.size() != 0)
	{
		HashMap comment2 = (HashMap)commentList.get(0);
		seq_photo = (String)comment2.get("SEQ_PHOTO");
	}
%>
		<table border="0" width="100%">
			<%
				if (commentList != null && commentList.size() > 0)
				{
					for ( HashMap comment : commentList ) 
						{
							String content = (String)comment.get("CONTENT");
							String nickname = (String)comment.get("NICKNAME");
							String email = (String)comment.get("EMAIL");
							String profile = (String)comment.get("PROFILE_IMG");
			%>
					<tr>
			<%
						if(profile == null)
						{
			%>
						<td ><img src="/Kostagram/personalImg/profile.jpg" width="35" style="-webkit-border-radius: 100px; border-radius: 100px;" /></td>
			<%
						}
						else
						{
			%>
						<td ><img src="/Kostagram/personalImg/<%=email %>/profile.jpg" width="35" style="-webkit-border-radius: 100px; border-radius: 100px;"></td>
			<%
						}
			%>
						<td> <a><%=nickname %></a></td>
						<td width="100%"><%= content %></td>
					</tr>
			<%
						}
				}
			%>	
		</table>
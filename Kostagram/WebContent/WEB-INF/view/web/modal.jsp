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
<script>
	function closePopUp()
	{
		$('#articleModal').empty();
		$('#articleModal').css('display', 'none' );
		
	}
</script>
<script>
//comment (댓글)

	$(function() {	
		$('#submit').click(function() {
			var comment_val = $('input:text[name=comment]').val();
			var seq_photo_val = $('input:hidden[name=seq_photo]').val();
			 $('input:text[name=comment]').val("");
			if(trim(comment_val) != ""){
				$.ajax({
					type:'POST',
					url:'ajaxgetArticleModal',
					 dataType:'html',
					data: {content:comment_val, seq_photo:seq_photo_val},
					success:function(html){
						$('#ccomment').empty();
						$('#ccomment').html(html);
					},
					error:function() {	
					}
				});
			}
		});
	});
//댓글 끝
</script>
<%
	ArticleVO article = (ArticleVO) request.getAttribute("article");
	HashMap userInfo = article.getUserInfo();
	PhotoInfoVO photo = article.getPhoto();
	List<HashMap> likeList = article.getLikeList();
	List<HashMap> commentList = article.getCommentList();

	String seq_photo = photo.getSeq_photo();

%>
<div class="modal fade bs-example-modal-lg in" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" style="display: flex; padding-right: 17px;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<form method="POST">
				<input type="hidden" value="<%=seq_photo%>" id="seq_photo" name="seq_photo">
			<div class="modal-header">

				<table border="0">
					<tr>
						<td>
<%
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
						</td>
						<td>
							<h4 class="modal-title" id="exampleModalLabel">
								&nbsp;&nbsp;&nbsp;<%= userInfo.get("NICKNAME") %>
							</h4>
						</td>
						<td width="740">
						</td>
						<td>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="closePopUp()">
								<span aria-hidden="true" >×</span>
							</button>
						</td>
					</tr>
				</table>
			</div>
			<div class="modal-body">
				<div align="center">
				<img src='./personalImg/<%= userInfo.get("EMAIL")%>/<%= photo.getSeq_photo()%>.jpg' width="600" />
				</div>
				<table border="1">
					<tr>
						<td width="130"></td>
					
						
						<td>
							<p><b><h4>좋아요 000개</h4></b></p>
							<div id="ccomment">
								<ul>
				<%
								if ( commentList != null && commentList.size() > 0 ) {
									for ( int i = 0; i < commentList.size(); i++ ) {
										HashMap comment = commentList.get(i);
				%>
									<li><a href='/Kostagram/<%= comment.get("NICKNAME") %>' ><%= comment.get("NICKNAME") %></a> <%= comment.get("CONTENT") %></li>
				<%
									}	
								}
				%>
								</ul>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<table border="0">
					<tr>
						<td><img src="./m/image/icon/heart.png">&nbsp;&nbsp;&nbsp;</td>
						<td width="90%"><input type="text" id="comment" name="comment" style="width:95%;"/></td>
						<td><input type="button" value="댓글 남기기" id="submit" name="submit"></td>
					</tr>
				</table>
			</div>
			</form>
		</div>
	</div>
</div>
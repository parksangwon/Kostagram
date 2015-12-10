package com.kostagram.service.beans;

import java.util.List;
import java.util.Properties;

public class ArticleVO {

	private PhotoInfoVO photo;
	private List<Properties> likeList;
	private List<Properties> commentList;

	public ArticleVO() {
		// TODO Auto-generated constructor stub
	}

	public List<Properties> getLikeList() {
		return likeList;
	}

	public void setLikeList(List<Properties> likeList) {
		this.likeList = likeList;
	}

	public List<Properties> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<Properties> commentList) {
		this.commentList = commentList;
	}

	public void setPhoto(PhotoInfoVO photo) {
		this.photo = photo;
	}

	public PhotoInfoVO getPhoto() {
		return photo;
	}
}

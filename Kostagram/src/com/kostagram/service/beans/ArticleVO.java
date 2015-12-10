package com.kostagram.service.beans;

import java.util.HashMap;
import java.util.List;

public class ArticleVO {

	private PhotoInfoVO photo;
	private List<HashMap> likeList;
	private List<HashMap> commentList;

	public ArticleVO() {
		// TODO Auto-generated constructor stub
	}

	public List<HashMap> getLikeList() {
		return likeList;
	}

	public void setLikeList(List<HashMap> likeList) {
		this.likeList = likeList;
	}

	public List<HashMap> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<HashMap> commentList) {
		this.commentList = commentList;
	}

	public void setPhoto(PhotoInfoVO photo) {
		this.photo = photo;
	}

	public PhotoInfoVO getPhoto() {
		return photo;
	}
}

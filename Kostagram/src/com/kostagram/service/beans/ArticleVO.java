package com.kostagram.service.beans;

import java.util.HashMap;
import java.util.List;

public class ArticleVO {

	private HashMap userInfo;
	private PhotoInfoVO photo;
	private List<HashMap> likeList;
	private List<HashMap> commentList;

	public ArticleVO() {
		// TODO Auto-generated constructor stub
	}

	public HashMap getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(HashMap userInfo) {
		this.userInfo = userInfo;
	}

	public PhotoInfoVO getPhoto() {
		return photo;
	}

	public void setPhoto(PhotoInfoVO photo) {
		this.photo = photo;
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

	@Override
	public String toString() {
		return "ArticleVO [userInfo=" + userInfo + ", photo=" + photo
				+ ", likeList=" + likeList + ", commentList=" + commentList
				+ "]";
	}
	
}

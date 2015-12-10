package com.kostagram.service.beans;

import java.util.Date;
import java.util.List;

public class ArticleVO {

    private PhotoInfoVO photo;
    private List<LikeVO> like;
    private List<CommentVO> comment;

    public ArticleVO() {
	// TODO Auto-generated constructor stub
    }

    public List<LikeVO> getLike() {
	return like;
    }

    public void setLike(List<LikeVO> like) {
	this.like = like;
    }

    public List<CommentVO> getComment() {
	return comment;
    }

    public void setComment(List<CommentVO> comment) {
	this.comment = comment;
    }

    public void setPhoto(PhotoInfoVO photo) {
	this.photo = photo;
    }

    public PhotoInfoVO getPhoto() {
	return photo;
    }
}

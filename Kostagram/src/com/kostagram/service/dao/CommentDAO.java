package com.kostagram.service.dao;

import java.util.List;

import com.kostagram.service.beans.CommentVO;

public interface CommentDAO {
	public boolean insert(CommentVO comment);
	public boolean delete(CommentVO comment);
	public List<CommentVO> getCommentByPhotoId(CommentVO comment);
}

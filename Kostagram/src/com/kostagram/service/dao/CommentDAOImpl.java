package com.kostagram.service.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kostagram.service.beans.CommentVO;
import com.kostagram.service.beans.UserInfoVO;

public class CommentDAOImpl implements CommentDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean insert(CommentVO comment) {
		int insert= sqlSession.insert("comment.insert",comment);
		if(insert==1)return true;
		
		return false;
	}
	
	@Override
	public boolean delete(CommentVO comment) {
		return false;
	}
	
	@Override
	public List<HashMap> getCommentByPhotoId(String pid) {
		List<HashMap> getCommentByPhotoId = sqlSession.selectList("comment.getCommentByPhotoId", pid);
		return getCommentByPhotoId;
	}
}

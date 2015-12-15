package com.kostagram.service.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kostagram.service.beans.LikeVO;

public class LikeDAOImpl implements LikeDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean insert(LikeVO like) {
		int insert= sqlSession.insert("like.insert",like);
		if(insert==1)return true;
		
		return false;
	}
	
	@Override
	public HashMap check(LikeVO like)
	{
		return sqlSession.selectOne("like.check", like);
	}
	
	@Override
	public boolean delete(LikeVO like) {
		int delete= sqlSession.delete("like.delete",like);
		if(delete==1)return true;
		
		return false;
	}
	
	
	

	
}

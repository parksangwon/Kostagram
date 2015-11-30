package com.kostagram.service.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kostagram.service.beans.FollowVO;

public class FollowDAOImpl implements FollowDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean insert(FollowVO follow) {
		int insert= sqlSession.insert("follow.insert",follow);
		if(insert==1)return true;
		
		return false;
	}
	
	@Override
	public boolean delete(FollowVO follow) {
		return false;
	}
	
	
}

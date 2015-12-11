package com.kostagram.service.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kostagram.service.beans.FollowVO;
import com.kostagram.service.beans.UserInfoVO;

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
	public boolean delete(String email) {
		int delete= sqlSession.delete("follow.delete",email);
		if(delete==1)return true;
		return false;
	}
	
	@Override
	public FollowVO check(FollowVO follow)
	{
		
		return sqlSession.selectOne("follow.check", follow);
	}

	@Override
	public int getMyFollowing(UserInfoVO user) {
		return sqlSession.selectOne("follow.getMyFollowing", user);
	}

	@Override
	public int getMyFollower(UserInfoVO user) {
		return sqlSession.selectOne("follow.getMyFollower", user);
	}
	
}

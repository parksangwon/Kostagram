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
	public boolean delete(FollowVO follow) {
		return false;
	}
	
	@Override
	public FollowVO check(FollowVO follow)
	{
		
		return sqlSession.selectOne("follow.check", follow);
	}

	@Override
	public int getMyFollowing(UserInfoVO user) {
		HashMap count = sqlSession.selectOne("follow.getMyFollowing", user);
		return (int)count.get("COUNT");
	}

	@Override
	public int getMyFollower(UserInfoVO user) {
		HashMap count = sqlSession.selectOne("follow.getMyFollower", user);
		return (int)count.get("COUNT");
	}
	
}

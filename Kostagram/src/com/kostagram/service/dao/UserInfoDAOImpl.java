package com.kostagram.service.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kostagram.service.beans.UserInfoVO;

public class UserInfoDAOImpl implements UserInfoDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean insert(UserInfoVO user) {
		int insert= sqlSession.insert("user.insert",user);
		if(insert==1)return true;
		
		return false;
	}
	
	@Override
	public boolean update(UserInfoVO user) {
		return false;
	}
	
	@Override
	public boolean login(UserInfoVO user) {
		return false;
	}
	
	@Override
	public boolean select(UserInfoVO user) {
		return false;
	}
	
	
	

}

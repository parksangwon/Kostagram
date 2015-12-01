package com.kostagram.service.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kostagram.service.beans.UserInfoVO;

public class UserInfoDAOImpl implements UserInfoDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean insert(UserInfoVO user) {
		int insert= sqlSession.insert("userInfo.insert",user);
		if(insert==1)return true;
		
		return false;
	}
	
	@Override
	public boolean update(UserInfoVO user) {
		return false;
	}
	
	@Override
	public UserInfoVO finduser(String nickname) {
		return sqlSession.selectOne("userInfo.finduser", nickname);
	}
	
	@Override
	public List<UserInfoVO> findList(String token) {
		return sqlSession.selectList("userInfo.findList",token);
	}
	
	@Override
	public boolean pwCheck(String pw){
		return sqlSession.selectOne("userInfo.pwCheck", pw);
	}

	@Override
	public boolean pwUpdate(String pw) {
		return false;
	}
	
}

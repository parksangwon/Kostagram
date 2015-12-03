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
		System.out.println("DAO sysout : " + user);
		int insert= sqlSession.insert("userInfo.insert",user);
		if(insert==1)return true;
		
		return false;
	}
	
	@Override
	public boolean update(UserInfoVO user) {
		return false;
	}
	
	@Override
	public UserInfoVO findEmail(UserInfoVO user) {
		return sqlSession.selectOne("userInfo.findEmail", user);
	}
	
	@Override
	public UserInfoVO findNickname(UserInfoVO user) {
		return sqlSession.selectOne("userInfo.findNickname", user);
	}
	
	@Override
	public List<UserInfoVO> findEmailAndNickname(UserInfoVO user) {
		return sqlSession.selectList("userInfo.findEmailAndNickname", user);
	}
	
	@Override
	public List<UserInfoVO> findList(String token) {
		return sqlSession.selectList("userInfo.findList",token);
	}
	
	@Override
	public boolean pwCheck(UserInfoVO user){
		return sqlSession.selectOne("userInfo.pwCheck", user);
	}

	@Override
	public boolean pwUpdate(UserInfoVO user) {
		return false;
	}
	
}

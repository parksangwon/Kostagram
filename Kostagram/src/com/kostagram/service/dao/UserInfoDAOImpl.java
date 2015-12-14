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
	int insert = sqlSession.insert("userInfo.insert", user);
	if (insert == 1)
	    return true;

	return false;
    }

    @Override
    public boolean update(UserInfoVO user) {
    	int update =  sqlSession.update("userInfo.update", user);
    	if(update == 1)
    		return true;
    	
	return false;
    }

    @Override
    public UserInfoVO findEmail(UserInfoVO user) {
	return sqlSession.selectOne("userInfo.findEmail", user);
    }
    
    @Override
    public UserInfoVO findPass(UserInfoVO user) {
	return sqlSession.selectOne("userInfo.findPass", user);
    }

    @Override
    public UserInfoVO findNickname(UserInfoVO user) {
	System.out.println("UserDAO : " + user);
	return sqlSession.selectOne("userInfo.findNickname", user);
    }

    @Override
    public UserInfoVO findUser(String token) {
	UserInfoVO user = sqlSession.selectOne("userInfo.findUser", token);
	return user;
    }

    @Override
    public List<UserInfoVO> findList(String token) {
	return sqlSession.selectList("userInfo.findList", token);
    }

    @Override
    public boolean pwCheck(UserInfoVO user) {
	return sqlSession.selectOne("userInfo.pwCheck", user);
    }

    @Override
    public boolean pwUpdate(UserInfoVO user) {
    	int update =  sqlSession.update("userInfo.pwupdate", user);
    	if(update == 1)
    	return true;
    	
	return false;
    }

}

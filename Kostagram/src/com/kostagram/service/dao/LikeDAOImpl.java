package com.kostagram.service.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kostagram.service.beans.ActivityVO;
import com.kostagram.service.beans.LikeVO;
import com.kostagram.service.beans.PhotoInfoVO;
import com.kostagram.service.beans.UserInfoVO;

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
	public boolean delete(LikeVO like) {
		return false;
	}
	
	@Override
    public List<PhotoInfoVO> selectList(UserInfoVO user) {
	List<PhotoInfoVO> selectList = sqlSession.selectList("activity.selectList", user);
	return selectList;
    }
	

	
}

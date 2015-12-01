package com.kostagram.service.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kostagram.service.beans.PhotoInfoVO;
import com.kostagram.service.beans.UserInfoVO;

public class PhotoInfoDAOImpl implements PhotoInfoDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean insert(PhotoInfoVO photo) {
		int insert= sqlSession.insert("photoInfo.insert",photo);
		if(insert==1)return true;
		
		return false;
	}
	@Override
	public boolean delete(PhotoInfoVO photo) {
		return false;
	}
	
	@Override
	public boolean update(PhotoInfoVO photo) {
		return false;
	}
	

	@Override
	public List<PhotoInfoVO> getTimeline() {
		return sqlSession.selectList("photoInfo.getTimeline");
	}
}

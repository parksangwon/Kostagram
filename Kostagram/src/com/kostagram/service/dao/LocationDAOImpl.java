package com.kostagram.service.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kostagram.service.beans.LocationVO;
import com.kostagram.service.beans.UserInfoVO;

public class LocationDAOImpl implements LocationDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean insert(LocationVO location) {
		int insert= sqlSession.insert("location.insert",location);
		if(insert==1)return true;
		
		return false;
	}
	
	@Override
	public List<HashMap> findPhotoMap(UserInfoVO user) {
		return sqlSession.selectList("location.findPhotoMap",user);
	}
	
}

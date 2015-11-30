package com.kostagram.service.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kostagram.service.beans.ActivityVO;

public class ActivityDAOImpl implements ActivityDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean insert(ActivityVO activity) {
		
		int result = sqlSession.insert("activity.insert", activity);
		if ( result == 1 ) 
			return true;
		return false;
	}
}

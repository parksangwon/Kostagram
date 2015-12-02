package com.kostagram.service.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kostagram.service.beans.ActivityVO;
import com.kostagram.service.beans.UserInfoVO;

public class ActivityDAOImpl implements ActivityDAO {

    @Autowired
    private SqlSession sqlSession;

    public boolean insert(ActivityVO activity) {

	int result = sqlSession.insert("activity.insert", activity);
	if (result == 1)
	    return true;
	return false;
    }

    @Override
    public List<ActivityVO> activityList(UserInfoVO user) {
	List<ActivityVO> activityList = sqlSession.selectList("activity.selectList", user);
	return activityList;
    }

}

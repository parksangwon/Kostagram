package com.kostagram.service.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kostagram.service.beans.ReportItemVO;

public class ReportItemDAOImpl implements ReportItemDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean insert(ReportItemVO reportItem) {
		int insert= sqlSession.insert("reportItem.insert",reportItem);
		if(insert==1)return true;
		
		return false;
	}
	
	@Override
	public boolean delete(ReportItemVO reportItem) {
		return false;
	}
	
	@Override
	public boolean update(ReportItemVO reportItem) {
		return false;
	}
}

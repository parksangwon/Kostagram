package com.kostagram.service.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kostagram.service.beans.ReportVO;

public class ReportDAOImpl implements ReportDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean insert(ReportVO report) {
		int insert= sqlSession.insert("report.insert",report);
		if(insert==1)return true;
		
		return false;
	}
	
	@Override
	public List<ReportVO> findList(ReportVO report) {
		return sqlSession.selectList("report.findList",report);
	}
}

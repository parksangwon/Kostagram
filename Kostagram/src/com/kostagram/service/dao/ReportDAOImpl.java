package com.kostagram.service.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kostagram.service.beans.ReportVO;
import com.kostagram.service.beans.UserInfoVO;

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
	public List<HashMap> findList(ReportVO report) {
		List<HashMap> findList = sqlSession.selectList("report.findList", report);
		return findList;
	}
	
	@Override
	public boolean delete(ReportVO report) {
		int delete= sqlSession.delete("report.delete",report);
		if(delete==1)return true;
		
		return false;
	}
}

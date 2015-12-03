package com.kostagram.service.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kostagram.service.beans.SearchVO;
import com.kostagram.service.beans.SearchVO2;

public class SearchDAOImpl implements SearchDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SearchVO> select(SearchVO2 searchVO2) {
		return sqlSession.selectList("search.findlist", searchVO2);
	}
	
	
}

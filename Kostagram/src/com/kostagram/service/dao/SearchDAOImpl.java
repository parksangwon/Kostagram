package com.kostagram.service.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kostagram.service.beans.SerachVO;

public class SearchDAOImpl implements SearchDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SerachVO> select(String sw) {
		
			List<SerachVO> list = sqlSession.selectList("search.findlist", sw);
		
		return list;
	}
	
	
}

package com.kostagram.service.dao;

import java.util.List;

import com.kostagram.service.beans.SearchVO;

public interface SearchDAO {
	public List<SearchVO> select(SearchVO searchVO);
}

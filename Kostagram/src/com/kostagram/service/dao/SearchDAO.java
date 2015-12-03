package com.kostagram.service.dao;

import java.util.List;

import com.kostagram.service.beans.SearchVO;
import com.kostagram.service.beans.SearchVO2;

public interface SearchDAO {
	public List<SearchVO> select(SearchVO2 searchVO2);
}

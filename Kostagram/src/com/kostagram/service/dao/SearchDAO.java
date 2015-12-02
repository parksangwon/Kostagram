package com.kostagram.service.dao;

import java.util.List;

import com.kostagram.service.beans.SerachVO;

public interface SearchDAO {
	public List<SerachVO> select(String sw);
}

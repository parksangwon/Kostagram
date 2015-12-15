package com.kostagram.service.dao;

import java.util.HashMap;

import com.kostagram.service.beans.LikeVO;

public interface LikeDAO {
	public boolean insert(LikeVO like);
	public boolean delete(LikeVO like);
	public HashMap check(LikeVO like);
}

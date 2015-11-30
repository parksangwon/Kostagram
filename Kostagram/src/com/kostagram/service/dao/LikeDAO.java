package com.kostagram.service.dao;

import com.kostagram.service.beans.LikeVO;

public interface LikeDAO {
	public boolean insert(LikeVO like);
	public boolean delete(LikeVO like);
}

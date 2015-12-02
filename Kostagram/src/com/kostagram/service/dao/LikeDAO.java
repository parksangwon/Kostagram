package com.kostagram.service.dao;

import java.util.List;

import com.kostagram.service.beans.LikeVO;
import com.kostagram.service.beans.PhotoInfoVO;
import com.kostagram.service.beans.UserInfoVO;

public interface LikeDAO {
	public boolean insert(LikeVO like);
	public boolean delete(LikeVO like);
}

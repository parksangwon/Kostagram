package com.kostagram.service.dao;

import java.util.List;

import com.kostagram.service.beans.PhotoInfoVO;
import com.kostagram.service.beans.UserInfoVO;

public interface PhotoInfoDAO {
	public boolean insert(PhotoInfoVO photo);
	public boolean update(PhotoInfoVO photo);
	public boolean delete(PhotoInfoVO photo);
	public List<PhotoInfoVO> getTimeline(String email);
	public List<PhotoInfoVO> selectList(UserInfoVO user);
}

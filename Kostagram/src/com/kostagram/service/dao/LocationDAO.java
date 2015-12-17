package com.kostagram.service.dao;

import java.util.HashMap;
import java.util.List;

import com.kostagram.service.beans.LocationVO;
import com.kostagram.service.beans.PhotoInfoVO;
import com.kostagram.service.beans.UserInfoVO;

public interface LocationDAO {
	
	public boolean insert(LocationVO location);
	public List<HashMap> findPhotoMap(UserInfoVO user);
	public List<HashMap> searchLocation(String location);
	public List<PhotoInfoVO> selectPlace(String location);
	public List<HashMap> selectLocationMap();
}

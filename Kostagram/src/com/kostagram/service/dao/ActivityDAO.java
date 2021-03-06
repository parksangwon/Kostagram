package com.kostagram.service.dao;

import java.util.HashMap;
import java.util.List;

import com.kostagram.service.beans.ActivityVO;
import com.kostagram.service.beans.UserInfoVO;

public interface ActivityDAO {
	public boolean insert(ActivityVO activity);
	public List<ActivityVO> activityList(UserInfoVO user);
	public List<HashMap> mynewsList(UserInfoVO user);
	public List<HashMap> followingList(UserInfoVO user);
	public List<HashMap> mylikeList(UserInfoVO user);
	public List<HashMap> roundList(UserInfoVO user);
	public List<HashMap> round_profileList(UserInfoVO user);
}

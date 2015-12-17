package com.kostagram.service.dao;

import java.util.HashMap;
import java.util.List;

import com.kostagram.service.beans.FollowVO;
import com.kostagram.service.beans.UserInfoVO;

public interface FollowDAO {
	public boolean insert(FollowVO follow);
    public boolean delete(String email); //프로필수정
    public FollowVO check(FollowVO follow);
	public int getMyFollowing(UserInfoVO user);
	public int getMyFollower(UserInfoVO user);
	public List<HashMap> getMyFollowingNickname(HashMap hashmap);
	public List<HashMap> getMyFollowerNickname(HashMap hashmap);
}

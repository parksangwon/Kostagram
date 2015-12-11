package com.kostagram.service.dao;

import com.kostagram.service.beans.FollowVO;
import com.kostagram.service.beans.UserInfoVO;

public interface FollowDAO {
	public boolean insert(FollowVO follow);
    public boolean delete(FollowVO follow); //�����ʼ���
    public FollowVO check(FollowVO follow);
	public int getMyFollowing(UserInfoVO user);
	public int getMyFollower(UserInfoVO user);
}

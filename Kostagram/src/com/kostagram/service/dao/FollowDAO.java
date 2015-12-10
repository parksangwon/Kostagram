package com.kostagram.service.dao;

import com.kostagram.service.beans.FollowVO;

public interface FollowDAO {
	public boolean insert(FollowVO follow);
    public boolean delete(FollowVO follow); //프로필수정
    public FollowVO check(FollowVO follow);
    

}

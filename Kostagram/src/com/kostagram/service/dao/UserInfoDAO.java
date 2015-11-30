package com.kostagram.service.dao;

import java.util.List;

import com.kostagram.service.beans.UserInfoVO;

public interface UserInfoDAO {
	public boolean insert(UserInfoVO user);
    public boolean update(UserInfoVO user); //프로필수정
    public boolean login(UserInfoVO user); //로그인
    public boolean select(UserInfoVO user); //회원 불러오기
	

}

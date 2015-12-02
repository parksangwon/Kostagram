package com.kostagram.service.dao;

import java.util.List;

import com.kostagram.service.beans.UserInfoVO;

public interface UserInfoDAO {
	public boolean insert(UserInfoVO user);
    public boolean update(UserInfoVO user); //프로필수정
    public UserInfoVO findUser(String nickname); //유저,로그인
    public List<UserInfoVO> findList(String token); //검색 리스트(%a%)
    public boolean pwCheck(String pw);
    public boolean pwUpdate(String pw);
}

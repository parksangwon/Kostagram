package com.kostagram.service.dao;

import java.util.List;

import com.kostagram.service.beans.UserInfoVO;

public interface UserInfoDAO {
	public boolean insert(UserInfoVO user);
    public boolean update(UserInfoVO user); //�����ʼ���
    public UserInfoVO findEmail(UserInfoVO user); //����,�α���
    public UserInfoVO findPass(UserInfoVO user); //����,�α���
    public UserInfoVO findNickname(UserInfoVO user);
    public UserInfoVO findUser(String token);
    public List<UserInfoVO> findList(String token); //�˻� ����Ʈ(%a%)
    public boolean pwCheck(UserInfoVO user);
    public boolean pwUpdate(UserInfoVO user);
}

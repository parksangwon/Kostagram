package com.kostagram.service.dao;

import java.util.List;

import com.kostagram.service.beans.UserInfoVO;

public interface UserInfoDAO {
	public boolean insert(UserInfoVO user);
    public boolean update(UserInfoVO user); //�����ʼ���
    public UserInfoVO findUser(String nickname); //����,�α���
    public List<UserInfoVO> findList(String token); //�˻� ����Ʈ(%a%)
    public boolean pwCheck(String pw);
    public boolean pwUpdate(String pw);
}

package com.kostagram.service.dao;

import java.util.List;

import com.kostagram.service.beans.UserInfoVO;

public interface UserInfoDAO {
	public boolean insert(UserInfoVO user);
    public boolean update(UserInfoVO user); //�����ʼ���
    public boolean login(UserInfoVO user); //�α���
    public boolean select(UserInfoVO user); //ȸ�� �ҷ�����
	

}

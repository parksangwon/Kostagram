package com.kostagram.service.dao;

import java.util.List;

import com.kostagram.service.beans.ConversationVO;
import com.kostagram.service.beans.UserInfoVO;

public interface ConversationDAO {
    public boolean insert(ConversationVO newConversation);
    public boolean delete(ConversationVO deleteConversation);
    public boolean update(ConversationVO updateConversation);
    public List<ConversationVO> selectList(UserInfoVO user);
}

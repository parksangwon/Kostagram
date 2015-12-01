package com.kostagram.service.dao;

import java.util.List;

import com.kostagram.service.beans.ConversationReplyVO;
import com.kostagram.service.beans.ConversationVO;

public interface ConversationReplyDAO {
    public Boolean insert (ConversationReplyVO newConversationReply);
    public Boolean delete (ConversationReplyVO delConversationReply);
    public List<ConversationReplyVO> findAll (ConversationVO conversation);
}

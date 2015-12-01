package com.kostagram.service.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kostagram.service.beans.ConversationReplyVO;
import com.kostagram.service.beans.ConversationVO;

public class ConversationReplyDAOImpl implements ConversationReplyDAO{

    @Autowired
    private SqlSession sqlSession;
    
    @Override
    public Boolean insert(ConversationReplyVO newConversationReply) {
	int result = sqlSession.insert("conversationReply.insert", newConversationReply);
	if ( result == 1 )
	    return true;
	return false;
    }

    @Override
    public Boolean delete(ConversationReplyVO delConversationReply) {
	int result = sqlSession.delete("conversationReply.delete", delConversationReply);
	if ( result == 1 )
	    return true;
	return null;
    }

    @Override
    public List<ConversationReplyVO> findAll(ConversationVO conversation) {
	List<ConversationReplyVO> replyList = sqlSession.selectList("conversationReply.findAll", conversation);
	return replyList;
    }

}

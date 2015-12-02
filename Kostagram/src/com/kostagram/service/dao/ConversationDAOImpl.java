package com.kostagram.service.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kostagram.service.beans.ConversationVO;
import com.kostagram.service.beans.UserInfoVO;

public class ConversationDAOImpl implements ConversationDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public boolean insert(UserInfoVO user) {
	int result = sqlSession.insert("conversation.insert", user);
	if ( result == 1 )
	    return true;
	return false;
    }

    @Override
    public boolean delete(ConversationVO deleteConversation) {
	int result = sqlSession.delete("conversation.delete", deleteConversation);
	return false;
    }

    @Override
    public boolean update(ConversationVO updateConversation) {
	int result = sqlSession.update("conversation.update", updateConversation);
	return false;
    }

    @Override
    public List<ConversationVO> selectList(UserInfoVO user) {
	List<ConversationVO> convList = sqlSession.selectList("conversation.selectList", user);
	return convList;
    }

}

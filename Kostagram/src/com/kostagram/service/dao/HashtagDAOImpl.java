package com.kostagram.service.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kostagram.service.beans.HashtagVO;

public class HashtagDAOImpl implements HashtagDAO {

    @Autowired
    private SqlSession sqlSession;
    
    @Override
    public Boolean insert(HashtagVO hashtag) {
	int result = sqlSession.insert("hashtag.insert", hashtag);
	if ( result == 1 )
	    return true;
	return null;
    }

    @Override
    public Boolean update(HashtagVO hashtag) {
	int result = sqlSession.update("hashtag.update", hashtag);
	if ( result == 1 )
	    return true;
	return null;
    }

    @Override
    public List<HashtagVO> findHashtagList(HashtagVO token) {
	List<HashtagVO> hashtagList = sqlSession.selectList("hashtag.findAllByToken", token);
	return hashtagList;
    }

}

package com.kostagram.service.dao;

import java.util.List;

import com.kostagram.service.beans.HashtagVO;

public interface HashtagDAO {
    public Boolean insert(HashtagVO hashtag);
    public Boolean update(HashtagVO hashtag);
    public List<HashtagVO> findHashtagList(HashtagVO token);
}

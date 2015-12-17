package com.kostagram.service.dao;

import java.util.HashMap;
import java.util.List;

import com.kostagram.service.beans.HashtagVO;
import com.kostagram.service.beans.PhotoInfoVO;

public interface HashtagDAO {
    public Boolean insert(HashtagVO hashtag);
    public Boolean update(HashtagVO hashtag);
    public List<HashtagVO> findHashtagList(HashtagVO token);
    public List<HashtagVO> searchHashtag(HashtagVO hashtag);
    public List<PhotoInfoVO> selectHashtag(String hashtag);
    public List<HashMap> searchHashtagList(HashtagVO hashtag);
}

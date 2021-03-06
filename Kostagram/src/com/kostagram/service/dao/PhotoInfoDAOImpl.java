package com.kostagram.service.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kostagram.service.beans.ArticleVO;
import com.kostagram.service.beans.PhotoInfoVO;
import com.kostagram.service.beans.UserInfoVO;

public class PhotoInfoDAOImpl implements PhotoInfoDAO {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public boolean insert(PhotoInfoVO photo) {
	int insert = sqlSession.insert("photoInfo.insert", photo);
	if (insert == 1)
	    return true;

	return false;
    }
    @Override
    public PhotoInfoVO myseqPhoto(String email)
    {
    	return sqlSession.selectOne("photoInfo.myseqphoto", email);
    }

    @Override
    public boolean delete(PhotoInfoVO photo) {
	return false;
    }

    @Override
    public boolean update(PhotoInfoVO photo) {
	return false;
    }

    @Override
    public ArrayList<ArticleVO> getTimeline(UserInfoVO user) {
    	ArrayList<ArticleVO> timeline = new ArrayList<ArticleVO>();
    	
    	List<PhotoInfoVO> photoList = sqlSession.selectList("photoInfo.getTimeline", user);
    	for(PhotoInfoVO photo : photoList) {
    		HashMap userInfo = sqlSession.selectOne("userInfo.getProfileNicknameEmail", photo);
    	    List<HashMap> commentList = sqlSession.selectList("comment.getCommentByPhotoId", photo.getSeq_photo());
    	    List<HashMap> likeList = sqlSession.selectList("like.getLikeByPhotoId", photo);
    	    
    	    ArticleVO article = new ArticleVO();
    	    article.setUserInfo(userInfo);
    	    article.setPhoto(photo);
    	    article.setLikeList(likeList);
    	    article.setCommentList(commentList);
    	    
    	    timeline.add(article);
    	}
    	
    	return timeline;
    }

    @Override
    public List<PhotoInfoVO> selectList(UserInfoVO user) {
	List<PhotoInfoVO> selectList = sqlSession.selectList("photoInfo.selectList", user);
	return selectList;
    }

    @Override
    public List<PhotoInfoVO> getMyPhotoList(UserInfoVO user) {
	return sqlSession.selectList("photoInfo.getMyPhotoList", user);
    }

    @Override
    public ArrayList<ArticleVO> getMyPhotoListForArticle(UserInfoVO user) {
	ArrayList<ArticleVO> myPhotoList = new ArrayList<ArticleVO>(); 
	
	List<PhotoInfoVO> photoList = sqlSession.selectList("photoInfo.getMyPhotoList", user);
	for (PhotoInfoVO photo : photoList) {
		HashMap userInfo = sqlSession.selectOne("userInfo.getProfileNicknameEmail", photo);
	    List<HashMap> commentList = sqlSession.selectList("comment.getCommentByPhotoId", photo.getSeq_photo());
	    List<HashMap> likeList = sqlSession.selectList("like.getLikeByPhotoId", photo);
	    
	    ArticleVO article = new ArticleVO();
	    article.setUserInfo(userInfo);
	    article.setPhoto(photo);
	    article.setLikeList(likeList);
	    article.setCommentList(commentList);
	    
	    myPhotoList.add(article);
	}
	return myPhotoList;
    }

	@Override
	public int countMyPhoto(UserInfoVO user) {
		return sqlSession.selectOne("photoInfo.countMyPhoto", user);
	}

	@Override
	public ArticleVO getArticleByPhotoId(String pid) {
		ArticleVO article = null;
		PhotoInfoVO photo = sqlSession.selectOne("photoInfo.getArticleByPhotoId", pid);
		
		if ( photo != null ) {
			HashMap userInfo = sqlSession.selectOne("userInfo.getProfileNicknameEmail", photo);
			List<HashMap> commentList = sqlSession.selectList("comment.getCommentByPhotoId", photo.getSeq_photo());
		    List<HashMap> likeList = sqlSession.selectList("like.getLikeByPhotoId", photo);
		    
		    article = new ArticleVO();
		    article.setUserInfo(userInfo);
		    article.setPhoto(photo);
		    article.setLikeList(likeList);
		    article.setCommentList(commentList);
		}
	    return article;
	}
	
	@Override
	public List<HashMap> getUserInformation(String seq_photo) {
		return sqlSession.selectList("photoInfo.getUserInformation", seq_photo);
	}
	
	@Override
	public ArrayList<ArticleVO> getPhotoInfo(String seq_photo) {
		ArrayList<ArticleVO> getPhotoInList = new ArrayList<ArticleVO>(); 
		
	    List<HashMap> commentList = sqlSession.selectList("comment.getCommentByPhotoId", seq_photo);
	    List<HashMap> likeList = sqlSession.selectList("like.getLikeByPhotoId", seq_photo);
	    
	    ArticleVO article = new ArticleVO();
	    article.setLikeList(likeList);
	    article.setCommentList(commentList);
	    
	    getPhotoInList.add(article);
		return getPhotoInList;
	}
}

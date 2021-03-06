package com.kostagram.service.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kostagram.service.beans.ArticleVO;
import com.kostagram.service.beans.PhotoInfoVO;
import com.kostagram.service.beans.UserInfoVO;

public interface PhotoInfoDAO {
	public boolean insert(PhotoInfoVO photo);
	public boolean update(PhotoInfoVO photo);
	public boolean delete(PhotoInfoVO photo);
	public ArrayList<ArticleVO> getTimeline(UserInfoVO user);
	public List<PhotoInfoVO> selectList(UserInfoVO user);
	public List<PhotoInfoVO> getMyPhotoList(UserInfoVO user);
	public ArrayList<ArticleVO> getMyPhotoListForArticle(UserInfoVO user);
	public int countMyPhoto(UserInfoVO user);
	public ArticleVO getArticleByPhotoId(String pid);
	public List<HashMap> getUserInformation(String seq_photo);
	public ArrayList<ArticleVO> getPhotoInfo(String seq_photo);
	public PhotoInfoVO myseqPhoto(String email);
}

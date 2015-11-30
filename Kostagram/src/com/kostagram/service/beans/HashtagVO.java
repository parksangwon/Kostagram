package com.kostagram.service.beans;

import java.util.Date;

public class HashtagVO {
	private String hashtag;
	private long photo_cnt;
	private Date reg_date;
	public HashtagVO() {
		// TODO Auto-generated constructor stub
	}
	public HashtagVO(String hashtag, long photo_cnt, Date reg_date) {
		super();
		this.hashtag = hashtag;
		this.photo_cnt = photo_cnt;
		this.reg_date = reg_date;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public long getPhoto_cnt() {
		return photo_cnt;
	}
	public void setPhoto_cnt(long photo_cnt) {
		this.photo_cnt = photo_cnt;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "HashtagVO [hashtag=" + hashtag + ", photo_cnt=" + photo_cnt + ", reg_date=" + reg_date + "]";
	}
	
}

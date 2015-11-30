package com.kostagram.service.beans;

public class PhotoHashtag {
	private String seq_photo;
	private String hashtag;
	
	public PhotoHashtag() {
		// TODO Auto-generated constructor stub
	}

	public PhotoHashtag(String seq_photo, String hashtag) {
		super();
		this.seq_photo = seq_photo;
		this.hashtag = hashtag;
	}

	public String getSeq_photo() {
		return seq_photo;
	}

	public void setSeq_photo(String seq_photo) {
		this.seq_photo = seq_photo;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	@Override
	public String toString() {
		return "PhotoHashtag [seq_photo=" + seq_photo + ", hashtag=" + hashtag + "]";
	}
	
}

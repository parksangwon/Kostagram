package com.kostagram.service.beans;

public class PersonTagVO {
	private String seq_photo;
	private String email;
	
	public PersonTagVO() {
		// TODO Auto-generated constructor stub
	}

	public PersonTagVO(String seq_photo, String email) {
		super();
		this.seq_photo = seq_photo;
		this.email = email;
	}

	public String getSeq_photo() {
		return seq_photo;
	}

	public void setSeq_photo(String seq_photo) {
		this.seq_photo = seq_photo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "PersonTagVO [seq_photo=" + seq_photo + ", email=" + email + "]";
	}
	
}

package com.kostagram.service.beans;

import java.util.Date;

public class LikeVO {
	private String seq_like;
	private String seq_photo;
	private char dispYn;
	private String email;
	private Date reg_date;
	private Date upd_date;
	
	public LikeVO() {
		// TODO Auto-generated constructor stub
	}

	public LikeVO(String seq_like, String seq_photo, char dispYn, String email, Date reg_date, Date upd_date) {
		super();
		this.seq_like = seq_like;
		this.seq_photo = seq_photo;
		this.dispYn = dispYn;
		this.email = email;
		this.reg_date = reg_date;
		this.upd_date = upd_date;
	}

	public String getSeq_like() {
		return seq_like;
	}

	public void setSeq_like(String seq_like) {
		this.seq_like = seq_like;
	}

	public String getSeq_photo() {
		return seq_photo;
	}

	public void setSeq_photo(String seq_photo) {
		this.seq_photo = seq_photo;
	}

	public char getDispYn() {
		return dispYn;
	}

	public void setDispYn(char dispYn) {
		this.dispYn = dispYn;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getUpd_date() {
		return upd_date;
	}

	public void setUpd_date(Date upd_date) {
		this.upd_date = upd_date;
	}

	@Override
	public String toString() {
		return "LikeVO [seq_like=" + seq_like + ", seq_photo=" + seq_photo + ", dispYn=" + dispYn + ", email=" + email
				+ ", reg_date=" + reg_date + ", upd_date=" + upd_date + "]";
	}
	
}

package com.kostagram.service.beans;

import java.util.Date;

public class PhotoInfoVO {
	
	private String seq_photo;
	private String email;
	private String location_name;
	private String content;
	private Date reg_date;
	private Date upd_date;
	private char dispYn;
	
	public PhotoInfoVO() {
		// TODO Auto-generated constructor stub
	}

	public PhotoInfoVO(String seq_photo, String email, String location_name, String content,
			Date reg_date, Date upd_date, char dispYn) {
		super();
		this.seq_photo = seq_photo;
		this.email = email;
		this.location_name = location_name;
		this.content = content;
		this.reg_date = reg_date;
		this.upd_date = upd_date;
		this.dispYn = dispYn;
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

	public String getLocation_name() {
		return location_name;
	}

	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public char getDispYn() {
		return dispYn;
	}

	public void setDispYn(char dispYn) {
		this.dispYn = dispYn;
	}

	@Override
	public String toString() {
		return "PhotoInfoVO [seq_photo=" + seq_photo + ", email=" + email
				+ ", location_name=" + location_name + ", content=" + content + ", reg_date=" + reg_date + ", upd_date="
				+ upd_date + ", dispYn=" + dispYn + "]";
	}
	
}

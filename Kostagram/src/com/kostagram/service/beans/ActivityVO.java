package com.kostagram.service.beans;

import java.util.Date;

public class ActivityVO {
	private String from_email;
	private String to_email;
	private String seq_photo;
	private String kind;
	private char readYn;
	private Date reg_date;
	
	public ActivityVO() {
		// TODO Auto-generated constructor stub
	}

	public ActivityVO(String to_email) {
	    super();
	    this.to_email = to_email;
	}
	
	public ActivityVO(String from_email, String to_email, String seq_photo, String kind, char readYn, Date reg_date) {
		super();
		this.from_email = from_email;
		this.to_email = to_email;
		this.seq_photo = seq_photo;
		this.kind = kind;
		this.readYn = readYn;
		this.reg_date = reg_date;
	}

	public String getFrom_email() {
		return from_email;
	}

	public void setFrom_email(String from_email) {
		this.from_email = from_email;
	}

	public String getTo_email() {
		return to_email;
	}

	public void setTo_email(String to_email) {
		this.to_email = to_email;
	}

	public String getSeq_photo() {
		return seq_photo;
	}

	public void setSeq_photo(String seq_photo) {
		this.seq_photo = seq_photo;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public char getReadYn() {
		return readYn;
	}

	public void setReadYn(char readYn) {
		this.readYn = readYn;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "ActivityVO [from_email=" + from_email + ", to_email=" + to_email + ", seq_photo=" + seq_photo
				+ ", kind=" + kind + ", readYn=" + readYn + ", reg_date=" + reg_date + "]";
	}
	
}

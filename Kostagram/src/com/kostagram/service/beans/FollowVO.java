package com.kostagram.service.beans;

import java.util.Date;

public class FollowVO {
	private String from_email;
	private String to_email;
	private Date reg_date;
	
	public FollowVO() {
		// TODO Auto-generated constructor stub
	}

	public FollowVO(String from_email, String to_email, Date reg_date) {
		super();
		this.from_email = from_email;
		this.to_email = to_email;
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

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "FollowVO [from_email=" + from_email + ", to_email=" + to_email + ", reg_date=" + reg_date + "]";
	}
	
}

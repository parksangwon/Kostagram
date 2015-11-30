package com.kostagram.service.beans;

import java.util.Date;

public class ConversationVO {
	private String seq_cvs;
	private String from_email;
	private String to_email;
	private String reg_ip;
	private Date reg_time;
	private String status;
	
	public ConversationVO() {
		// TODO Auto-generated constructor stub
	}

	public ConversationVO(String seq_cvs, String from_email, String to_email, String reg_ip, Date reg_time,
			String status) {
		super();
		this.seq_cvs = seq_cvs;
		this.from_email = from_email;
		this.to_email = to_email;
		this.reg_ip = reg_ip;
		this.reg_time = reg_time;
		this.status = status;
	}

	public String getSeq_cvs() {
		return seq_cvs;
	}

	public void setSeq_cvs(String seq_cvs) {
		this.seq_cvs = seq_cvs;
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

	public String getReg_ip() {
		return reg_ip;
	}

	public void setReg_ip(String reg_ip) {
		this.reg_ip = reg_ip;
	}

	public Date getReg_time() {
		return reg_time;
	}

	public void setReg_time(Date reg_time) {
		this.reg_time = reg_time;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ConversationVO [seq_cvs=" + seq_cvs + ", from_email=" + from_email + ", to_email=" + to_email
				+ ", reg_ip=" + reg_ip + ", reg_time=" + reg_time + ", status=" + status + "]";
	}
	
}

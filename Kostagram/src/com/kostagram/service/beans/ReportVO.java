package com.kostagram.service.beans;

import java.util.Date;

public class ReportVO {
	private String seq_report;
	private String seq_photo;
	private String content_id;
	private Date reg_date;
	private String email;
	
	public ReportVO() {
		// TODO Auto-generated constructor stub
	}

	public ReportVO(String seq_report, String seq_photo, String content_id, Date reg_date, String email) {
		super();
		this.seq_report = seq_report;
		this.seq_photo = seq_photo;
		this.content_id = content_id;
		this.reg_date = reg_date;
		this.email = email;
	}

	public String getSeq_report() {
		return seq_report;
	}

	public void setSeq_report(String seq_report) {
		this.seq_report = seq_report;
	}

	public String getSeq_photo() {
		return seq_photo;
	}

	public void setSeq_photo(String seq_photo) {
		this.seq_photo = seq_photo;
	}

	public String getContent_id() {
		return content_id;
	}

	public void setContent_id(String content_id) {
		this.content_id = content_id;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "ReportVO [seq_report=" + seq_report + ", seq_photo=" + seq_photo + ", content_id=" + content_id
				+ ", reg_date=" + reg_date + ", email=" + email + "]";
	}
	
}

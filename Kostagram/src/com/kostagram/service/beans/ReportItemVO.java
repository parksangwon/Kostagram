package com.kostagram.service.beans;

import java.util.Date;

public class ReportItemVO {
	private int content_id;
	private String content;
	private Date reg_date;
	
	public ReportItemVO() {
		// TODO Auto-generated constructor stub
	}

	public ReportItemVO(int content_id, String content, Date reg_date) {
		super();
		this.content_id = content_id;
		this.content = content;
		this.reg_date = reg_date;
	}

	public int getContent_id() {
		return content_id;
	}

	public void setContent_id(int content_id) {
		this.content_id = content_id;
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

	@Override
	public String toString() {
		return "ReportItemVO [content_id=" + content_id + ", content=" + content + ", reg_date=" + reg_date + "]";
	}
	
}

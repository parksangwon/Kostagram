package com.kostagram.service.beans;

import java.util.Date;

public class CommentVO {
	private String seq_comment;
	private String seq_photo;
	private String content;
	private String email;
	private char dispYn;
	private Date reg_date;
	
	public CommentVO() {
		// TODO Auto-generated constructor stub
	}

	public CommentVO(String seq_comment, String seq_photo, String content, String email, char dispYn, Date reg_date) {
		super();
		this.seq_comment = seq_comment;
		this.seq_photo = seq_photo;
		this.content = content;
		this.email = email;
		this.dispYn = dispYn;
		this.reg_date = reg_date;
	}

	public String getSeq_comment() {
		return seq_comment;
	}

	public void setSeq_comment(String seq_comment) {
		this.seq_comment = seq_comment;
	}

	public String getSeq_photo() {
		return seq_photo;
	}

	public void setSeq_photo(String seq_photo) {
		this.seq_photo = seq_photo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public char getDispYn() {
		return dispYn;
	}

	public void setDispYn(char dispYn) {
		this.dispYn = dispYn;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "Comment [seq_comment=" + seq_comment + ", seq_photo=" + seq_photo + ", content=" + content + ", email="
				+ email + ", dispYn=" + dispYn + ", reg_date=" + reg_date + "]";
	}
	
}

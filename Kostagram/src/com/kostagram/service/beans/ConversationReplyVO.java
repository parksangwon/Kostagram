package com.kostagram.service.beans;

import java.util.Date;

public class ConversationReplyVO {
	private String seq_cvsre;
	private String email;
	private String context;
	private String reg_ip;
	private Date reg_time;
	private String status;
	private String seq_cvs;
	
	public ConversationReplyVO() {
	    // TODO Auto-generated constructor stub
	}

	public ConversationReplyVO(String seq_cvsre, String email, String context, String reg_ip, Date reg_time,
		String status, String seq_cvs) {
	    super();
	    this.seq_cvsre = seq_cvsre;
	    this.email = email;
	    this.context = context;
	    this.reg_ip = reg_ip;
	    this.reg_time = reg_time;
	    this.status = status;
	    this.seq_cvs = seq_cvs;
	}

	public String getSeq_cvsre() {
	    return seq_cvsre;
	}

	public void setSeq_cvsre(String seq_cvsre) {
	    this.seq_cvsre = seq_cvsre;
	}

	public String getEmail() {
	    return email;
	}

	public void setEmail(String email) {
	    this.email = email;
	}

	public String getContext() {
	    return context;
	}

	public void setContext(String context) {
	    this.context = context;
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

	public String getSeq_cvs() {
	    return seq_cvs;
	}

	public void setSeq_cvs(String seq_cvs) {
	    this.seq_cvs = seq_cvs;
	}

	@Override
	public String toString() {
	    return "ConversationReplyVO [seq_cvsre=" + seq_cvsre + ", email=" + email + ", context=" + context
		    + ", reg_ip=" + reg_ip + ", reg_time=" + reg_time + ", status=" + status + ", seq_cvs=" + seq_cvs
		    + "]";
	}
	
}

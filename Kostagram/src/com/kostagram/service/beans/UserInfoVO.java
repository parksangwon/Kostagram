package com.kostagram.service.beans;

import java.util.Date;

public class UserInfoVO {
	private String email;
	private String name;
	private String nickname;
	private String pass;
	private String mobile;
	private String message;
	private String profile_img;
	private char adminYn;
	private char useYn;
	private Date join_date;
	private Date upd_date;
	
	public UserInfoVO() {}

	public UserInfoVO(String email, String name, String nickname, String pass, String mobile, String message,
			String profile_img, char adminYn, char useYn, Date join_date, Date upd_date) {
		super();
		this.email = email;
		this.name = name;
		this.nickname = nickname;
		this.pass = pass;
		this.mobile = mobile;
		this.message = message;
		this.profile_img = profile_img;
		this.adminYn = adminYn;
		this.useYn = useYn;
		this.join_date = join_date;
		this.upd_date = upd_date;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

	public char getAdminYn() {
		return adminYn;
	}

	public void setAdminYn(char adminYn) {
		this.adminYn = adminYn;
	}

	public char getUseYn() {
		return useYn;
	}

	public void setUseYn(char useYn) {
		this.useYn = useYn;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public Date getUpd_date() {
		return upd_date;
	}

	public void setUpd_date(Date upd_date) {
		this.upd_date = upd_date;
	}

	@Override
	public String toString() {
		return "UserInfoVO [email=" + email + ", name=" + name + ", nickname=" + nickname + ", pass=" + pass
				+ ", mobile=" + mobile + ", message=" + message + ", profile_img=" + profile_img + ", adminYn="
				+ adminYn + ", useYn=" + useYn + ", join_date=" + join_date + ", upd_date=" + upd_date + "]";
	}

}

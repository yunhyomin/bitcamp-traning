package com.helloworld.vo;

import java.sql.Date;

public class MemberVO {
	int u_idx;
	String u_id;
	String pwd;
	String nickname;
	String name;
	String phone;
	Date birth;
 	String email;
 	String gender;	
 	
 	public MemberVO(int u_idx, String u_id, String pwd, String nickname, String name, String phone,
			Date birth, String email, String gender) {
		super();
		this.u_idx = u_idx;
		this.u_id = u_id;
		this.pwd = pwd;
		this.nickname = nickname;
		this.name = name;
		this.phone = phone;
		this.birth = birth;
		this.email = email;
		this.gender = gender;
	}

	public int getU_idx() {
		return u_idx;
	}



	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}



	public String getU_id() {
		return u_id;
	}



	public void setU_id(String u_id) {
		this.u_id = u_id;
	}



	public String getPwd() {
		return pwd;
	}



	public void setPwd(String pwd) {
		this.pwd = pwd;
	}



	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}




	public Date getBirth() {
		return birth;
	}



	public void setBirth(Date birth) {
		this.birth = birth;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	@Override
	public String toString() {
		return "MemberVO [u_idx=" + u_idx + ", u_id=" + u_id + ", pwd=" + pwd + ", nickname=" + nickname + ", name="
				+ name + ", phone=" + phone + ", birth=" + birth + ", email=" + email + ", gender="
				+ gender + "]";
	}
 	
 	
 	
 	
 	
}

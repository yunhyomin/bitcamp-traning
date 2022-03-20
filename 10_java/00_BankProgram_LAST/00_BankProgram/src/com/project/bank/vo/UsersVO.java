package com.project.bank.vo;

import java.sql.Date;

public class UsersVO {
	//필드
	private int userNo;
	private String userId;
	private String userPw;
	private String userName;
	private int phone;
	private String email;
	private String address;
	private String birth;
	private String exist;
	
	public UsersVO() {
		super();
	}

	public UsersVO(int userNo, String userId, String userPw, String userName, int phone, String email, String address,
			String birth) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.birth = birth;
	}

	public UsersVO(int userNo, String userId, String userPw, String userName) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
	}

	public String getExist() {
		return exist;
	}

	public void setExist(String exist) {
		this.exist = exist;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	@Override
	public String toString() {
		return  userNo + "\t" + userId + "\t" + userPw + "\t" + userName
				+ "\t" + phone + "\t" + email + "\t" + address + "\t" + birth;
	}
	
	
	
}

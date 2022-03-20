package com.mystudy.jdbc_member.vo;

public class MemberVO {
	private String id;
	private String name;
	private String passWord;
	private String phone;
	private String adress;
	
	public MemberVO(String id, String name, String passWord, String phone, String adress) {
		super();
		this.id = id;
		this.name = name;
		this.passWord = passWord;
		this.phone = phone;
		this.adress = adress;
	}

	public MemberVO(String id, String name, String passWord) {
		super();
		this.id = id;
		this.name = name;
		this.passWord = passWord;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", name=" + name + ", passWord=" + passWord 
				+ ", phone=" + phone + ", adress=" + adress + "]";
	}
	
	
}

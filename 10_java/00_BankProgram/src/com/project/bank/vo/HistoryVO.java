package com.project.bank.vo;

import java.sql.Date;

public class HistoryVO {
	private int no;
	private  Date dateTime;
	private String type;
	private int money;
	private String bankNO;
	
	
	public HistoryVO(int no, Date dateTime, String type, int money) {
		super();
		this.no = no;
		this.dateTime = dateTime;
		this.type = type;
		this.money = money;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Date getDateTime() {
		return dateTime;
	}
	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getBankNO() {
		return bankNO;
	}
	public void setBankNO(String bankNO) {
		this.bankNO = bankNO;
	}
	@Override
	public String toString() {
		return "HistoryVO [no=" + no + ", dateTime=" + dateTime + ", type=" + type + ", money=" + money + ", bankNO="
				+ bankNO + "]";
	}
	
	
	
}

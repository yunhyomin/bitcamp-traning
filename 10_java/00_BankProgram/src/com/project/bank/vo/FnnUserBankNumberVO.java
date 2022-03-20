package com.project.bank.vo;

//products, users, bankNumber테이블 조인 
public class FnnUserBankNumberVO {
	String userId;
	String fnnNo;
	String fnnType;
	String fnnName;
	Double rate;
	String keep;
	String bankNo;
	String empNo;
	String startDate;
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getFnnNo() {
		return fnnNo;
	}
	public void setFnnNo(String fnnNo) {
		this.fnnNo = fnnNo;
	}
	public String getFnnType() {
		return fnnType;
	}
	public void setFnnType(String fnnType) {
		this.fnnType = fnnType;
	}
	public String getFnnName() {
		return fnnName;
	}
	public void setFnnName(String fnnName) {
		this.fnnName = fnnName;
	}
	public Double getRate() {
		return rate;
	}
	public void setRate(Double rate) {
		this.rate = rate;
	}
	public String getKeep() {
		return keep;
	}
	public void setKeep(String keep) {
		this.keep = keep;
	}
	public String getBankNo() {
		return bankNo;
	}
	public void setBankNo(String bankNo) {
		this.bankNo = bankNo;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	@Override
	public String toString() {
		return "FnnUserBankNumberVO [userId=" + userId + ", fnnNo=" + fnnNo + ", fnnType=" + fnnType + ", fnnName="
				+ fnnName + ", rate=" + rate + ", keep=" + keep + ", bankNo=" + bankNo + ", empNo=" + empNo
				+ ", startDate=" + startDate + "]";
	}
	
	
	
	
	
}

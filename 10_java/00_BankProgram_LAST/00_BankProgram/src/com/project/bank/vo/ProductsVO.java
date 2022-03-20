package com.project.bank.vo;

public class ProductsVO {
	
	private String fnnNo;
	private String fnnType;
	private double rate;
	private String fnnName;
	private String empNo;
	private String keep;//(삭제의 개념) 진행/중단 둘중 하나만 적혀진다
	
	public ProductsVO() {
		
	}
	public ProductsVO(String fnnNo) {
		this.fnnNo = fnnNo;
	}
	public ProductsVO(String fnnNo, String fnnType, String fnnName, Double rate, String empNo, String keep) {
		this.fnnNo = fnnNo;
		this.fnnType = fnnType;
		this.fnnName = fnnName;
		this.rate = rate;
		this.empNo = empNo;
		this.keep = keep;
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
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public String getFnnName() {
		return fnnName;
	}
	public void setFnnName(String fnnName) {
		this.fnnName = fnnName;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	
	//?
	public String getKeep() {
		return keep;
	}

	public void setKeep(String keep) {
		this.keep = keep;
	}
	
	@Override
	public String toString() {
		return fnnNo + "\t" + fnnType + "\t" + fnnName + "\t" +rate +"\t"+empNo+"\t"+keep;
	}
}

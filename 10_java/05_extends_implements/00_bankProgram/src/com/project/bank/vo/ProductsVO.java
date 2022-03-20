package com.project.bank.vo;

public class ProductsVO {
	
	private String fnnNo;
	private String fnnType;
	private double rate;
	private String fnnName;
	String keep;//(삭제의 개념) 진행/중단 둘중 하나만 적혀진다
	int userNo;
	
	public ProductsVO(String fnnNo, String fnnType, double rate, String fnnName) {
		this.fnnNo = fnnNo;
		this.fnnType = fnnType;
		this.rate = rate;
		this.fnnName = fnnName;
	}
	public ProductsVO(String fnnNo, String fnnType, String fnnName, Double rate, int userNo, String keep) {
		super();
		this.fnnNo = fnnNo;
		this.fnnType = fnnType;
		this.fnnName = fnnName;
		this.rate = rate;
		this.userNo = userNo;
		this.keep = keep;
	}
	public ProductsVO() {
		
	}
	
	public ProductsVO(String fnnNo) {
		this.fnnNo = fnnNo;
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
	
	//?
	public String getView() {
		return keep;
	}

	public void setView(String view) {
		this.keep = view;
	}
	
	@Override
	public String toString() {
		return "ProductsVO [fnnNo=" + fnnNo + ", fnnType=" + fnnType + ", rate=" + rate + ", fnnName=" + fnnName + "]";
	}
}

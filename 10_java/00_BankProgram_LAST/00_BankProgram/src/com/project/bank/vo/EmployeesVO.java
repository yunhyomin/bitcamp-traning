package com.project.bank.vo;

public class EmployeesVO {
	private int empNo;
	private String empId;
	private String empPw;
	private String empName;
	private int hireDate;
	private String department;
	private String rank;
	private int empPhone;
	private String empAddress;
	private int empBirth;
	
	public EmployeesVO() {
		super();
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getEmpPw() {
		return empPw;
	}

	public void setEmpPw(String empPw) {
		this.empPw = empPw;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public int getHireDate() {
		return hireDate;
	}

	public void setHireDate(int hireDate) {
		this.hireDate = hireDate;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public int getEmpPhone() {
		return empPhone;
	}

	public void setEmpPhone(int empPhone) {
		this.empPhone = empPhone;
	}

	public String getEmpAddress() {
		return empAddress;
	}

	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}

	public int getEmpBirth() {
		return empBirth;
	}

	public void setEmpBirth(int empBirth) {
		this.empBirth = empBirth;
	}

	@Override
	public String toString() {
		return "EmployeesVO [empNo=" + empNo + ", empId=" + empId + ", empPw=" + empPw + ", empName=" + empName
				+ ", hireDate=" + hireDate + ", department=" + department + ", rank=" + rank + ", empPhone=" + empPhone
				+ ", empAddress=" + empAddress + ", empBirth=" + empBirth + "]";
	}
	
}

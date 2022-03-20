package com.project.bank.viewer;

import com.project.bank.comtroller.EmployeesController;
import com.project.bank.vo.EmployeesVO;

public class EmployeesViewer {
	EmployeesVO employee;
	
	public EmployeesViewer()
	{
		employee = new EmployeesVO();
	}
	public void empLogIn()
	{
		
	}
	//고객조회
	public void printTotalUsers()
	{
		System.out.println("==============================================");
		System.out.println("NO.\tID\tPW\tNAME\tPHONE\tEMAIL\tADDRESS\tBIRTH");
		EmployeesController.printUsers();
		System.out.println("==============================================");
	}
	//상품조회--
	public void printTotalFnn()
	{
		System.out.println("==============================================");
		System.out.println("NO.\tTYPE\tNAME\tRATE(%)\t진행여부\tUSER NO.");
		EmployeesController.printFnn();
		System.out.println("==============================================");
	}
}

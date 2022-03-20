package com.project.bank.comtroller;

import java.util.List;

import com.project.bank.dao.BankDAO;
import com.project.bank.vo.ProductsVO;
import com.project.bank.vo.UsersVO;

public class EmployeesController 
{
	static List<UsersVO> users = null;
	static List<ProductsVO> products = null;
	
	//고객정보열람 
	public static void printUsers() 
	{
		users = BankDAO.printAll();
		for(UsersVO vo: users) 
		{
		  System.out.println(vo);
		}
	}
	//상품조회 
	public static void printFnn()
	{
		products = BankDAO.printFnn();
		for(ProductsVO vo : products)
		{
			System.out.println(vo);
		}
	}

}

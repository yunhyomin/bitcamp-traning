package com.project.bank.comtroller;

import java.util.ArrayList;
import java.util.List;

import com.project.bank.dao.BankDAO;
import com.project.bank.vo.ProductsVO;
import com.project.bank.vo.UsersVO;
import com.project.bank.dao.ProductsDAO;

public class EmployeesController 
{
	static List<UsersVO> users = null;
	static List<ProductsVO> products = null;
	static String NO = null;
	static String PW = null;
	static boolean ok;
	
	//직원로그인
	public static boolean logIn(String empNo,String empPw)
	{
		ok = false;
		if(BankDAO.empLogIn(empNo,empPw))
		{
				ok = true;
				//회원로그인 
				NO = empNo;
				PW = empPw;
		}
		return ok;
	}
	//직원 로그아웃 
	public static void logOut()
	{
		NO = null;
		PW = null;
	}
	
	//고객정보열람 
	public static void printUsers() 
	{
		users = BankDAO.printAll();
		for(UsersVO vo: users) 
		{
		  System.out.println(vo);
		}
	}
	//상품조회 (모두)
	public static void printFnn()
	{	
		products = ProductsDAO.selectAll();
		if(products != null) 
		{
			for(ProductsVO vo : products)
			{
				System.out.println(vo);
			}
		}else {
			System.out.println("아무상품도 등록되어있지 않습니다");

		}
	}
	//상품등록
	public static boolean insert(ProductsVO pvo) 
	{
		ok = false;
		if(ProductsDAO.insertProducts(pvo,NO)==1)
		{
			ok=true;
		}
		return ok;
	}
	//상품수정
	public static boolean update(ProductsVO pvo) {
		ok = false;
		if(ProductsDAO.updateProducts(pvo,NO)==1)
		{
			ok = true;
		}
		return ok;
	}
	//상품번호가 있는지 확인 
		public static boolean check(String fnnNo) {
			boolean check = false;
			
			if(ProductsDAO.check(fnnNo))
			{	
				check = true;
			}
	        return check;
	    }
	//상품삭제
	public static boolean delete(String deleteNo) 
	{
		boolean result = false;
		if(ProductsDAO.deleteProducts(deleteNo)==1){
			result = true;
		}
		return result;
	}
}

package com.project.bank.comtroller;

import java.util.List;


import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.project.bank.dao.BankDAO;
import com.project.bank.dao.HistoryDAO;
import com.project.bank.vo.FnnUserBankNumberVO;
import com.project.bank.vo.HistoryVO;
import com.project.bank.vo.ProductsVO;
import com.project.bank.vo.UsersVO;

public class UsersController{
	String ID = null;
	String PW = null;
	UsersVO user = null;

	public UsersController() {
		
	}
	//회원가입 
	public boolean resister(UsersVO user) 
	{
		boolean resister = false;
		if(BankDAO.insert(user)==1)
		{
			resister = true;
		}
		return resister;
	}
	
	// 같은아이디가 존재하면 true,아니면 false리턴하는 아이디중복검사메소드
	public boolean validateUserId(String userId) 
	{
		boolean exist = false;
		List<String> list = BankDAO.existId();
		if(list.contains(userId))
		{
			exist = true;
		}
		return exist;
	}
	// db에 아이디와 패스워드가 일치하면 true
	public boolean logIn(String id, String pw) 
	{
		boolean in = false;
		if (BankDAO.selectIdPw(id, pw)) {
			in = true;
			// 회원로그인
			ID = id;
			PW = pw;
		}
		return in;
	}

	// 이름과 전화번호로 아이디찾기
	public String findId(String name, int phone) 
	{
		String id = BankDAO.findId(name, phone);
		return id;
	}

	// 아이디와 이름으로 비밀번호찾기
	public String findPw(String id, String name) 
	{
		String pw = BankDAO.findPw(id, name);
		return pw;
	}
	//로그아웃
	public void logOut()
	{
		ID = null;
		PW = null;
	}

	// 로그인회원 정보조회
	public UsersVO selectOne() 
	{
		user = BankDAO.selectOne(ID, PW);
		return user;
	}
	//로그인한 회원 정보수정
	//비밀번호
	public UsersVO updatePw(String pw) 
	{
		int rs = BankDAO.updatePw(ID,PW,pw);
		if(rs==1) {
			user.setUserPw(pw);
			PW = pw;
		}
		return user;
	}
	//이름
	public UsersVO updateName(String name) 
	{
		int rs = BankDAO.updateName(ID,PW,name);
		if(rs==1) {
			user.setUserPw(name);
		}
		return user;
	}
	//전화번호
	public UsersVO updatePhone(int phone) 
	{
		int rs = BankDAO.updatePhone(ID,PW,phone);
		if(rs==1) {
			user.setPhone(phone);
		}
		return user;
	}
	//이메일
	public UsersVO updateEmail(String email) 
	{
		int rs = BankDAO.updateEmail(ID,PW,email);
		if(rs==1) {
			user.setEmail(email);
		}
		return user;
	}
	//주소
	public UsersVO updateAddress(String address) 
	{
		int rs = BankDAO.updateAddress(ID,PW,address);
		if(rs==1) {
			user.setAddress(address);
		}
		return user;
	}
	//생년월일
	public UsersVO updateBirth(String birth) 
	{
		int rs = BankDAO.updateBirth(ID,PW,birth);
		if(rs==1) {
			user.setBirth(birth);
		}
		return user;
	}
	//회원탈퇴 
	public boolean deleteUser()
	{
		boolean del = false;
		if(BankDAO.deleteUser(ID,PW)==1)
		{
			del = true;
			ID = null;
			PW = null;
		}
		return del;
	}
	//새상품목록조회 --고객이 보는목록
	public List<ProductsVO> newFnn()
	{
		List<ProductsVO> list = null;
			list = BankDAO.newFnn();
		return list;
	}
	
	//상품가입으로 인한 계좌테이블에 추가되는 데이터 
	public boolean insertBN(String fnnNo)
	{	boolean upd= false;
		if(BankDAO.insertBN(fnnNo,ID)==1)
		{
			upd = true;
		}
		return upd;
	}
	//상품해지로 인해 가입한 상품삭제(계좌테이블에서 삭제함)
	public boolean deleteBN(String bankNo)
	{
		boolean del = false;
		if(BankDAO.deleteBN(bankNo,ID)==1)
		{
			del = true;
		}
		return del;
	}
	
	//로그인한 유저가 가입되어있는 상품의 목록 
	public List<FnnUserBankNumberVO> joinFnn()
	{
		List<FnnUserBankNumberVO> fubs = BankDAO.joinFnn(ID);
		return fubs;
	}
//================================================================================
	//잔액조회
	public int cash(String bankNo)
	{
		int cashIn = HistoryDAO.cashIn(bankNo);
		int cashOut = HistoryDAO.cashOut(bankNo);
		return cashIn-cashOut;
	}
	//계좌 입금 
	public boolean deposit(int money,String bankNo)
	{
		boolean dep = false;
		if(HistoryDAO.deposit(money,bankNo)==1)
		{
			dep = true;
		}
		return dep;
	}
	//계좌출금
	public boolean withdraw(int money,String bankNo)
	{
		boolean with = false;
		if(HistoryDAO.withdraw(money,bankNo)==1)
		{
			with = true;
		}
		return with;
	}
	//계좌내역조회 
	public ArrayList<HistoryVO> showHistory(String bankNo)
	{
		ArrayList<HistoryVO> list = new ArrayList<>();
		if(HistoryDAO.showHistory(bankNo)!=null)
		{
			list = HistoryDAO.showHistory(bankNo);
		}
		
		return list;
	}
}








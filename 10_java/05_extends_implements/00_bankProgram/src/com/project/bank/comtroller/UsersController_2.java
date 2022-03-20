package com.project.bank.comtroller;

import java.util.List;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.project.bank.dao.BankDAO;
import com.project.bank.vo.FnnUserBankNumberVO;
import com.project.bank.vo.UsersVO;

public class UsersController_2 {
	String ID = null;
	String PW = null;
	UsersVO user = null;

	public UsersController_2() {
		
	}
	//회원가입 
	public void resister(UsersVO user) 
	{
		BankDAO.insert(user);
	}

	
	// 같은아이디가 존재하면 true,아니면 false리턴하는 아이디중복검사메소드
	public boolean validateUserId(String userId) 
	{
		boolean exist = false;
		List<String> list = BankDAO.existId();
		System.out.println(list);
//		System.out.println();
		for (String id : list) {
			if (id.equalsIgnoreCase(userId)) {
				exist = true;
			}
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
	//새상품목록조회 
	public List<FnnUserBankNumberVO> newFnn()
	{
		List<FnnUserBankNumberVO> list=BankDAO.newFnn();
		if(list!=null)
		{
			for(FnnUserBankNumberVO vo : list)
			{
				System.out.println(vo.getFnnNo()+"\t"
									+vo.getFnnType()+"\t"
									+vo.getFnnName()+"\t");
			}
		}
		return list;
	}
}

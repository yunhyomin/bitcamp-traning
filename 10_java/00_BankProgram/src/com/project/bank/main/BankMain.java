package com.project.bank.main;

import com.project.bank.viewer.TotalViewer;

public class BankMain {

	public static void main(String[] args) {
//		
//		TotalViewer totalViewer = new TotalViewer();
//        totalViewer.showIndex();
        
        TotalViewer totalViewer = new TotalViewer();
        totalViewer.BankStart();

	}
	// (Y) -- not null

	// 1. 첫화면 [로그인, 회원가입, 종료]
	// 		1-1 로그인 필요정보 [아이디(직원-사번), 비밀번호]
	// 		1.2 회원가입 입력정보 [아이디(Y), 비밀번호(Y), 이름(Y), 전화번호, 이메일, 주소, 생년월일] 
	
	// 2. 로그인 or 회원가입 이후 보이는 메인 메뉴 [로그인정보를 이용하여 다른 메뉴 출력]
	//		2-1 고객일시 [계좌확인(가입상품목록), 상품가입, 정보수정, 탈퇴, 종료(로그아웃 후 종료)]
	//		2-1a 계좌확인 메뉴 클릭시 목록 출력 [ 1. 계좌번호 (계좌금액), 상품명
	//							 				  2. 계좌번호 (계좌금액), 상품명, 수익률or이율
	//											  3. 계좌번호 (계좌금액), 상품명, 수익률or이율, 위험등급 ]
	//											  -- 뒤로가기, 상품해지				
	//		2-1aa 계좌번호 클릭시 [입금, 출금, 거래내역, 메인메뉴(이동)]
	//		2-1aaa 거래내역 클릭시 입출금내역 - ( 입금만, 출금만, 기간검색)
	//		2-1b 상품가입 클릭시 목록을 보여주고 선택할 수 있게 한다. /  ((번호)상품이름)출력한 뒤 번호 입력시 가입
	//		2-1c 정보수정 클릭시 회원가입 입력정보란 불러와서 해당 회원db에 저장
	//		2-1d 탈퇴 클릭시 가입된 상품이 있는지 확인하고 없으면 회원삭제
	
	//		2-2 직원일시 [상품등록, 상품삭제, 상품목록, 고객목록, 종료(로그아웃 후 종료)]
	//		2-2a 상품등록 [상품번호(Y), 상품유형(목록제공), 이율, 상품명] / 상품테이블db에 저장
	//		2-2b 상품삭제 - 삭제하기, 가입고객이 있을시 불가?
	
	//		2-3c 상품목록을 클릭시 [ 1. 상품명, (상품 가입한 고객 수), 운영금액(?), 이율
	//								 2.
	//								 3.								] 목록을 보여준다. , 메인메뉴이동
	//				-- 운영금액은 해당 상품을 가입한 모든 고객들의 각각의 돈과 이율을 총합한 변동금액이고
	//			   이율은 현재 해당 상품의 이자율을 보여주는것.
	//
	//		2-4d 고객목록 클릭시 [고객명, 아이디, 생일] , 총 몇명인지 알려준다.
	//		
	
	
	}

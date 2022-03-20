package com.mystudy.scanner2_caffe;

import java.security.SecurityPermission;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/* 카페만들기
 음료의 종류
 1.아메리카노(3000원) 2.카페라떼(3500원) 3.카페모카(4000원) 4.과일주스(5000원)
 입력값 :  메뉴번호, 주문수량, 입금액(고객이 낸 돈)
 출력값 :  입금액, 판매액(단가+수량), 잔액(입금액-판매액)
 ----------------------------------------------------
 <메뉴>
 아메리카노  3000
 카페라떼   3500
 카페모카	  4000
 과일주스	  5000
 >메뉴를 선택하세요
 >주문수량
 >주문금액은 tatalMoney입니다.
 >입금액
 ===============
 입금액 : 
 판매액 : 
 잔액  :
 ----------------------------------------------------
 */
public class MyCaffe {
	Scanner scanner = new Scanner(System.in);
	private static final int AMERICANO = 3000;
	private static final int CAFFE_lATTE = 3500;
	private static final int CAFFE_MOCA = 4000;
	private static final int JUICE = 5000;
	
	private int inMoney;//입금액
	private int count;//주문수량
	private int change;//잔액(거스름돈)
	private int totalMoney;//판매액(선택메뉴금액*수량)
	
	private int income;//판매총액(판매액을 모두 더한 값)
	//-------------------------------------------------------
	private String selectedMenuName;//선택메뉴명
	private int selectedUnitPrice;//단가
	
	List<Integer> list = new ArrayList<>();
	public void caffeOpen() {
		System.out.println(">>> 카페를 오픈합니다!");
			isOpening();
		System.out.println(">>> 카페를 종료합니다~~");
	}
	
	private void isOpening() {
		while(true) {
		//메뉴보여주기
		showMenu();
		//메뉴선택 
		System.out.println(">>메뉴를 선택하세요> 1.아메리카노 2.카페라떼 3.카페모카 4.과일주스 0.종료");
		
		String choiceNum = scanner.nextLine();
		
		if("0".equals(choiceNum)){
				System.out.println("===================================");
				System.out.println(list+"\n");
				System.out.println("---------------------------------");
				System.out.println(">오늘 매출총액은 :"+ income +"입니다.");
				System.out.println("===================================");

			break;
		}
		//수량입력
		System.out.println(">>주문수량>");
		count = scanner.nextInt();
		
		//금액입력
		System.out.println(">>입금액(원)>");
		inMoney = scanner.nextInt();
		scanner.nextLine();//반복문이기 때문에 nextInt다음에 nextLine이 오기때문에 버퍼메모리를 삭제해준다.
		//계산처리
		//-판매액계산 
		computeMoney(choiceNum);
		
		//-잔액계산
		change = inMoney-totalMoney;
		System.out.println("거스름돈(잔액)은 "+change+"원 입니다.");
		
		//매출총액 계산
		
		list.add(totalMoney);
		income += totalMoney;
		
		//계산화면 출력
		display();
		
		}
		
	}
	void showMenu() {
		//메뉴출력
		System.out.println("<메뉴>");
		System.out.println("아메리카노 "+AMERICANO);
		System.out.println("카페라떼  "+CAFFE_lATTE);
		System.out.println("카페모카  "+CAFFE_MOCA);
		System.out.println("과일주스  "+JUICE);
	
	}
	
	private void display() {
		System.out.println("==========================");
		System.out.println("주문메뉴 : "+ selectedMenuName+"("+selectedUnitPrice+")");
		System.out.println("주문수량 : "+ count);
		System.out.println("입금액 : "+inMoney);
		System.out.println("--------------------------");
		System.out.println("판매액 : "+totalMoney);
		System.out.println("거스름돈 : "+ change);
		System.out.println("==========================");
		
	}
	private void computeMoney(String choiceNum) {
		if("1".equals(choiceNum)) {
			totalMoney = AMERICANO*count;
			selectedMenuName = "아메리카노";
			selectedUnitPrice = AMERICANO;
		}else if("2".equals(choiceNum)) {
			totalMoney = CAFFE_lATTE*count;
			selectedMenuName = "카페라떼";
			selectedUnitPrice = CAFFE_lATTE;
		}else if("3".equals(choiceNum)) {
			totalMoney = CAFFE_MOCA*count;
			selectedMenuName = "카페모카";
			selectedUnitPrice = CAFFE_MOCA;
		}else if("4".equals(choiceNum)) {
			totalMoney = JUICE*count;
			selectedMenuName = "과일주스";
			selectedUnitPrice = JUICE;
		}
		System.out.println("주문금액은 "+totalMoney+"원 입니다.");
	}
}





















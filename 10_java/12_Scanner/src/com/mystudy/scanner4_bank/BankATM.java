package com.mystudy.scanner4_bank;

import java.util.Scanner;

public class BankATM {
	private int money; // 통장 계좌(금액)
	private Scanner scanner = new Scanner(System.in);
	private int userChoice;
	private static final String ERROR_MESSAGE = "[예외발생] 잘못된 값이 입력되었습니다. 메뉴(0~3) 숫자만 입력해주세요.";

	public void startBank() {
		System.out.println(">> ATM 기계를 사용합니다");
		while (true) {
			if (!isRunningATM()) {
				System.out.println(">> ATM 기계 사용을 종료합니다.");
				scanner.close();
				break;
			}
		}
	}
	// ATM기계 동작
	private boolean isRunningATM() {
		boolean ATMContinue = true;
		menu();
		userChoice = -1;
		try {
			userChoice = Integer.parseInt(scanner.nextLine());
			if (userChoice > 3 || userChoice < 0) {
				System.out.println(ERROR_MESSAGE);
				return true;
			}
		} catch (NumberFormatException e) {
			System.out.println(ERROR_MESSAGE);
			return true;
		}
		if (1 == userChoice) {
			credit();
		}
		if (2 == userChoice) {
			withDraw();
		}
		if (3 == userChoice) {
			viewAccount();
		}
		if (0 == userChoice) {
			return false;
		}
		return ATMContinue;
	}

	void credit() {
		while (true) {
			System.out.print(">>입금액 : ");
			try {
				money += Integer.parseInt(scanner.nextLine());
				viewAccount();
				break;// 정상처리되었을때
			} catch (NumberFormatException e) {
				System.out.println("[예외발생]잘못된 금액입니다. 숫자(0~9)만 입력해주세요");
//				continue; 비정상 처리되었을때 다시 작업(생략가능) 
			}
//			break;이렇게 처리가 되었을때 continue; 는 필수로 적어준다.
		}
	}

	void withDraw() {
		viewAccount();
		while (true) {
			System.out.print(">>출금액 : ");
			int outMoney = -11;
			try {
				outMoney = Integer.parseInt(scanner.nextLine());
				if (money < outMoney) {
					System.out.println("통장잔고가 " + (outMoney - money) + "원 부족합니다. 다시 입력해주세요.");
					withDraw();
				} else {
					money -= outMoney;
					viewAccount();
				}
				break;//정상처리 되었을때 
			} catch (NumberFormatException e) {
				System.out.println("[예외발생]잘못된 금액입니다. 숫자(0~9)만 입력해주세요");
			}
		}
	}

	void menu() {
		System.out.println("--------------------------------------------");
		System.out.println("업무를 선택하세요 >>1.입금 2.출금 3.통장확인 0.종료");
		System.out.println("--------------------------------------------");
		System.out.print(">");
	}

	void viewAccount() {
		System.out.println("::통장금액 : " + money + "원");
	}
}
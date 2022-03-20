package com.mystudy.scanner3_scissors;

import java.util.Scanner;

/*****Scanner를 이용한 가위 바위 보 게임*****
 컴퓨터와 함꼐하는 가위(1),바위(2),보(3) 게임
 컴퓨터가 가위,바위,보를 선택 (Math.random() or Random )
 가위,바위,보 선택메뉴 출력
 선택 값 입력
 결과 비교 후 승자, 패자 결정
 (반복) 게임 반복 진행 0 선택시 종료
 ***************************************
 */
	 
public class ScissorsGame {
	private int computeChoice;//컴퓨터의 가위바위보 선택
	private int userChoice;//사용자의 가위바위보 선택
	private int gameChoice;//게임의 종류 선택
	private int computeWin =0;//컴퓨터 승리 수 
	private int userWin =0;//사용자 승리 수 
	
	Scanner scanner = new Scanner(System.in);
	
	void startGame() {
		System.out.println(">>>>가위바위보 게임을 시작합니다.");
		gaming();
		System.out.println("프로그램을 종료합니다.");
		}
	
	void gaming() {
		while(true) {
			System.out.println("1.한판만 하기 2.3판2선승제 3.5판3선승제 0.종료");
			gameChoice = scanner.nextInt();
			if(0==gameChoice) {
				System.out.println("프로그램을 종료합니다.");
				break;
			}else if(1==gameChoice) {
					choice();
					
			}else if(2==gameChoice) {
				while(true) {
					choice();
					if(userWin==2) {
						System.out.println("사용자"+userWin+": 컴퓨터"+computeWin+"입니다.");
						System.out.println("사용자가 최종 승리하셨습니다! 축하드려요 짝짝짝~~");
						break;
					}else if(computeWin==2) {
						System.out.println(userWin+":"+computeWin+"입니다.");
						System.out.println("컴퓨터가 최종 승리했습니다! 너무 실망하지마세요 다시 도전하세요!");
						break;
					}
				}
			}else if(3==gameChoice) {
				while(true) {
					choice();
					if(userWin>=3 ) {
						System.out.println("사용자"+userWin+": 컴퓨터"+computeWin+"입니다.");
						System.out.println("사용자가 최종 승리하셨습니다! 축하드려요 짝짝짝~~");
						break;
					}else if(computeWin>=3) {
						System.out.println(userWin+":"+computeWin+"입니다.");
						System.out.println("컴퓨터가 최종 승리했습니다! 너무 실망하지마세요 다시 도전하세요!");
						break;
					}
						
				}
			}	
			userWin = 0;
			computeWin = 0;
			//게임의 반복진행 여부 확인
			System.out.println("게임을 계속 하시겠습니까? y/n");
			scanner.nextLine();
			String yesNo = scanner.nextLine();
			if("n".equals(yesNo)) {
				break;
			}
	}
}
	
	void gameResult() {
		if(1==computeChoice) {
			if(1==userChoice) {
				System.out.println("비겼습니다!");
			}
			if(2==userChoice) {
				System.out.println("사용자 승!");
				userWin++;
			}
			if(3==userChoice) {
				System.out.println("컴퓨터 승!");
				computeWin++;
			}
		}if(2==computeChoice) {
			if(1==userChoice) {
				System.out.println("컴퓨터 승!");
				computeWin++;
			}
			if(2==userChoice) {
				System.out.println("비겼습니다!");
			}
			if(3==userChoice) {
				System.out.println("사용자 승!");
				userWin++;
			}
		}if(3==computeChoice) {
			if(1==userChoice) {
				System.out.println("사용자 승!");
				userWin++;
			}
			if(2==userChoice) {
				System.out.println("컴퓨터 승!");
				computeWin++;
			}
			if(3==userChoice) {
				System.out.println("비겼습니다!");
			}
	}

}
	void choice() {
		//컴퓨터가 가위바위보 선택
		computeChoice = (int)(Math.random()*3)+1;
		//사용자 메뉴출력
		System.out.println(">> 무엇을 낼 지 고르세요 1.가위 2.바위 3.보 ");
		//사용자가 가위바위보 선택입력
		userChoice = scanner.nextInt();
		
		String strComputer = "선택안함";
		if(computeChoice==1) {
			strComputer= "가위";
		}
		if(computeChoice==2) {
			strComputer="바위";
		}
		if(computeChoice==3) {
			strComputer="보";
		}
		
		String strUser ="선택안함";
		switch(userChoice) {
		case 1:
			strUser ="가위";
		case 2:
			strUser ="바위";
		case 3:
			strUser ="보";
		default :
			

		}

		//컴퓨터와 사용자의 선택결과 출력
		System.out.println("컴퓨터의 선택 : "+ strComputer);
		System.out.println("사용자의 선택 : "+ strUser);
		 
		
		//결과 비교 후 승자와 패자 결정
		gameResult();
		
		}
	}




















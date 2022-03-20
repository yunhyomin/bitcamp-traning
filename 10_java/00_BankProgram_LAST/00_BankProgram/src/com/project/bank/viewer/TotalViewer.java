package com.project.bank.viewer;

//회원가입,로그인,회원정보수정,회원탈퇴
import java.util.Scanner;

import com.project.bank.util.ScannerUtil;


public class TotalViewer {
	private UsersViewer usersViewer;
	private Scanner scanner;
	private String message;
	private EmployeesViewer employeesViewer;

	
	public TotalViewer() {
		usersViewer = new UsersViewer();
		scanner = new Scanner(System.in);
		employeesViewer = new EmployeesViewer();

	}

	public void BankStart()
	{
		while(true) {
			message = "1.고객  2.직원  3.프로그램종료";
			int choice = ScannerUtil.nextInt(scanner,message,1,3);
			if(choice==1)
			{	//고객로그인
				menu();
			}if(choice==2)
			{	//직원로그인
				empMenu();
			}if(choice==3)
			{
				//프로그램종료 
				String YN = ScannerUtil.nextLine(scanner,"정말로 종료 하시겠습니까? y/n");
	
				if (YN.equalsIgnoreCase("y")) 
				{
					System.out.println("--- 은행업무를 종료합니다 ---\n 이용해주셔서 감사합니다.");
					scanner.close();
					break;
				}
				if (YN.equalsIgnoreCase("n")) 
				{ 
				} else 
				{
					ScannerUtil.printMessage("잘못입력하셨습니다 다시 입력하세요!");
					YN = ScannerUtil.nextLine(scanner,"정말로 종료 하시겠습니까? y/n");
				}
			}
		}
	}
	//고객로그인
	private void menu()
	{
		while (true) 
		{
			message = "1.로그인  2.회원가입  3.뒤로가기";
			int userChoice = ScannerUtil.nextInt(scanner, message, 1, 3);
			if (userChoice == 1) 
			{
				// 로그인메소드
				int result = usersViewer.logIn();
				if(result == 1) 
				{
					logInMenu();
				}else 
				{
					//아이디비밀번호 찾기 
					usersViewer.findIdPw();
				}
			}
			if (userChoice == 2) 
			{
				// 회원가입메소드
				usersViewer.resister();
			}
			if(userChoice ==3)
			{
				BankStart();
			}
		}
	}
	private void logInMenu() 
	{
		while(true)
		{
			message = "1.마이페이지 2.새상품조회 3.로그아웃";
			int userChoice =ScannerUtil.nextInt(scanner,message,1,3);
			if(userChoice == 1) 
			{
				myPage();
			}if(userChoice ==2) 
			{
				//productsViewer.printList();	
				//새상품조회 
				usersViewer.selectFnn();//keep부분
				message = "새로운 상품에 가입하시겠습니까? Y / N";
				String YN = ScannerUtil.nextLine(scanner,message);
				if(YN.equalsIgnoreCase("y"))
				{
					usersViewer.insertBN();
					usersViewer.printJoinFnn();
				}
			}if(userChoice ==3) 
			{
				usersViewer.logOut();
				menu();
			}
		}
	}
	public void myPage()
	{
		while (true) 
		{
			message = "1.정보조회 및 수정 2.내상품 확인하기 3.회원탈퇴 4.뒤로가기";
			int userChoice = ScannerUtil.nextInt(scanner, message, 1, 4);
			if (userChoice == 1) 
			{   // 정보조회 및 수정
				usersViewer.printOne();
			}
			if (userChoice == 2) 
			{
				//가입한 상품목록
				usersViewer.printJoinFnn();
				message = "1.계좌조회 2.상품해지 3.뒤로가기";
				int y=ScannerUtil.nextInt(scanner,message,1,3);
				if(y==1) 
				{
					//계좌조회
					usersViewer.detailViewer();
				}
				if(y==2) 
				{
					//상품해지
					usersViewer.deleteBN();
				}
				if(y==3) 
				{
					myPage();
				}
			}
			if (userChoice == 3) 
			{	
				if(usersViewer.deleteUser())
				{
					menu();
				}
			}if(userChoice ==4) 
			{
				logInMenu();
			}
		}
	}
	//직원골랐을때 보이는 메뉴 
	public void empMenu()
	{
		while(true)
		{
			message = "1.로그인 2.뒤로가기";
			int empChoice = ScannerUtil.nextInt(scanner,message,1,2);
			if(empChoice==1)
			{	//로그인
				EmployeesViewer.empLogIn();
			}else {
				BankStart();
			}
		}
	}
}
	
	

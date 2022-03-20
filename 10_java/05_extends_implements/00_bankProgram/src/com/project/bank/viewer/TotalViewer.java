package com.project.bank.viewer;

//회원가입,로그인,회원정보수정,회원탈퇴
import java.util.Scanner;

import com.project.bank.util.ScannerUtil;


public class TotalViewer {
	private UsersViewer usersViewer;
	private Scanner scanner;
	private String message;
	private EmployeesViewer employeesViewer;
	private ProductsViewer productsViewer;
	
	public TotalViewer() {
		usersViewer = new UsersViewer();
		scanner = new Scanner(System.in);
		employeesViewer = new EmployeesViewer();
		productsViewer = new ProductsViewer();
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
			}else 
			{
				//프로그램종료 
				String YN = ScannerUtil.nextLine(scanner,"정말로 종료 하시겠습니까? y/n");
	
				if (YN.equalsIgnoreCase("y")) 
				{
					System.out.println("--- 은행업무를 종료합니다 ---\n 이용해주셔서 감사합니다.");
					scanner.close();
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
			else
			{
				break;
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
				//새상품조회 
				usersViewer.selectFnn();
			}if(userChoice ==3) 
			{
			
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
				//
			}
			if (userChoice == 3) 
			{	
				if(usersViewer.deleteUser())
				{
					menu();
				}

			}else {
				break;
			}
		}
		
	}
	public void empMenu()
	{
		while(true)
		{
			message = "1.로그인 2.직원등록 3.프로그램 종료";
			int empChoice = ScannerUtil.nextInt(scanner,message,1,3);
			if(empChoice==1)
			{	//로그인
				employeesViewer.empLogIn();
				message ="1. 상품조회 2. 고객조회 3. 종료";
				empChoice = ScannerUtil.nextInt(scanner,message,1,3);
				if(empChoice==1)
				{	//상품전체 조회 
					productsViewer.printAll();
				}if(empChoice==2)
				{	//고객전체 조회
					employeesViewer.printTotalUsers();
				}if(empChoice==3)
				{
//					System.out.println("종료되었습니다.");
//					logIn = null;
				}
			}
			
		}
	}
}
	
	

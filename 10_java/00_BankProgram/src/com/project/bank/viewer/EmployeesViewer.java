package com.project.bank.viewer;

import java.util.Scanner;

import com.project.bank.comtroller.EmployeesController;
import com.project.bank.comtroller.ProductsController;
import com.project.bank.util.ScannerUtil;
import com.project.bank.vo.EmployeesVO;
import com.project.bank.vo.ProductsVO;

public class EmployeesViewer {
 	static EmployeesVO employee;
	static String message;
	static Scanner scanner;
	static ProductsController productsController;
	static ProductsVO product;
	static TotalViewer totalViewer;
	public EmployeesViewer()
	{
		employee = new EmployeesVO();
		scanner = new Scanner(System.in);
	}
	//직원로그인
	public static void empLogIn()
	{//잠깐만 주석처리!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		while(true) {
			message = "직원 ID(사번)";
			String empNo = ScannerUtil.nextLine(scanner,message);
			message = "직원 PW";
			String empPw = ScannerUtil.nextLine(scanner,message);
			if(EmployeesController.logIn(empNo,empPw))
			{
				System.out.println("직원ID :"+empNo+"님 로그인되셨습니다");
				break;
			}else {
				System.out.println("ID와 PW를 다시한번 확인해주세요");
		}
		}
		empLogInMenu();
	}
	//로그인하고 보이는 메뉴 
	public static void empLogInMenu()
	{
		while(true)
		{
			message ="1.상품조회  2.고객조회  3.로그아웃";
			int empChoice = ScannerUtil.nextInt(scanner,message,1,3);
			if(empChoice==1)
			{	//상품전체 조회 
				//productsViewer.printAll();//조회 오류남 
				printTotalFnn();
			}if(empChoice==2)
			{	//고객전체 조회
				printTotalUsers();
			}if(empChoice==3)
			{
				totalViewer = new TotalViewer();
				//EmployeesController.logOut();
				totalViewer.empMenu();
			}
		}
	}
	//고객조회
	public static void printTotalUsers()
	{
		System.out.println("==============================================");
		System.out.println("NO.\tID\tPW\tNAME\tPHONE\tEMAIL\tADDRESS\tBIRTH");
		EmployeesController.printUsers();
		System.out.println("==============================================");
		
	}
	//상품조회--
	public static void printTotalFnn()
	{
		System.out.println("==============================================");
		System.out.println("NO.\tTYPE\tNAME\tRATE(%)\tEmployeesNo. \t진행여부");
		EmployeesController.printFnn();
		System.out.println("==============================================");
		message = "1. 상품등록 2. 상품정보수정 3. 상품삭제 4. 뒤로가기";
		int userChoice = ScannerUtil.nextInt(scanner, message, 1, 4);
		//totalViewer = new TotalViewer();
		if (userChoice == 1) {
			insert();
		} else if (userChoice == 2) {
			update();
		} else if (userChoice == 3) {
			delete();
		} else if (userChoice == 4) {
			empLogInMenu();
		}
	}
	//상품정보등록 
	private static void insert() 
	{
	    ProductsVO product = new ProductsVO();

	    message = "상품번호를 입력해주세요.";
	    String fnnNo = ScannerUtil.nextLine(scanner, message);
	    if(EmployeesController.check(fnnNo)) {
	    	System.out.println(fnnNo+"는 이미 존재하는 상품번호입니다. 다시 입력해주세요");
	    }
	    product.setFnnNo(fnnNo);
	        
	    message = "상품 유형을 입력해주세요.";
	    String fnnType = ScannerUtil.nextLine(scanner, message);
	    product.setFnnType(fnnType);
	        
	    message = "상품명을 입력해주세요";
	    String fnnName = ScannerUtil.nextLine(scanner, message);
	    product.setFnnName(fnnName);
	        
	    message = "이율을 설정해주세요";
	    Double rate = ScannerUtil.nextDouble(scanner, message);
	    product.setRate(rate);
	        
	    if(EmployeesController.insert(product))
	    {
	    	System.out.println("상품등록이 완료되었습니다.");
	    }
	        printTotalFnn();
	}
	//상품수정
	public static void update() {
		product = new ProductsVO();
		String message;
	
		message = "수정하실 상품번호를 입력해주세요";
		String fnnNo = ScannerUtil.nextLine(scanner, message);
		
		while (!EmployeesController.check(fnnNo)) 
		{
            message = "해당 상품번호는 없습니다 다시입력해주세요. 만약 수정을 원치 않으시면 x를 입력해주세요.";
            fnnNo = ScannerUtil.nextLine(scanner, message);
            if (fnnNo.equalsIgnoreCase("x")) {
                printTotalFnn();
            }
        }
		message = new String("새로운 상품명을 입력해주세요");
		String fnnName = ScannerUtil.nextLine(scanner, message);
		
		message = new String("새로운 상품이율을 입력해주세요");
		Double rate = ScannerUtil.nextDouble(scanner, message);
		
		message = new String("정말로 수정하시겠습니까? y/n");
		String yesNo = ScannerUtil.nextLine(scanner, message);
		
		if (yesNo.equalsIgnoreCase("y")) {
			ProductsVO pvo = new ProductsVO();
			pvo.setFnnName(fnnName);
			pvo.setRate(rate);
			pvo.setFnnNo(fnnNo);
			EmployeesController.update(pvo);
		} else {
			printTotalFnn();
		}
		printTotalFnn();
	}
	//상품삭제 
	public static void delete() {
//		ArrayList<ProductsVO> temp = productsController.selectOne();
//		selectOne(temp);
//		System.out.println(temp);
		String message = "삭제할 상품번호를 입력해주세요";
		String deleteNo = ScannerUtil.nextLine(scanner, message);
		
			while(!EmployeesController.check(deleteNo))
			{
				System.out.println("해당 상품번호는 없습니다 다시 입력해주세요");
				deleteNo = ScannerUtil.nextLine(scanner, message);
			}
			message = "정말로 삭제하시겠습니까? Y/N";
			String yesNo = ScannerUtil.nextLine(scanner,message);
			if(yesNo.equalsIgnoreCase("y"))
			{
				if(EmployeesController.delete(deleteNo))
				{
					System.out.println("상품번호 :"+deleteNo+"가 삭제되었습니다");
				}
			}else {
				printTotalFnn();
			}
//		if (deleteNo == FNNNO) {
//			String yesNo = ScannerUtil.nextLine(scanner, message);
//			if(yesNo.equalsIgnoreCase("y")) {
//				productsController.delete(FNNNO);
//				System.out.println("상품이 삭제되셨습니다");
//				printAll();
//			} else {
//				printAll();
//			}
//		} else {
//			System.out.println("잘못입력하셨습니다.");
//			delete(FNNNO);
//		}
		printTotalFnn();
	}
	
}

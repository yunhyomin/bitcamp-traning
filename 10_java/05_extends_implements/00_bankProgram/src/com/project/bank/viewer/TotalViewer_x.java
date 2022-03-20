package com.project.bank.viewer;

import java.util.Scanner;

import com.project.bank.util.ScannerUtil;
import com.project.bank.vo.UsersVO;


public class TotalViewer_x {
	private UserViewer_x userViewer;
	private Scanner scanner;
	private UsersVO logIn;
	private ProductsViewer productsViewer;
	
	public TotalViewer_x() {
        userViewer = new UserViewer_x();   
        productsViewer = new ProductsViewer();
        
        scanner = new Scanner(System.in);
    }
	
	public void showIndex() {
		System.out.println("프로그램 접속~~");
        String message = new String("1. 로그인 2. 회원가입 3. 종료");
        while (true) {
            int userChoice = ScannerUtil.nextInt(scanner, message);
            if (userChoice == 1) {
//            	logIn = userViewer.logIn();
            	System.out.println("로그인 아직 xxx");
            	showMenu();
            } else if (userChoice == 2) {
            	userViewer.register();
            } else if (userChoice == 3) {
                System.out.println("사용해주셔서 감사합니다.");
                scanner.close();
                break;
            }
        }
    }
	
	public void showMenu() {
		String message = new String("1. 상품조회 2. 고객조회 3. 종료");
		while (true) {
			int userChoice = ScannerUtil.nextInt(scanner, message);
			if (userChoice == 1) {
				
				productsViewer.printAll();
				
			} else if (userChoice == 2) {
				
			} else if (userChoice == 3 ) {
				System.out.println("종료되었습니다.");
				logIn = null;
			}
			
			if (logIn == null) {
				break;
			}
		}
	}
}

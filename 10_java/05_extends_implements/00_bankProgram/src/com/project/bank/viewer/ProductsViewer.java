package com.project.bank.viewer;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.project.bank.comtroller.ProductsController;
import com.project.bank.util.ScannerUtil;
import com.project.bank.vo.ProductsVO;


public class ProductsViewer {
	
	private Scanner scanner;
	private ProductsController productsController;
	private TotalViewer_x totalViewer;
	private ProductsVO pvo;
	
	public ProductsViewer() {
		productsController = new ProductsController();
		scanner = new Scanner(System.in);
		
	}
	
	
	public void printAll() {
		ArrayList<ProductsVO> temp = productsController.selectAll();
		printList(temp);
		String message;
		message = new String("1. 상품등록 2. 상품정보수정 3. 상품삭제 4. 뒤로가기");
		int userChoice = ScannerUtil.nextInt(scanner, message, 1, 4);
		totalViewer = new TotalViewer_x();
		if (userChoice == 1) {
			insert();
		} else if (userChoice == 2) {
			update();
		} else if (userChoice == 3) {
			delete();
		} else if (userChoice == 4) {
			totalViewer.showMenu();
		}
	}
	
	private void insert() {
        ProductsVO pvo = new ProductsVO();
        String message;

        message = new String("상품번호를 입력해주세요.");
        String fnnNo = ScannerUtil.nextLine(scanner, message);
        pvo.setFnnNo(fnnNo);

        // 상품을 만든 직원정보 필요??

        message = new String("상품 유형을 입력해주세요.");
        String fnnType = ScannerUtil.nextLine(scanner, message);
        pvo.setFnnType(fnnType);
        
        message = new String("상품명을 입력해주세요");
        String fnnName = ScannerUtil.nextLine(scanner, message);
        pvo.setFnnName(fnnName);
        
        message = new String("이율을 설정해주세요");
        Double rate = ScannerUtil.nextDouble(scanner, message);
        pvo.setRate(rate);
        
        productsController.insert(pvo);
        
        System.out.println("상품등록이 완료되었습니다.");
        printAll();
    }
		
	public void printList(ArrayList<ProductsVO> list) {
		System.out.println("=====================");

		if (list.isEmpty()) {
			System.out.println("등록된 상품이 없습니다.");
		System.out.println("=====================");	
		} else {
			System.out.println("=====================");
			System.out.println("상품번호   " + "상품명\t" + "상품종류    " + "상품이율");	
			for (ProductsVO pvo : list) {
				System.out.println(pvo.getFnnNo() +"\t"+ pvo.getFnnName() +"\t  " + pvo.getFnnType() +"       \t" + pvo.getRate());
				
			}
			System.out.println("=====================");	
		}
	}
	
	public void delete() {
//		ArrayList<ProductsVO> temp = productsController.selectOne();
//		selectOne(temp);
//		System.out.println(temp);
		String message = new String("삭제할 상품번호를 입력해주세요");
		int deleteNo = ScannerUtil.nextInt(scanner, message);
		
			productsController.delete(deleteNo);
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
		System.out.println();
	}
	
	public void update() {
		pvo = new ProductsVO();
		String message;
	
		message = new String("수정하실 상품번호를 입력해주세요");
		String fnnNo = ScannerUtil.nextLine(scanner, message);
		
		while (productsController.check(fnnNo)) {
            System.out.println("해당 상품번호는 없습니다 다시입력해주세요. ");
            fnnNo = ScannerUtil.nextLine(scanner, message);
//            System.out.println("만약 수정을 원치 않으시면 x를 입력해주세요.");
//            if (fnnNo.equalsIgnoreCase("x")) {
//                break;
//            }
            
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
			productsController.update(pvo);
		} else {
			printAll();
		}
		printAll();
	}
	
}

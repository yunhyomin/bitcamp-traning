package com.project.bank.viewer;

import java.util.Scanner;

import com.project.bank.comtroller.UserController;
import com.project.bank.util.ScannerUtil;
import com.project.bank.vo.UsersVO;

public class UserViewer_x {
	private Scanner scanner;
	private UserController userController;
	
	public UserViewer_x() {
        userController = new UserController();
        scanner = new Scanner(System.in);
    }
	
	public void register() {
        String message;
        UsersVO uvo = new UsersVO();

        // 사용할 username 입력
        message = new String("사용하실 아이디를 입력해주세요.");
        String userId = ScannerUtil.nextLine(scanner, message);

//        // username 검증
//        while (userController.validateUsername(userId)) {
//            System.out.println("해당 아이디는 사용하실 수 없습니다.");
//            System.out.println("만약 회원가입을 원치 않으시면 x를 입력해주세요.");
//            userId = ScannerUtil.nextLine(scanner, message);
//            if (userId.equalsIgnoreCase("x")) {
//                break;
//            }
//        }

        // username의 현재값이 대소문자 구분 없이 x가 아닐 경우
        if (!userId.equalsIgnoreCase("x")) {
            // 사용할 비밀번호 입력
            message = new String("사용하실 비밀번호를 입력해주세요.");
            String userPw = ScannerUtil.nextLine(scanner, message);

//            // 사용할 닉네임 입력
//            message = new String("사용하실 닉네임을 입력해주세요.");
//            String nickname = ScannerUtil.nextLine(scanner, message);
            message = new String("사용하실 이름를 입력해주세요.");
            String userName = ScannerUtil.nextLine(scanner, message);
            
            message = new String("사용하실 전화번호를 입력해주세요.");
            int phone = ScannerUtil.nextInt(scanner, message);
            
            message = new String("사용하실 이메일를 입력해주세요.");
            String email = ScannerUtil.nextLine(scanner, message);
            
            message = new String("사용하실 주소를 입력해주세요.");
            String address = ScannerUtil.nextLine(scanner, message);
            
//            message = new String("사용하실 비밀번호를 입력해주세요.");
//            String userPw = ScannerUtil.nextLine(scanner, message);
            
            // 입력 받은 값들을 u에 저장
            uvo.setUserId(userId);
            uvo.setUserPw(userPw);
            uvo.setUserName(userName);
            uvo.setPhone(phone);
            uvo.setEmail(email);
            uvo.setAddress(address);
            // 컨트롤러에 u 추가
            
            userController.insert(uvo);

        }
    }
    
}

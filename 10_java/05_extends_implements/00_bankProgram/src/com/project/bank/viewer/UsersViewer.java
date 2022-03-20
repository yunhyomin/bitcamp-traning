package com.project.bank.viewer;

//회원가입,로그인,회원정보수정,회원탈퇴
import java.util.Scanner;

import com.project.bank.comtroller.UsersController_2;
import com.project.bank.util.ScannerUtil;
import com.project.bank.vo.UsersVO;

public class UsersViewer 
{
	private Scanner scanner;
	private UsersController_2 usersController;
	private UsersVO user;

	public UsersViewer() 
	{
		usersController = new UsersController_2();
		scanner = new Scanner(System.in);
	}

	String message;
	String yn;

	// 회원가입
	public void resister() 
	{
		user = new UsersVO();
		String message;
		message = new String("사용하실 아이디를 입력해주세요");
		String userId = ScannerUtil.nextLine(scanner, message);
		// userId중복확인 중복일때 true가 리턴된다
		while (usersController.validateUserId(userId)) 
		{
			System.out.println("중복된 아이디입니다. 다른아이디로 입력해주세요");
			userId = ScannerUtil.nextLine(scanner, message);
		}
		message = new String("사용하실 비밀번호를 입력해주세요");
		String userPw = ScannerUtil.nextLine(scanner, message);
		message = new String("이름을 입력해주세요");
		String userName = ScannerUtil.nextLine(scanner, message);
		message = new String("전화번호를 입력해주세요 ('-'없이 숫자만)");
		int Phone = ScannerUtil.nextInt(scanner, message);
		message = new String("이메일을 입력해주세요");
		String email = ScannerUtil.nextLine(scanner, message);
		message = new String("주소를 입력해주세요");
		String address = ScannerUtil.nextLine(scanner, message);
		message = new String("생년월일을 입력해주세요 (형식 : yyyymmdd)");
		String birth = ScannerUtil.nextLine(scanner, message);

		user.setUserId(userId);
		user.setUserPw(userPw);
		user.setUserName(userName);
		user.setPhone(Phone);
		user.setEmail(email);
		user.setAddress(address);
		user.setBirth(birth);

		usersController.resister(user);
	}
	// 로그인
	public int logIn() 
	{
		int result = 0;
		int i = 1;
		while (i != 4) 
		{
			message = new String("ID: ");
			String id = ScannerUtil.nextLine(scanner, message);
			message = new String("PW: ");
			String pw = ScannerUtil.nextLine(scanner, message);
			if (usersController.logIn(id, pw)) 
			{
				System.out.println("로그인성공!");
				result = 1;
				break;
			} else 
			{
				System.out.println("로그인정보가 일치하지 않습니다!!(" + i + "/3)");
				i++;
			}
		}
		return result;
	}	
	// 아이디,비밀번호찾기
	public void findIdPw() {
		String id = null;
		int phone = 0;
		String name = null;
		String pw = null;
		System.out.println("로그인에 3번실패하셨습니다");
		message = "1.아이디찾기 2.비밀번호찾기 3.회원가입 4.메뉴로 돌아가기";
		int userChoice = ScannerUtil.nextInt(scanner, message, 1, 4);
		if (userChoice == 1) {
			System.out.println("<< ID찾기 >>");
			message = "이름을 입력해주세요";
			name = ScannerUtil.nextLine(scanner, message);
			message = "전화번호를 입력해주세요";
			phone = ScannerUtil.nextInt(scanner, message);

			id = usersController.findId(name, phone);
			if (id == null) {
				id = "일치하는 정보로 회원가입된 아이디가 존재하지 않습니다";
			}
			System.out.println("ID:" + id);
			message = "비밀번호를 찾으시겠습니까? y/n";
			yn = ScannerUtil.nextLine(scanner, message);
			if (yn.equalsIgnoreCase("y")) {
				userChoice = 2;
			}
		}
		if (userChoice == 2) {
			System.out.println("<< PW찾기 >>");
			message = "ID를 입력해주세요";
			id = ScannerUtil.nextLine(scanner, message);
			message = "이름을 입력해주세요";
			name = ScannerUtil.nextLine(scanner, message);

			pw = usersController.findPw(id, name);
			if (pw == null) {
				pw = "일치하는 정보로 회원가입된 비밀번호가 존재하지 않습니다";
			}
			System.out.println("PW:" + pw);

		}
		if (userChoice == 3) {
			resister();
		} else {

		}
	}
	//정보조회 및 수정 메소드 
	public void printOne()
	{
		while(true)
		{
			user = usersController.selectOne();
			System.out.println("====================");
			System.out.println("ID :" + user.getUserId());
			System.out.println("PW :" + user.getUserPw());
			System.out.println("NAME :" + user.getUserName());
			System.out.println("PHONE :" + user.getPhone());
			System.out.println("EMAIL :" + user.getEmail());
			System.out.println("ADDRESS :" + user.getAddress());
			System.out.println("BIRTH :" + user.getBirth());
			System.out.println("====================");
			message = "정보를 수정하시겠습니까? y/n";
			String yesNo = ScannerUtil.nextLine(scanner, message);
			if (yesNo.equalsIgnoreCase("y")) 
			{	
				message = "정보수정을 위해 비밀번호확인이 필요합니다 비밀번호를 입력해주세요";
				String update = ScannerUtil.nextLine(scanner,message);
				if(update.equals(user.getUserPw()))
				{
					message = "수정할 항목을 선택하세요 \n 1.비밀번호 2.이름 3.전화번호 4.email 5.주소 6.생년월일";
					int choice = ScannerUtil.nextInt(scanner, message, 1, 6);
					if (choice == 1) {
						message = new String("수정할 비밀번호");
						update = ScannerUtil.nextLine(scanner, message);
						user = usersController.updatePw(update);
					}
					if (choice == 2) {
						message = new String("수정할 이름");
						update = ScannerUtil.nextLine(scanner, message);
						user = usersController.updateName(update);
					}
					if (choice == 3) {
						message = new String("수정할 전화번호 ('-'빼고 입력)");
						int Phone = ScannerUtil.nextInt(scanner, message);
						user = usersController.updatePhone(Phone);
					}
					if (choice == 4) {
						message = new String("수정할 이메일");
						update = ScannerUtil.nextLine(scanner, message);
					}
					if (choice == 5) {
						message = new String("수정할 주소");
						update = ScannerUtil.nextLine(scanner, message);
					}
					if(choice == 6) {
						message = new String("수정할 생년월일 (형식 : yyyymmdd)");
						update = ScannerUtil.nextLine(scanner, message);
					}
				}
			}else {
				break;
			}
		}
	}
	//회원탈퇴
	public boolean deleteUser()
	{
		boolean del = false;
		System.out.println("<<현재 가입되어있는 상품의 목록>>");
		System.out.println("======================");
		//가입되어있는상품의 목록 출력 
		
		System.out.println("======================");
		message = "탈퇴하시면 가입상품들은 동시에 해지가 됩니다\n 정말로 탈퇴하시겠습니까? y/n";
		yn = ScannerUtil.nextLine(scanner,message);
		if(yn.equalsIgnoreCase("y"))
		{
			if(usersController.deleteUser())
			{
			del = true;
			System.out.println("회원의 탈퇴처리가 완료되었습니다!초기메뉴로 돌아갑니다");
			}
		}
		return del;
	}
	//새상품목록 조회 
	public void selectFnn()
	{
		System.out.println("========================");
		System.out.println("NO.\tType\tName");
		usersController.newFnn();
		System.out.println("========================");

	}
	

}

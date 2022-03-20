package com.project.bank.viewer;

import java.util.ArrayList;
import java.util.List;
//회원가입,로그인,회원정보수정,회원탈퇴
import java.util.Scanner;

import com.project.bank.comtroller.EmployeesController;
import com.project.bank.comtroller.UsersController;
import com.project.bank.util.ScannerUtil;
import com.project.bank.vo.FnnUserBankNumberVO;
import com.project.bank.vo.HistoryVO;
import com.project.bank.vo.ProductsVO;
import com.project.bank.vo.UsersVO;

public class UsersViewer 
{
	private Scanner scanner;
	private UsersController usersController;
	private UsersVO user;
	
	TotalViewer totalViewer;
	
	public UsersViewer() 
	{
		usersController = new UsersController();
		scanner = new Scanner(System.in);
	}

	String message;
	String yn;

	// 회원가입
	public void resister() 
	{
		user = new UsersVO();
		System.out.println("(*)표시가 된것은 필수입력사항입니다");
		String message;
		message = new String("*사용하실 아이디를 입력해주세요");
		String userId = ScannerUtil.nextLine(scanner, message);
		// userId중복확인 중복일때 true가 리턴된다
		while (usersController.validateUserId(userId)) 
		{
			 message = new String("중복된 아이디입니다. 다른아이디를 입력해주세요");
			userId = ScannerUtil.nextLine(scanner, message);
		}
		message = new String("*사용하실 비밀번호를 입력해주세요");
		String userPw = ScannerUtil.nextLine(scanner, message);
		message = new String("*이름을 입력해주세요");
		String userName = ScannerUtil.nextLine(scanner, message);
		message = new String("*전화번호를 입력해주세요 ('-'없이 숫자만)");
		int Phone = ScannerUtil.nextInt(scanner, message);
		message = new String("이메일을 입력해주세요");
		String email = ScannerUtil.nextLine(scanner, message);
		message = new String("주소를 입력해주세요");
		String address = ScannerUtil.nextLine(scanner, message);
		message = new String("*생년월일을 입력해주세요 (형식 : yyyymmdd)");
		String birth = ScannerUtil.nextLine(scanner, message);
		
		user.setUserId(userId);
		user.setUserPw(userPw);
		user.setUserName(userName);
		user.setPhone(Phone);
		user.setEmail(email);
		user.setAddress(address);
		user.setBirth(birth);

		if(usersController.resister(user))
		{
			System.out.println("[회원가입 성공] 회원가입을 축하드립니다!!");
			
		}
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
	//로그아웃
	public void logOut()
	{
		usersController.logOut();
		System.out.println("로그아웃되셨습니다 \n메뉴로 돌아갑니다 ");

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
		//가입된 상품목록 조회 메소드
		printJoinFnn();
		message = "탈퇴하시면 가입상품들은 자동으로 해지가 됩니다\n 정말로 탈퇴하시겠습니까? y/n";
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
	//가입된 상품목록 조회 
	public void printJoinFnn()
	{
		System.out.println("<<현재 가입되어있는 상품의 목록>>");
		System.out.println("계좌번호  \t상품번호 \t상품이름  \t상품유형 \t이율\t담당직원\t가입날짜");
		System.out.println("==============================================");
		//가입되어있는상품의 목록 출력 
		List<FnnUserBankNumberVO>fubs = usersController.joinFnn();
		if(fubs!=null)
		{
			for(FnnUserBankNumberVO fub : fubs)
			{
				System.out.println(fub.getBankNo()+"\t"
									+fub.getFnnNo()+"\t"
									+fub.getFnnName()+"\t"
									+fub.getFnnType()+"\t"
									+fub.getRate()+"\t"
									+fub.getEmpNo()+"\t"
									+fub.getStartDate()+"\t");
			}
		}else if(fubs==null){
			System.out.println("가입되어있는 상품이 없습니다");
		}System.out.println("=============================================");
	}
	//가입한 상품 계좌상세조회
	public void detailViewer()
	{
		 message = "상세조회하실 계좌번호를 입력하세요";
		 String bankNo = ScannerUtil.nextLine(scanner,message);
		 while(true)
		 {
			 message = "1.잔액조회 2.입금 3.출금 4.거래내역 5.뒤로가기";
			 int userChoice = ScannerUtil.nextInt(scanner,message,1,5);
			if (userChoice == 1) 
			{
				//잔액조회 
				int change = usersController.cash(bankNo);
				System.out.println("현재잔액 :"+change+"원");

			} else if (userChoice == 2) 
			{
				message = new String("입금하실 금액을 입력해주세요");
				int money = ScannerUtil.nextInt(scanner, message);
				usersController.deposit(money, bankNo);
				
			} else if (userChoice == 3) 
			{
				message = new String("출금하실 금액을 입력해주세요");
				int money = ScannerUtil.nextInt(scanner, message);
				if(usersController.withdraw(money, bankNo))
				{
					System.out.println(money+"원 이 출금되었습니다");
				}
				
			} else if (userChoice == 4)
			{
				ArrayList<HistoryVO> list = new ArrayList<>();
				if(usersController.showHistory(bankNo)!= null)
				{
					list = usersController.showHistory(bankNo);
					System.out.println("===================================");
					System.out.println("NO. \t거래날짜        \t거래유형\t금액");
					for(HistoryVO vo : list)
					{
						System.out.println(vo.getNo()+"\t"+vo.getDateTime()+"\t"+vo.getType()
											+"\t"+vo.getMoney());
					}
					System.out.println("===================================");

				}
			} else if (userChoice == 5) 
			{
				break;
			}
		 }
	}

	
	//새상품목록 조회 
	public void selectFnn()
	{
		List<ProductsVO> list = usersController.newFnn();
		System.out.println("===============================================");
		if(list.isEmpty())
		{
			System.out.println("등록된 상품이 없습니다.");
		}else {
			System.out.println("   NO.\tType\tName\t이율\t직원번호");
			for(ProductsVO vo : list)
			{
				System.out.println(vo.getFnnNo()+"\t"
									+vo.getFnnType()+"\t"
									+vo.getFnnName()+"\t"
									+vo.getRate()+"\t"
									+vo.getEmpNo());
			}
		}
		System.out.println("===============================================");

	}
	//상품가입 
	public void insertBN()
	{
		message = "가입하실 상품의 상품번호를 입력해주세요";
		String fN = ScannerUtil.nextLine(scanner,message);
		if(!EmployeesController.check(fN))
		{
			System.out.println("상품번호를 잘못입력하셨습니다. 다시 입력해주세요");
			fN = ScannerUtil.nextLine(scanner,message);
		}
		if(usersController.insertBN(fN))
		{
			System.out.println("상품번호 : "+fN+" 에 가입되셨습니다");
		}
	}
	//가입한 상품삭제 
	public void deleteBN()
	{
		message= "해지하실 상품의 계좌번호를 입력해주세요";
		String bankNo = ScannerUtil.nextLine(scanner,message);
		//계좌잔액 보여주고 해지하는지 물어보기 
		int change = usersController.cash(bankNo);
		message = "현재 계좌의 잔액이 "+change+"원 입니다."+"/n"+"정말로 해지하시겠습니까? Y/N";
		String yn = ScannerUtil.nextLine(scanner,message);
		if(yn.equalsIgnoreCase("y"))
		{
			//해지하면서 계좌에있던 금액 출금 
			usersController.withdraw(change,bankNo);
			if(usersController.deleteBN(bankNo))//계좌삭제 
			{
			System.out.println("[상품해지완료] 가입하신 상품의 계좌번호 "+bankNo+"가 삭제되었습니다");
			}
		}

		
	}
	

}

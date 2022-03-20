package com.mystudy.phone;

public class PhoneMain {
	public static void main(String[]args) {
		
		Phone phone1 = new Phone();
		phone1.h_size = 100;//다이렉트로 설정.
		phone1.v_size = 200;
		
		phone1.view();
		phone1.call();
		phone1.receiveCall();
		
		System.out.println("=======phone2==========");
		Phone phone2 = new Phone("아이폰pro11","SmartPhone");
		phone1.h_size = 110;//다이렉트로 설정.
		phone1.v_size = 200; 
		phone2.view();
		 
		 phone2.call();
		 
		 phone2.receiveCall();
		 
		 
		 phone2.sendSms("지금 뭐해?");
		 
		 phone2.receiveSms("공부해!@@@");
		 
		 System.out.println("========phone3=========");
		 Phone phone3 = new Phone("아이폰12","SmartPhone", true);
		 
		 phone3.view();

		 phone3.receiveCall();
		 
		 phone3.sendSms("안녕하세요");
		 
		 String message = "만나서 반갑습니다~!!";
		 phone3.receiveSms(message);
		 System.out.println(":::받은메세지 : "+ message);//리턴된 String message를 출력(출력하지 않아도 상관 없음)
		 
		 
		 
		
	}

}



























package com.mystudy.phone;

public class Phone {
	//필드
	//필드변수
	String name;//모델명
	String type;//타입
	boolean hasLCD;//LCD유무
	int h_size;//가로크기
	int v_size;//세로크기
	
	//생성자=====================================
	Phone(){//기본생성자 명시적 선언(정의)
	}
		
	Phone(String name, String type){
		this.name = name;//변수이름이 같으면 this라는 키워드를 사용해 구별을 해준다.this는 현재 객체(인스턴스)를 의미한다.
		this.type = type;//그러므로 this.변수 는 현재객체에 있는 변수를 의미한다.
		
	}
	
	Phone(String name, String type, boolean hasLCD){
//		this.name = name;S
//		this.type = type;
//		this.hasLCD = hasLCD;
		 this(name, type);//현재 객체(인스턴스) 생성자 호출
		 this.hasLCD = hasLCD;//각자 작성해도 괜찮지만 현재 생성자를 호출하여 추가하는것이 더 좋다.
	}
	
	
	//=================메서드=====================
	//전화걸기
	void call() {
		System.out.println("전화걸기");
	}
	
	//전화받기 
	void receiveCall() {
		System.out.println("전화받기");
	}
	
	//메세지 보내기
	void sendSms(String message) {
		System.out.println("[메세지전송]"+ message);
	}
	//메세지 받기
	public String receiveSms(String message) {
		System.out.println("[메세지수신]"+ message);
		
		return message;
		
	}
	//전화기 정보 확인
	void view() {
		System.out.println("----전화기 정보----");
		System.out.println("모델명 :"+name);
		System.out.println("타입 :"+ type);
		System.out.println("가로크기 :"+h_size);
		System.out.println("세로크기 :"+v_size);
		System.out.println("LCD유무 :"+hasLCD);
	}
	
	
	

}

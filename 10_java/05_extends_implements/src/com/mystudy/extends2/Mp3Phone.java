package com.mystudy.extends2;
//Phone클래스를 상속받아 (extsnds : 확장)Mp3Phone만들기 

class Mp3Phone extends Phone {
	//생성자
	public Mp3Phone(String phoneNo) {
		super("Mp3Phone타입",phoneNo);//부모클래스의 필드를 가지고 온다
	}
	public Mp3Phone(String type, String phoneNo) {
		 super(type,phoneNo);//부모클래스의 필드를 가지고 온다.
		
	}
	//메소드
	public void playMusic() {
		System.out.println(">> Mp3Phone - 음악플레이");
	}

}

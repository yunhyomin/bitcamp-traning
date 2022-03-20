package com.mystudy.extends1;

 class PhoneTest {
	public static void main(String[] agrs) {
		//phone 객체생성 후 기능 테스트
		System.out.println("====phone====");
		Phone ph1 = new Phone("010-0000-0000");
		ph1.view();
		ph1.call();
		ph1.receiveCall();
		
		Phone ph2 = new Phone("아이폰", "010-7363-3888");
		ph2.view();
		ph2.call();
		ph2.receiveCall();
		String string = ph2.toString();//Object클래스의 toString()메소드 사용 
		System.out.println(string);
		System.out.println(ph2.toString());
		System.out.println(ph2);

		System.out.println("====Mp3Phone====");
		Mp3Phone mp3ph = new Mp3Phone("010-4534-4534");
		mp3ph.view();
		mp3ph.call();
		mp3ph.receiveCall();
		mp3ph.playMusic();
		
		


	}

}

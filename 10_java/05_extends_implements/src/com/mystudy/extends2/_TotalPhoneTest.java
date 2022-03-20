package com.mystudy.extends2;

 class _TotalPhoneTest {
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
		System.out.println(string);//override 를 해주지 않았기 때문에 주소값으로 저장된다.
		System.out.println(ph2.toString());
		System.out.println(ph2);

		System.out.println("====Mp3Phone====");
		Mp3Phone mp3ph = new Mp3Phone("010-4534-4534");
		//phone에서 구현한 메소드
		mp3ph.view();
		mp3ph.call();
		mp3ph.receiveCall();
		//Mp3Phone에서 구현한 메소드
		mp3ph.playMusic();
		
		System.out.println("====WebPhone====");
		WebPhone webph = new WebPhone("010-7225-3744");
		
		//phone에서 구현한 메소드
		webph.view();
		webph.call();
		webph.receiveCall();
		//Mp3Phone에서 구현한 메소드
		webph.playMusic();
		//WebPhone에서 구현한 메소드
		webph.webSearch("코로나19");
		webph.webSearch();
	
		WebPhone webph2 = new WebPhone("크롬브라우저","010-7225-3744");
		 webph2.view();
		 



	}

}

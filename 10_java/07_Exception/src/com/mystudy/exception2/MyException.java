package com.mystudy.exception2;

//예외 만들기  : Exception클래스를 상속받아 만들기 
class MyException extends Exception {//Exception타입의 클래스가 된다.
	//생성자
	//1
	public MyException() {
		//수퍼(부모)클래스의 생성자 호출(예외메세지 전달)
		super(">>내가만든 Exception");
	}
	//2
	public MyException(String msg) {
		super(">> 내가만든 Exception : "+ msg);
	}

}

package com.mystudy.exception1;

public class ExceptionThrow {

	public static void main(String[] args) {
		//예외처리 throw : 예외를 발생시킬 때 사용
		//throw new ArithmeticException();
		//throw new ArithmeticException("예외 메시지 작성전달");
		//throw new ArithmeticException("/by zero");
		
		throw new ArrayIndexOutOfBoundsException();
	}

}

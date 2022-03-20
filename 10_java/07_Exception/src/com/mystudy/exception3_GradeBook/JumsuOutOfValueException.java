package com.mystudy.exception3_GradeBook;

public class JumsuOutOfValueException extends SungjukProcessException{

	public JumsuOutOfValueException() {
		super("점수범위(0~100)을 벗어난 값입니다.");
		
	}
	
}

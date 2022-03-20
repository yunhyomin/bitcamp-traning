package com.spring.biz.common;

import org.aspectj.lang.ProceedingJoinPoint;

public class AroundAdvice {
	public Object aroundLog(ProceedingJoinPoint pjp) throws Throwable {
		//핵심메소드 실행전
		System.out.println("[Aroud BEFORE] 비즈니스 로직 실행전 처리");
		Object returnObj = pjp.proceed(); //조인포인트 메소드 실행
		
		//핵심메소드 실행후
		System.out.println("[Aroud AFTER] 비즈니스 로직 실행후 처리");
		
		return returnObj;
	}
}

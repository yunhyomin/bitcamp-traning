package com.nystudy.random;

import java.util.Calendar;
import java.util.Random;
import java.util.Set;
import java.util.TreeSet;

public class RandomExam2 {

	public static void main(String[] args) {
		//(실습) 오늘당신의 행운지수 알아보기 (0~100)
		//Math.random(), Random 사용해서 행운지수 값 만들기 
		//실행결과 
		//2021년 7월 29일 당신의 행운지수(0~100)는 77입니다.
		//==============================================
		
		//행운지수 값 만들기 
		int result = 0;
		System.out.println("오늘의 나의 행운지수는 얼마일까요?");
		
		//Calendar는 객체생성을 안해도 된다. 그저 기능만 쓰자 
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);		
		int month = calendar.get(Calendar.MONTH)+1;//MONTH는 0~11까지있다.그러므로 +1
		int date = calendar.get(Calendar.DATE);
		
		System.out.println(year);
		System.out.println(month);
		System.out.println(date);  
		System.out.println(year +"년"+ month+"월"+ date+"일");
		String yyyymmdd = year +"년 "+ month+"월 "+ date+"일 ";
		System.out.println("------------------------------------");

		//Random nextInt사용
		Random random = new Random();
		 result=random.nextInt(101);
		 System.out.println(yyyymmdd + "당신의 행운지수(0~100)는 "+result+"입니다.");
		 
		 //범위가 0~101인지 확인해보자!
		 Set<Integer> set = new TreeSet<>();
		 for(int i=0; i<1000; i++) {
			 set.add(random.nextInt(101));
		 }
		 System.out.println(set);
		 System.out.println("--------------------------------------");


		
		//Math.random 사용
		 result = (int)(Math.random()*101);
		 System.out.println(yyyymmdd + "당신의 행운지수(0~100)는 "+result+"입니다.");
		 
		 Set<Integer> set1 = new TreeSet<>();
		 for(int i=0; i<1000; i++) {
			 set.add((int)(Math.random()*101));
		 }
		 System.out.println(set);
		 System.out.println("--------------------------------------");
	}
	 	

}






















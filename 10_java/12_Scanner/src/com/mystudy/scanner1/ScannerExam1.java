package com.mystudy.scanner1;

import java.util.Scanner;

public class ScannerExam1 {

	public static void main(String[] args) {
		//Scanner : 특정위치에서 값을 읽어 사용하기 위한 클래스 
		//입력: 성명, 국어, 영어, 수학점수를 입력받아 
		//처리: 총점, 평균을 구하기 
		//출력:  성적처리된 데이터 화면 출력
		/*
		 ===========
		 이름 : 홍길동
		 국어 : 
		 영어 : 
		 수학 : 
		 -----------
		 총점 : 
		 평균 : 
		 ===========
		 */
		//입력--------------------------------------
		Scanner scanner = new Scanner(System.in);
		System.out.println(">>이름: ");
		String name = scanner.next();//String 데이터 읽기
		//String name = "홍길동";
		System.out.println(">>국어점수: ");
		int kor = scanner.nextInt();
		
		System.out.println(">>영어점수: ");
		int eng = scanner.nextInt();
		scanner.nextLine();//줄바꿈 이전에 있는 빈문자열 읽기(버퍼메모리 삭제)
		
		System.out.println(">>수학점수: ");
		String strMath = scanner.nextLine();
		System.out.println("수학점수 : -"+strMath+"-");
		int math = Integer.parseInt(strMath);
		
		//처리---------------------
		int sum = kor+eng+math;
		double aver = sum/100/3*100;
		
		//출력-----------------------
		System.out.println("====================");
		System.out.println(name);
		System.out.println(kor);
		System.out.println(eng);
		System.out.println(math);
		System.out.println("--------------------");
		System.out.println(sum);
		System.out.println(aver);
		System.out.println("====================");


	}

}



















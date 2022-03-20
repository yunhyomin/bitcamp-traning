package com.nystudy.random;

import java.util.Random;

public class RandomExam1 {

	public static void main(String[] args) {
		//Random : 난수(임의의 수)를 생성하는 클래스 
		//정수형 : nextInt() - int 타입의 난수를 생성
		//			nextInt(10) :  0~9 범위의 정수형 난수 생성
		//			nextLong() - long타입의 난수 생성
		//실수형 : nextFloat() - float 타입의 난수를 생성
		//:		 nextDouble() - double 타입의 난수를 생성
		//논리형 : nextBoolean() - true,false 둘 줄 하나 발생
		//----------------------------------------------------------------
		Random ran = new Random();
		System.out.println("-------nextBoolean()------");
		System.out.println("ran.nextBoolean() :"+ ran.nextBoolean());
		System.out.println("ran.nextBoolean() :"+ ran.nextBoolean());
		for(int i = 0; i<10; i++) {
			System.out.print(ran.nextBoolean()+" ");

		}
		System.out.println();

		System.out.println("-------nextInt()-------");
		System.out.println("ran.nextInt() :"+ran.nextInt());
		System.out.println("ran.nextInt() :"+ran.nextInt());
		for(int i=0; i<100; i++) {
			System.out.print(ran.nextInt(10)+ " ");

		}
		System.out.println();
		
		System.out.println("-------nextFloat()--------");
		System.out.println("ran.nextFloat() :"+ran.nextFloat());
		System.out.println("ran.nextFloat() :"+ran.nextFloat());
		for(int i=0; i<10; i++) {
			System.out.print(ran.nextFloat()+ " ");

		}
		System.out.println();

		System.out.println("-------nextDouble()--------");
		System.out.println("ran.nextDouble() :"+ran.nextDouble());
		System.out.println("ran.nextDouble() :"+ran.nextDouble());
		for(int i=0; i<10; i++) {
			System.out.print(ran.nextDouble()+ " ");

		}
		System.out.println();
		//둘은 같다. 다른점은 Random nextDouble은 객체를 생성해야 한다.
		System.out.println("-------Math.random() vs Random nextDouble()--------");
		for(int i=0; i<10; i++) {
			double mathRan = Math.random();// 0<= ran < 1 double 타입
			System.out.println(mathRan +" -Math.random()");
			System.out.println(ran.nextDouble() + "- Random nextDouble()");



		}









	}

}

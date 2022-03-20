package com.mystudy.innerclass;

public class InstanceClassTest {
		int a = 100;
		private int b = 10;
		static int c = 200;
		int sum = 0;
		
		void sum() {
			sum = a+b;
		}
		//내부클래스 :  인스턴스클래스 
		class Inner {
			int in = 100;
			void printData() {
				System.out.println("int a :"+a);
				System.out.println("int b :"+b);
				System.out.println("static int c :"+c);
				sum();
				System.out.println("sum :"+sum);
				System.out.println("내부클래스 필드 in : "+in);

			}
		}
		
	public static void main(String[] args) {
		InstanceClassTest out = new InstanceClassTest();
		System.out.println("필드변수 a : "+ out.a);

		System.out.println("---인스턴스 클래스 사용---");
		//내부클래스인 Inner에 있는 printData() 실행
		//Innner클래스의 객체생성
		//외부클래스.내부클래스 : 내부클래스의 타입 지정
		
		//InstanceClassTest.Inner inner= new InstanceClassTest().new Inner();
		//InstanceClassTest()객체안에있는 Inner()객체생성
		
		InstanceClassTest.Inner inner = out.new Inner();//위의 코드와 동일
		
		inner.printData();
	}
	

}

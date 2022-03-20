package com.mystudy.poly5_interface2;

public class Dog extends AbstractAnimal{
		//이부분은 AbstractAnimal와 똑같기 때문에 코딩하지 않아도 된다.
//		@Override
//		public void eat() {
//			System.out.println(">> 먹는다 ");
//
//		}
//		@Override
//		public void sleep() {
//			System.out.println(">> 잔다 ");
//
//		}
		@Override
		public void sound() {
			 System.out.println(">> 멍멍");

		
		}
}

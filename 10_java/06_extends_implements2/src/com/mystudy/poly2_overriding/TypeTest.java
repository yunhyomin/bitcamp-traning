package com.mystudy.poly2_overriding;

public class TypeTest {
	
	public static void main(String[] args) { 
		//Animal an = new Animal();
		Dog dog = new Dog();
		Pig pig = new Pig();
		Cat cat = new Cat();
		
		dog.sound();
		pig.sound();
		cat.sound();
		
		System.out.println("----사운드 호출----");
		sound(dog);
		sound(pig);
		sound(cat);

	}
	//메소드 오버라이딩(overriding)
	static void sound(Animal animal) {
		animal.sound();
	}
	
//	다형성 적용 : 형변환 후 메소드사용
//	static void sound(Animal animal) {
//		if(animal instanceof Dog) {
//			((Dog)animal).sound();
//		}
//		if(animal instanceof Pig) {
//			((Pig)animal).sound();
//		}
//}

	//다형성을 사용하지 않으면 우리는 이렇게 하나씩 메소드를 추가해야한다.
	//메소드 오버로딩(overroading) : 타입별 처리용 메소드 중복 선언
//	static void sound(Dog dog) {
//		dog.sound();
//	}
//	static void sound(Pig pig) {
//		pig.sound();
//	}
}
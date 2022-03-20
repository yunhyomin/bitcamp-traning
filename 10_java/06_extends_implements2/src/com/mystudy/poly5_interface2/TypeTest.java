package com.mystudy.poly5_interface2;

public class TypeTest {

	public static void main(String[] args) {
		//Cat, AbstractAnimal 메소드 사용가능
		Cat cat1 = new Cat();
		Dog dog1 = new Dog();
		Pig pig1 = new Pig();
		
		System.out.println("----AbstractAnimal 타입으로 사용");
		AbstractAnimal cat2 =new Cat();//부모 클래스 타입으로 사용
		cat2.sound();
		cat2.eat();
		cat2.sleep();
		AbstractAnimal dog2 =new Dog();
		dog2.sound();
		dog2.eat();
		dog2.sleep();
		AbstractAnimal pig2 = new Pig();
		pig2.eat();
		pig2.sleep();
		pig2.sound();

		System.out.println("----Animal 인터페이스 타입으로 사용");
		//Animal 인터페이스 타입이 되면 
		//Animal 인터페이스에 정의 된 메소드만 사용가능
		Animal cat = new Cat();//구현한 인터페이스 타입으로 사용
		Animal dog = new Dog();
		cat.eat();
		cat.sleep();
		cat.sound();
		
		
		
		System.out.println("---------------");
		sound(cat);
		sound(dog);

	}
	static void sound(Animal animal) {
		animal.sound();
	}

}

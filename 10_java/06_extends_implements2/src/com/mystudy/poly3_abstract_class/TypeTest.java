package com.mystudy.poly3_abstract_class;

public class TypeTest {
	public static void main(String[] args) {
//		AbstractAnimal animal = new AbstractAnimal();
		Cat cat = new Cat();
		Dog dog = new Dog();
	}
	
	//메소드 오버라이딩 활용
	static void sound(AbstractAnimal animal) {
		animal.sound();
	}

}

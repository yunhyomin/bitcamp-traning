package com.mystudy.set1_hashset;

import java.util.HashSet;
import java.util.Objects;

class Person{
	//필드
	String name;//이름
	int age;//나이
	String jumin;//주민번호
	//생성자
	public Person(String name, int age, String jumin) {
//		super();생략가능
		this.name = name;
		this.age = age;
		this.jumin = jumin;
	}
	
	@Override
	public String toString() {
		return "Person [name=" + name + ", age=" + age + ", jumin=" + jumin + "]\n";
	}

	@Override
	public int hashCode() {
		System.out.println(">> hashCode() 실행");

		return Objects.hash(jumin);
	}

	@Override
	public boolean equals(Object obj) {
		System.out.println(">> equals() 실행");

		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Person other = (Person) obj;
		return Objects.equals(jumin, other.jumin);
	}
	
	
	
}
public class HashSetExam2_equals {
	//Set : 중복데이터는 허용안함(하나만 저장)
	//참조형 데이터의 동일 데이터 여부는 equals메소드 기준
	//equals()메소드 오버라이딩 할때는 hashCode()메소드도 함께 재정의
	//Set의 동일데이터 확인 
	//1.헤시코드 확인  : hashCode()
	//2.equals()메소드 결과같이 모두 일치하면 동일데이터
	public static void main(String[] args) {
		HashSet<Person> set = new HashSet<>();
		Person p1 = new Person("홍길동",27, "901010-1234567");
		Person p2 = new Person("홍길동",27, "901010-1234567");
		System.out.println("p1.hashCode() : "+p1.hashCode());
		System.out.println("p2.hashCode() : "+p2.hashCode());
		System.out.println("p1.equals(p2) : "+p1.equals(p2));

		set.add(p1);
		set.add(p2);
		
		set.add(new Person("홍경래",27, "901010-1234567"));
		
		set.add(new Person("김유신",30, "881111-1234567"));
		set.add(new Person("홍길동",27, "900202-1234567"));
		
		System.out.println(set);

	}

}


























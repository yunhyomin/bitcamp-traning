package com.test.interfaceimpl;


public class StudentManagerTest {
	//5명 학생정보 만들고 구현메소드 확인(이름 중복 2명이상)
	
	public static void main(String[] args) {
		StudentManager students = new StudentManagerImpl();
		StudentVO stu1 = new StudentVO("홍","홍길동", 95, 39, 45 );
		StudentVO stu2 = new StudentVO("김","김유신", 100, 99, 77 );
		StudentVO stu3 = new StudentVO("강","강감찬", 93, 33, 57 );
		StudentVO stu4 = new StudentVO("홍홍","홍길동", 48, 55, 99 );
		StudentVO stu5 = new StudentVO("강강","강감찬", 88, 86, 45 );
		
		students.add(stu1);
		students.add(stu2);
		students.add(stu3);
		students.add(stu4);
		students.add(stu5);
		
	}

}

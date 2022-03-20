package com.mystudy.bean;

public class StudentMain {

	public static void main(String[] args) {
		Student stu = new Student();
		//stu.name = "홍길동"; 이건 안된다 student클래스의 name변수가 private이기 때문이다.
//									->getter/setter를 이용한다.
		stu.setName("홍길동");
		System.out.println("name : " + stu.getName());

		stu.setKor(100);
		stu.setEng(90);
		stu.setMath(81);
		
//		int tot = stu.getKor() + stu.getEng() + stu.getMath();
//		stu.setTot(tot);
//		
//		double avg = stu.getTot() * 100 / 3 / 100.0;
//		System.out.println("avg : " + avg);
//		stu.setAvg(avg);
		stu.computeTotAvg();
		
		System.out.println(stu);
		
		Student stu2 = new Student("김유신", 100, 90, 82);
		
		System.out.println(stu2);
		
		stu2.setKor(200);
		System.out.println(stu2);
	}

}










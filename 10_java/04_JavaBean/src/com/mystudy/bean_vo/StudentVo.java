package com.mystudy.bean_vo;
//자바빈(Java Bean)형태의 클래스 작성
//VO(Value Object) : 값을 저장하기 위한 클래스(객체) - xxxVO, xxxVo
//DTO(Data Trasfer Objext) : 값을 저장해서 전달하기 위한 클래스 - xxxDTO, xxxDto

public class StudentVo {
			
			//필드 선언
			private String name;
			private int kor;
			private int eng;
			private int math;
			private int total;
			private double aver;
			
			//생성자 선언
			public StudentVo() {} //기본생성자
			
			public StudentVo(String name) {
				this.name = name;
			}
			
			
			public StudentVo(String name,int kor, int eng, int math) {
				super();
				this.name = name;
				this.kor =  kor;
				this.eng = eng;
				this.math = math;
				 
				computeTotalAver();
				
				
			}
			//setter, getter 메소드선언

			public String getName() {
				return name;
			}

			public void setName(String name) {
				this.name = name;
			}

			public int getKor() {
				return kor;
			}

			public void setKor(int kor) {
				scoreSize(kor);
				this.kor = kor;
				computeTotalAver();//값이 바뀔때 다시 총점과 평균을 처리해주어야 하기때문에.
			}

			public int getEng() {
				return eng;
			}

			public void setEng(int eng) {
				scoreSize(eng);
				this.eng = eng;
				computeTotalAver();
			}

			public int getMath() {
				return math;
			}

			public void setMath(int math) {
				scoreSize(math);
				this.math = math;
				computeTotalAver();
			}

			public int getTotal() {
				return total;
			}

			public void setTotal(int total) {
				this.total = total;
			}

			public double getAver() {
				return aver;
			}

			public void setAver(double aver) {
				this.aver = aver;
			}
			
			public void computeTotalAver() {
				total = kor+eng+math;
				aver = (double)total;
			}
			public int scoreSize(int score) {
				if(score<0 || score>100) {
					System.out.println("입력오류 : 점수의 범위(0~100)가 잘못되었습니다.");
				}
				return score;
			}
			
			//override  StudentVo에는 toString()메소드가 구현이 되어있지 않다 
			//			하지만 부모클래스가 toString()메소드를 가지고 있기 때문에 StudentVo클래스에서 쓸수있다.
			//			그러나 그 상태로 쓸수가 없기때문에 쓸 수 있도록 재정의를 해주는것이 override이다.
			//toString()메소드는 가지고 있는 모든 문자열을 리턴하는 메소드이다. 그자체로 출력되지는 않는다.
			public String toString() {
				return "[StrudentVO name=" +name+",kor="+kor+",eng="+eng+",math+"+math+",total="+total+
							",aver="+aver+"]";
			
			}
			public void printData(){
				System.out.println(name+" :"+"국어점수"+kor+"영어점수"+eng
				+"수학점수"+math+"총점"+total+"평균"+aver);
			}
			
	

}

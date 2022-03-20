package com.mystudy.exception3_GradeBook;
//자바빈(Java Bean) 형태의 클래스 작성
//VO(Value Object) : 값을 저장하기 위한 클래스(객체) - xxxVO, xxxVo
//DTO(Data Trasfer Object) : 값을 저장해서 전달하기 위한 클래스 - xxxDTO, xxxDto
public class StudentVo {
			
			//필드 선언
			private String name;
			private int kor;
			private int eng;
			private int math;
			private int total;
			private double aver;
			
			//생성자
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
			//호출한 곳으로 예외 던지기(throws)
			public void setKor(int kor) throws JumsuOutOfValueException {//또 발생예외 던지기
				scoreSize(kor);
				this.kor = kor;
				computeTotalAver();
			}

			public int getEng() {
				return eng;
			}

			public void setEng(int eng) {
				try {//직접처리
					scoreSize(eng);
					this.eng = eng;
					computeTotalAver();
				} catch (JumsuOutOfValueException e) {
					e.printStackTrace();
				}
				
				
			}

			public int getMath() {
				return math;
			}

			public void setMath(int math) {
				try {//직접처리
					scoreSize(math);
					this.math = math;
					computeTotalAver();
				} catch (JumsuOutOfValueException e) {
					e.printStackTrace();
				}
				
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
				aver = total*100/3/100;
			}
			//호출한 곳으로 예외 던지기(throws)
			public int scoreSize(int score) throws JumsuOutOfValueException {//발생예외 던지기 
				if(score<0 || score>100) {
					//System.out.println("입력오류 : 점수의 범위(0~100)가 잘못되었습니다.");
					throw new JumsuOutOfValueException();//예외 발생시키고 던지기 
				}
				return score;
			}
			
			public String toString() {
				return "[StrudentVO name=" +name+",kor="+kor+",eng="+eng+",math+"+math+",total="+total+
							",aver="+aver+"]";
			
			}
			public void printData(){
				System.out.println(name+"의 성적\n"+"국어점수"+kor+"영어점수"+eng
				+"수학점수"+math+"총점"+total+"평균"+aver);
			}
			
	

}

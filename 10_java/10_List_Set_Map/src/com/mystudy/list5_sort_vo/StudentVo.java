package com.mystudy.list5_sort_vo;
//자바빈(Java Bean) 형태의 클래스 작성
//VO(Value Object) : 값을 저장하기 위한 클래스(객체) - xxxVO, xxxVo
//DTO(Data Trasfer Object) : 값을 저장해서 전달하기 위한 클래스 - xxxDTO, xxxDto
public class StudentVo implements Comparable<StudentVo>{
			
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
			public void setKor(int kor){
				scoreSize(kor);
				this.kor = kor;
				computeTotalAver();
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
				aver = total*100/3/100;
			}
			
			public int scoreSize(int score)  {
				if(score<0 || score>100) {
					System.out.println("입력오류 : 점수의 범위(0~100)가 잘못되었습니다.");
					
				}
				return score;
			}
			
			public String toString() {
				return "["+name+" "+ kor+"  "+ eng +"  "+ math +"  "+ total +"  "+ aver + "]";

			
			}
			public void printData(){
				System.out.println("[StrudentVO name=" +name+",kor="+kor+",eng="+eng+",math+"+math+",total="+total+
										",aver="+aver+"]");
			}
			@Override
			public int compareTo(StudentVo o) {
				return name.compareTo(o.name);
			}
			
	

}

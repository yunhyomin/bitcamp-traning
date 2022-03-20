package day0628;
// 학생의 국어점수, 영어점수, 수학점수, 총점, 평균을 각각 알맞는 이름의 변수에
// 저장하고 출력하세요
// 결과)
// 국어점수
// 87
// 영어점수
// 89
// 수학점수
// 88
// 총점
// 264
// 평균
// 88.0

public class Ex11GradeBook {
    public static void main(String[] args) {
      int A = 87;
        System.out.println("국어점수="+ A);
      int B = 89;
        System.out.println("영어점수="+B);
      int C = 88;
        System.out.println("수학점수="+C);
        
        System.out.println("총점="+(A+B+C));
      double D=(A+B+C)/3;
        System.out.println("평균="+D);
  
    }
}














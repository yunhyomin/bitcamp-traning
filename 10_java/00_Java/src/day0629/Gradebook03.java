package day0629;

public class Gradebook03 {
    public static void main(String[]args) {
       String N = "윤효민";
       int A = 29;
       int K = 80;
       int E = 81;
       int M = 81;
       int SUM = K+E+M;
       double Average =(double)SUM/3 ;//명시적 형변환-SUM은 int기 때문에 double로 바꿔준다.
       
       System.out.printf("이름:%s 나이:%03d세\n",N,A);
       
       System.out.printf("국어: %03d점 영어:%03d점 수학:%03d점\n",K,E,M);
      
       System.out.printf("총점: %03d점 평균:\n"+N);
       System.out.printf("이름:\n"+N);
     
    }

}

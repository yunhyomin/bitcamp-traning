package day0629;

public class Gradebook02 {
    public static void main(String[]args) {
        String name = "윤효민";
        int age = 29;
        int K = 80;
        int E = 80;
        int M = 81;
        int sum = K+E+M;
        double average = (double)sum/3;//명시적형변환을 해준다 
//        ->int->double 80.3333...출력
//       명시적 형변환을 해주지 않고 그냥 sum/3을 하면 ->80.0이 된다.
        System.out.println("이름:"+name);
        System.out.println("나이:"+age);
        System.out.println("국어:"+K);
        System.out.println("영어:"+E);
        System.out.println("수학:"+M);
        System.out.println("총점:"+sum);
        System.out.println("평균:"+average);
        
        
    }
}

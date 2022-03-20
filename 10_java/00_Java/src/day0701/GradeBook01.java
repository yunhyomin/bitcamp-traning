package day0701;
//사용자로부터
//번호, 이름, 국어 점수, 영어 점수, 수학 점수를 차례대로 입력 받아서
//다음과 같은 형식에 맞추어 출력하는 프로그램을 작성하시오

//단 사용자가 1~10 사이가 아닌 번호를 입력하거나
//올바르지 않은 점수를 입력하면 
//올바른 값이 입력될때까지 다시 입력을 하도록 코드를 작성하시오

//출력 결과
//번호: ##번 이름: ###
//국어: ###점 영어: ###점 수학: ###점
//총점: ###점 평균: ###.##점
import java.util.Scanner;

public class GradeBook01 {
    public static void main(String[] agrs) {
        
        //프로그램에서 사용할 상수들 선언
        //1. 번호 최소값
        final int ID_MIN = 1;
        //2. 번호 최대값
        final int ID_MAX = 10;
        //3. 점수 최소값
        final int SCORE_MIN = 0;
        //4. 점수 최대값
        final int SCORE_MAX = 100;
        
        Scanner scanner = new Scanner(System.in);
        
        // 정수 입력값을 임시로 저장할 int변수 선언
        int input;
       
        //출력시 사용자에세 안내할 문구를 저장할 String변수 선언
        String message;

        // 번호입력받기
        message = "번호를 입력해주세요";
        System.out.println(message);
        System.out.print(">");
        input = scanner.nextInt();
        
        while(!(input >= ID_MIN && input <= ID_MAX)) {
            System.out.println("잘못입력하셨습니다.");
            System.out.println(message);
            System.out.print(">");
            input = scanner.nextInt();
        }
        int ID = input;//위의 input값(번호)을 ID에 할당
        // 이름입력받기
        message = "이름을 입력해 주세요";
        System.out.println(message);
        System.out.print(">");
        scanner.nextLine();// 버퍼메모리 비워주기
        String name = scanner.nextLine();
        // 국어점수입력
        message = "국어점수를 입력해주세요";
        System.out.println(message);
        System.out.print(">");
        input= scanner.nextInt();//다음칸에 입력될 값을 input에 저장한다.라는 뜻
        
        while(!(input>= SCORE_MIN && input<=SCORE_MAX)) {
            System.out.println("잘못입력하셨습니다");
            System.out.println(message);
            System.out.print(">");
            input = scanner.nextInt();
        }
        int kor = input;//위의 입력된 input값(국어점수)을 kor에 할당 
        // 영어점수입력
        message = "영어점수를 입력해주세요";
        System.out.println(message);
        System.out.print(">");
        input = scanner.nextInt();
        
        while(!(input>= SCORE_MIN && input<=SCORE_MAX)) {
            System.out.println("잘못입력하셨습니다");
            System.out.println(message);
            System.out.print(">");
            input = scanner.nextInt();
        }
        int eng = input;//위의 입력된 input값(영어점수)을 eng에 할당
        // 수학점수입력
        message = "수힉점수를 입력해주세요";
        System.out.println(message);
        System.out.print(">");
        input = scanner.nextInt();
        
        while(!(input>= SCORE_MIN && input<=SCORE_MAX)) {
            System.out.println("잘못입력하셨습니다");
            System.out.println(message);
            System.out.print(">");
            input = scanner.nextInt();
        }
        int math = input;//위의 입력된 input값(수학점수)을 math에 할당 
        //총점계산
        int sum = kor+eng+math;
        //평균계산
        double aver = (double)sum/3;//sum이 int기 때문에 형변환을 해준다.
        
        System.out.printf("번호: %d 번 이름: %s",ID,name);
        System.out.printf("국어: %03d점 영어: %03d점 수학: %03d점",kor,eng,math);
        System.out.printf("총점: %03d점 평균: %.3f점\n",sum,aver);
    }
}
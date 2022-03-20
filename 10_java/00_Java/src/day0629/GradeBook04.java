package day0629;
//사용자 로부터 

//번호,이름, 국어점수, 영어점수,수학점수를 차례대로 입력받아서 다음과 같은 형식에 맞추어 출력하는 프로그램을 작성하시오.
//다음과 같은 형식에 맞추어 출력하는 프로그램을 작성하시오
//
//출력결과 
//번호:##번 이름:###
//국어:###점 영어:###점 수학:###점
//총점:###점 평균:###.##점

import java.util.Scanner;

public class GradeBook04 {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        //과목의 숫자가 초기화된 상수 SUBJECT_SIZE 
        final int  SUBJECT_SIZE  = 3;
        // 번호입력
        System.out.println("번호를 입력해주세요.");
        System.out.print(">");
        int n = scanner.nextInt();

        // 이름입력 변수의 이름중에 학생의 번호,사원의 번호 등 
        // 하나의 고유한 정보를 나타내는 변수는 우리가 주로 id라고 부른다.
        System.out.println("이름을 입력해주세요.");
        System.out.print(">");
        scanner.nextLine();// 버퍼메모리를 비워주기위한 코드
        String name = scanner.nextLine();
        // 국어점수입력
        System.out.println("국어점수가 몇점인가요?");
        int K = scanner.nextInt();
        // 영어점수입력
        System.out.println("영어점수가 몇점인가요?");
        int E = scanner.nextInt();
        // 수학점수입력
        System.out.println("수학점수가 몇점인가요?");
        int M = scanner.nextInt();

        int sum = K + E + M;//총점 변수에 저장
        double aver = (double) sum /SUBJECT_SIZE;//평균 변수에 저장
        
        System.out.printf("번호: [%2d] 이름: [%s]\n",n,name);
        System.out.printf("국어: %3d점 영어: %3d점 수학: %3d점 \n",K,E,M);
        System.out.printf("총점:%3d점 평균:%03.2f점", sum, aver);
        
        scanner.close();
   }
 // 하드코딩과 소프트코딩
    // 하드코딩이란 매직 넘버등을 사용하여 경직된 코드를 만들어서 유지보수가
    // 어려운 코딩을 하드코딩이라고 한다.
    // 물론 난이도가 낮은 프로그램을 만들 때에는 하드코딩이 소프트코딩보다
    // 더 쉽고 빠르게 만들수 있지만 여러분들이 규모가 크거나 유지보수가 잦은
    // 프로그램을 만들 때에는 하드코딩을 하지 말아야 한다!

    // 그에 반해서 소프트코딩은 코드를 유연하게 코딩해서 유지보수를 쉽게
    // 할 수 있는 코딩을 소프트코딩이라고 한다.
    // 적극적인 상수 사용, 재사용 가능성이 높은 코드는 메소드화 시키는 등
    // 하드코딩에 비교하며는 작업량이 많기 때문에 난이도가 낮은 프로그램에서는
    // 상대적으로 소프트코딩이 더 불편한다.
    // 하지만 하드코딩과는 반대로 규모가 크거나 유지보수가 잦으면
    // 소프트코딩이 월등히 유리하다.

}

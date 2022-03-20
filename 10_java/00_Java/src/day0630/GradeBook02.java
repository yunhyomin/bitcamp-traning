package day0630;
//숙제3

//사용자로부터 번호,이름,국어,영어,수학 점수를 입력받아서 예쁘게 출력하시오
//단, 모든 입력이 끝난후에 모든 점수가 올바른 범위일때에만 출력이 진행되고
//만약 잘못된 점수가 존재할 경우에는 "잘못된 점수가 있어서 결과를 출력할 수 없습니다"
//가 출력되게 코드작성

import java.util.Scanner;
import java.util.function.BiConsumer;

public class GradeBook02 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // 번호입력
        System.out.println("번호를 입력하세요");
        int num = scanner.nextInt();
        // 이름입력
        System.out.println("이름을 입력하세요");
        scanner.nextLine();//버퍼메모리비워주기
        String na = scanner.nextLine();
        // 국어점수입력
        System.out.println("국어점수를 입력하세요");
        int k = scanner.nextInt();
        // 영어점수입력
        System.out.println("영어점수를 입력하세요");
        int e = scanner.nextInt();
        // 수학점수입력
        System.out.println("수학점수를 입력하세요");
        int M = scanner.nextInt();

        // 입력값 검증
        if (0 <= k && k <= 100) {
            if (0 <= e && e <= 100) {
                if (0 <= M && M <= 100) {
                    // 결과 값 계산하고 출력
                    int sum = k + e + M;
                    double aver = (double) sum / 3;
                    System.out.printf("[번호: %d] [이름: %s]\n", num, na);
                    System.out.printf("[국어점수: %d점]\n [영어점수: %d점]\n [수학점수: %d점]\n", k, e, M);
                    System.out.printf("[총점: %d점]\n [평균: %f점]\n", sum, aver);

                } else {
                    System.out.println("잘못된 점수가 있어서 결과를 출력할 수 없습니다");
                }
            } else {
                System.out.println("잘못된 점수가 있어서 결과를 출력할 수 없습니다");
            }
        } else {
            System.out.println("잘못된 점수가 있어서 결과를 출력할 수 없습니다");
        }
    }
}

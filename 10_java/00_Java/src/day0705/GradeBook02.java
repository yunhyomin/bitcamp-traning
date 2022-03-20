package day0705;
// 사용자로부터 총5명의 학생의 정보를 관리하는 프로그램
//단, 입력과 출력을 분리한다.
//또한 사용자가 5명을 초과해서 입력하려고 하면 더이상 입력하실수 없습니다!라고 뜨게 만들어야한다.

//예시 : 입력할때 "1번째 학생의 정보를 입력하세요"
//        출력할때 입력된 학생들만 출력을 한다.
//즉, 번호 이름 국어 영어 수학이 각각배열로 ...

//힌트: 몇번째에 입력할 인덱스인지를 저장할 변수가 있으면...?

import java.util.Scanner;

public class GradeBook02 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        // 상수
        // 최저점수를 저장하는 int상수
        final int SCORE_MIN = 0;
        // 최고점수를 저장하는 int상수
        final int SCORE_MAX = 100;
        // 과목숫자를 저장하는 int상수
        final int SUBJECT_SIZE = 3;
        // 최대학생의 수
        final int number = 5;

        // 변수
        // 번호 배열
        int[] idArray = new int[number];
        // 이름 배열
        String[] nameArray = new String[number];
        // 국어점수 배열
        int korArray[] = new int[number];
        // 영어점수 배열
        int engArray[] = new int[number];
        // 수학점수 배열
        int mathArray[] = new int[number];
        // 입력할 인덱스를 저장할 변수
        int index = 0;

        while (true) {
            System.out.println("1. 입력 2. 출력 3. 종료");
            System.out.print(">");
            int userChoice = scanner.nextInt();
            // 입력
            if (userChoice == 1) {
                // 입력코드구현
                if (index < number) {
                    // 입력가능한 상태
                    // 각 배열의 index칸에 정보를 입력한다
                    int i = number;
                    for(i=1; i<=number; i++) {
                    System.out.printf("%d번째 학생의 정보 입력하세요\n",i);
                    System.out.println("번호>");
                    idArray[index] = scanner.nextInt();
                    System.out.println("이름>");
                    scanner.nextLine();// 버퍼메모리 삭제
                    nameArray[index] = scanner.nextLine();

                    int score;
                    // 국어점수입력
                    System.out.println("국어점수>");
                    score = scanner.nextInt();
                    while (!(score >= SCORE_MIN && score <= SCORE_MAX)) {// 점수의 범위가 잘 못되었을때
                        System.out.println("잘못 입력하셨습니다");
                        System.out.println("국어점수>");
                        score = scanner.nextInt();
                    }
                    korArray[index] = score;
                    // 영어점수입력
                    System.out.println("영어점수>");
                    score = scanner.nextInt();
                    while (!(score >= SCORE_MIN && score <= SCORE_MAX)) {
                        System.out.println("잘못 입력하셨습니다");
                        System.out.println("영어점수>");
                        score = scanner.nextInt();
                    }
                    engArray[index] = score;
                    // 수학점수입력
                    System.out.println("수학점수>");
                    score = scanner.nextInt();
                    while (!(score >= SCORE_MIN && score <= SCORE_MAX)) {
                        System.out.println("잚못 입력하셨습니다.");
                        System.out.println("수학점수>");
                        score = scanner.nextInt();
                    }
                    mathArray[index] = scanner.nextInt();
                    //다음 입력할 순서를 +1
                    }index++;
                 
                }else {
                    // 더이상 입력할 수 없는 상태
                    System.out.println("5명의 정보를 다 입력하셨습니다.");
                }
            }
            // 출력
            else if (userChoice == 2) {
                if (index == 0) {
                    // 아직 한명도 입력이 안되어있는 상태
                    System.out.println("아직 한명도 입력이 되어있지 않습니다.");
                } else {
                    // 한명이상이 입력되어있는상태
                    for (int i = 0; i < index; i++) {
                        // 총점계산
                        int sum = korArray[i] + engArray[i] + mathArray[i];
                        // 평균계산
                        int aver = sum / SUBJECT_SIZE;
                        // 출력
                        System.out.printf("번호: %03d번 이름: %s\n", idArray[i], nameArray[i]);
                        System.out.printf("국어점수: %03d점 영어점수: %03d점 수학점수: %03d점", korArray, engArray, mathArray);
                        System.out.printf("총점: %03d점 평균: %.2d점", sum, aver);
                    }

                }
            } // 종료
            else if (userChoice == 3) {
                System.out.println("사용해주셔서 감사합니다.프로그램을 종료합니다");
                break;

            }
        }
        scanner.close();

    }
}

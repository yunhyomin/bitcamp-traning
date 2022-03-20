package day0705;

import java.util.Scanner;

public class GradeBook02mine {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        // 상수
        final int STUDENTS_SIZE = 5;
        final int SUBJECT_SIZE = 3;
        final int SCORE_MIN = 0;
        final int SCORE_MAX = 100;

        // 배열
        int[] idArray = new int[STUDENTS_SIZE];
        String[] nameArray = new String[STUDENTS_SIZE];
        int[] korArray = new int[STUDENTS_SIZE];
        int[] engArray = new int[STUDENTS_SIZE];
        int[] mathArray = new int[STUDENTS_SIZE];

        int index = 0;

        while (true) {
            System.out.println("1.입력 2.출력 3.종료");
            int userChoice = scanner.nextInt();
            // 입력
            if (userChoice == 1) {
                if (index < STUDENTS_SIZE) {
                    // 입력가능한 상태
                    // 각배열의 index칸에 정보를 입력한다.
                    for (int i = 1; i < STUDENTS_SIZE + 1; i++) {
                        System.out.printf("%d번 학생의 정보를 입력하세요\n", i);
                    
                    System.out.println("번호");
                    idArray[index] = scanner.nextInt();

                    System.out.println("이름");
                    scanner.nextLine();// 버퍼메모리 삭제
                    nameArray[index] = scanner.nextLine();

                    int score;
                    // 국어점수
                    System.out.println("국어점수");
                    score = scanner.nextInt();
                    while (!(score >= SCORE_MIN && score <= SCORE_MAX)) {
                        System.out.println("잘못입력하셨습니다\n");
                        System.out.println("국어점수");
                        score = scanner.nextInt();
                    }
                    korArray[index] = score;
                    // 영어점수
                    System.out.println("영어점수");
                    score = scanner.nextInt();
                    while (!(score >= SCORE_MIN && score <= SCORE_MAX)) {
                        System.out.println("잘못입력하셨습니다\n");
                        System.out.println("영어점수");
                        score = scanner.nextInt();
                    }
                    engArray[index] = score;
                    // 수학점수
                    System.out.println("수학점수");
                    score = scanner.nextInt();
                    while (!(score >= SCORE_MIN && score <= SCORE_MAX)) {
                        System.out.println("잘못입력하셨습니다\n");
                        System.out.println("수학점수");
                        score = scanner.nextInt();
                    }
                    mathArray[index] = score;
                    // 다음 입력할 순서를 +1한다.
                    index++;}
                } else {
                    System.out.println("더이상 입력하실 수 없습니다!");
                }
                //출력
            } else if (userChoice == 2) {
                
               if(index == 0)
                   {//아직 한명도 입력이 안되어있는상태
                   System.out.println("아직 한명도 입력되어있지 않습니다.");
                   }else {
                       for(int i = 0; i<STUDENTS_SIZE; i++){
                           int sum = korArray[i]+engArray[i]+mathArray[i];
                           double aver =(double)sum/SUBJECT_SIZE;
                           System.out.printf("%d번의 학생의 정보입니다.\n",i+1);
                           System.out.printf("국어:%d점 영어: %d점 수학: %d점\n",korArray[i],engArray[i],mathArray[i]);
                           System.out.printf("총점: %d점 평균: %.2f점\n",sum,aver);
                       }
                   }
            }//종료
            else {
                System.out.println("프로그램을 종료합니다.");
                break;
            }

        }

        scanner.close();
    }
}

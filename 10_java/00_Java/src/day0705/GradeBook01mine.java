package day0705;
//국어,영어,수학점수를 
//별개의 int변수가 아니라 
//scoreArray라는 int배열을 사용한 
//성적입출력 프로그램을 작성하시오
//단, 입력과 출력 기능은 분리되어있고 
//잘못된 점수는 올바른 점수가 입력될때까지 다시 입력을 받게 하시오.

import java.util.Scanner;
public class GradeBook01mine {
    public static void main(String[]args) {
        Scanner scanner = new Scanner(System.in);
       //최저점수를 저장하는 int상수
        final int SCORE_MIN = 0;
        //최고점수를 저장하는 int상수
        final int SCORE_MAX = 100;
        //과목숫자를 저장하는 int상수
        final int SUBJECT_SIZE = 3;
        //번호를 저장하는 int변수
        int id = 0;
        //이름을 저장하는 String변수
        String name = "";
        //점수를 저장하는 int[]배열
        int[] scoreArray = new int[SUBJECT_SIZE];
        //올바르게 입력이 됐을때 true 가 되는 논리형변수
        boolean inputSwitch = false;
            while(true) {
                System.out.println("1.입력 2.출력 3.종료");
                System.out.println(">");
                int userChoice = scanner.nextInt();
                
                if(userChoice == 1) {
                    //점수입력
                    System.out.println("번호>");
                    id = scanner.nextInt();
                    System.out.println("이름");
                    scanner.nextLine();//버퍼메모리 삭제
                    name = scanner.nextLine();
                    System.out.println("국어점수>");
                    //scoreArray[1]에 저장되는 국어점수
                    scoreArray[0] = scanner.nextInt();
                    while(!(scoreArray[0]>=SCORE_MIN && scoreArray[0]<=SCORE_MAX)) {
                       System.out.println("잘못입력하셨습니다.");
                       System.out.println("국어점수>");
                       scoreArray[0] = scanner.nextInt();
                    }
                    System.out.println("영어점수>");
                    scoreArray[1] = scanner.nextInt();
                    while(!(scoreArray[1]>=SCORE_MIN && scoreArray[1]<=SCORE_MAX)) {
                        System.out.println("잘못입력하셨습니다.");
                        System.out.println("영어점수>");
                        scoreArray[1] = scanner.nextInt();
                  
                    }
                      System.out.println("수학점수>");
                    scoreArray[2] = scanner.nextInt();
                    while(!(scoreArray[2]>=SCORE_MIN && scoreArray[2]<=SCORE_MAX)) {
                        System.out.println("잘못입력하셨습니다.");
                        System.out.println("수학점수>");
                        scoreArray[2] = scanner.nextInt();
                    }inputSwitch = true;//점수가 입력됐으므로 true로 저장.
                    }
                    else if(userChoice == 2) {
                    //점수출력
                    if(inputSwitch) {
                        //점수가 한번이라도 입력된 경우
                        System.out.printf("번호:%03d번 이름:%s\n",id,name);
                        System.out.printf("국어:%03d점 영어:%03d점 수학:%03d점\n",scoreArray[0],scoreArray[1],scoreArray[2]);
                        int sum = scoreArray[0]+scoreArray[1]+scoreArray[2];
                        double aver = (double)sum/SUBJECT_SIZE;//형변환
                        System.out.printf("총점: %03d점 평균: %.2f점\n",sum,aver);
                    }
                    else {
                        System.out.println("점수를 입력하지 않으셨습니다");
                    }
                    
                }//종료
                else if(userChoice == 3) {
                    //while(true)종료
                    System.out.println("사용해주셔서 감사합니다.\n프로그램이 종료됩니다.");
                    break;
                }
        }
            scanner.close();
    }
}

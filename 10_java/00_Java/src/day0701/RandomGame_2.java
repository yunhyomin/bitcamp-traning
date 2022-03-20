package day0701;
// 랜덤 숫자 맞추기 게임

import java.lang.invoke.MethodHandles.Lookup.ClassOption;

// 사용자가 1. 플레이 2. 최고기록 보기 3. 종료
// 중 하나를 입력하면, 각각의 기능이 실행된다.
// 1. 플레이
//    사용자가 플레이를 실행시키면, 컴퓨터는
//    1~100까지의 랜덤한 숫자를 생성한다.
//    그리고 사용자는 그 숫자가 얼마인지 입력해서 맞춰야 하는데
//    사용자가 맞출때까지 입력은 계속 된다.
//    만약 사용자가 입력한 숫자가 컴퓨터의 숫자보다 크면 "DOWN" 이라고 출력된다.
//    만약 사용자가 입력한 숫자가 컴퓨터의 숫자보다 작으면 "UP" 이라고 출력된다.
//    또한, 사용자가 틀릴 때마다 현재 점수가 1점씩 올라가는데
//    최종적으로, 최고기록과 비교해서현재 점수가 더 작으면
//    현재 점수가 새로운 최고기록이 된다.
//    그리고 사용자가 정답을 맞추면 현재 점수, 최고 기록 그리고
//    만약 사용자가 최고 기록을 갱신했으면 축하메시지까지 출력이 된다.

// 2. 최고기록 보기
//    현재 최고기록을 보여준다.
//    단, 만약 사용자가 한번도 플레이 한적이 없으면
//    "아직 플레이 기록이 없습니다!"만 출력이 된다.

// 3. 종료
//    프로그램을 종료시킨다.

import java.util.Random;
import java.util.Scanner;

public class RandomGame_2 {
    public static void main(String[] args) {
        // 입력에 사용할 Scanner 클래스 변수
        Scanner scanner = new Scanner(System.in);
        // 랜덤 숫자를 뽑는데 사용할 Random 클래스 변수
        Random random = new Random();

        // 최고 기록을 저장할 int 변수
        int bestScore = 0;
        // 사용자가 입력 가능한 최소값을 저장한 int 상수
        final int NUMBER_MIN = 1;
        // 사용자가 입력 가능한 최대값을 저장한 int 상수
        final int NUMBER_MAX = 100;

        while (true) {
            // 메뉴 시작

            // 메뉴 문구 출력
            System.out.println("1. 플레이하기 2. 최고 기록 보기 3. 종료");
            System.out.print("> ");

            // 사용자로부터 실행하고자 하는 기능을 입력 받는다.
            int userChoice = scanner.nextInt();

            // 사용자가 플레이하기를 선택했을때
            if (userChoice == 1) {
                // 컴퓨터가 랜덤한 숫자를 고르게 한다.
                int computerNumber = random.nextInt(NUMBER_MAX) + 1;
                // 현재점수와 사용자의 숫자는 int변수에 0으로 초기화
                int userNumber = 0;
                int currentScore = 0;
                // 컴퓨터숫자와 사용자 숫자가 다를때에 질문을 계속 반복하게 한다.
                while (computerNumber != userNumber) {
                    // 사용자에게 숫자를 입력하라는 메세지 출력
                    System.out.println("1~100까지의 숫자중에 고르세요");
                    System.out.print(">");
                    // 사용자가 입력한 번호를 userNumber에 저장한다.
                    userNumber = scanner.nextInt();
                    // 사용자가 입력한 번호가 1~100사이가 아닐시 다시입력하라는 메세지를 반복
                    while (!(userNumber >= 1 && userNumber <= 100)) {
                        System.out.println("잘못입력하셨습니다.");
                        System.out.println("1~100사이의 숫자중에 고르세요");
                        System.out.print(">");
                        userNumber = scanner.nextInt();
                    }
                    if (userNumber > computerNumber) {
                        System.out.println("DOWN");
                    } else if (userNumber < computerNumber) {
                        System.out.println("UP");
                        
                    }// 맞추지못했으니 현재기록에 +1
                    currentScore++;
                }
                // 숫자를 맞췄을때 위의 while문을 끝내고 현재기록,최고기록,그리고 최고기록을 갱신했으면 축하메세지 출력
                System.out.printf("현재점수: [%d]점\n", currentScore);
                System.out.printf("최고기록: [%d]점\n", bestScore);
                if (currentScore < bestScore || bestScore == 0) {
                    bestScore = currentScore;
                    System.out.println(" 짝짝짝 최고기록 갱신을 축하합니다 짝짝짝");
                }
                //플레이 종료
            } // 사용자가 최고기록보기를 선택했을때
            else if (userChoice == 2) {
                if (bestScore > 0) {
                    System.out.printf("최고기록: [%d]점\n", bestScore);
                } else if (bestScore == 0) {
                    System.out.println("아직 플레이 기록이 없습니다!");
                }
                //최고기록보기 종료
            } // 사용자가 종료를 선택했을때
            else if (userChoice == 3) {
                System.out.println("프로그램을 종료합니다.");
            break;//break란, 반복문 혹은 switch조건문에서 사용되며 break를 만나는 순간  
            //break가 속한 반복문 혹은 switch조건문은 종료된다.
            }
            
        //종료하기 종료
        }scanner.close();
       
        
    }
}
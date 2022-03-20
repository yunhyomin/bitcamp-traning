package day0701;
// 랜덤 숫자 맞추기 게임

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

public class RandomGame {
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

            // 사용자의 선택에 따라 해당 기능의 코드들을 실행한다.
            if (userChoice == 1) {
                // 사용자가 플레이 하기를 실행했을 때

                // 1. 컴퓨터 숫자 지정
                int computerNumber = random.nextInt(NUMBER_MAX) + 1;

                // 2. 사용자가 입력한 숫자와 현재 기록을 저장할 int 변수
                int userNumber = 0;
                int currentScore = 0;

                // 3. userNumber가 computerNumber와 다를 동안
                // while을 반복한다.
                while (userNumber != computerNumber) {
                    // 사용자로부터 숫자를 입력 받아 검증한다.
                    System.out.println("1~100 사이의 숫자를 입력해주세요.");
                    userNumber = scanner.nextInt();

                    while (!(userNumber >= NUMBER_MIN && userNumber <= NUMBER_MAX)) {
                        System.out.println("잘못 입력하셨습니다.");
                        System.out.println("1~100 사이의 숫자를 입력해주세요.");
                        userNumber = scanner.nextInt();
                    }

                    // 사용자의 숫자와 컴퓨터의 숫자를 비교하여
                    // UP 혹은 DOWN을 입력한다.
                    if (userNumber < computerNumber) {
                        System.out.println("UP");
                    } else if (userNumber > computerNumber) {
                        System.out.println("DOWN");
                    }

                    // 현재점수를 1 증가시킨다.
                    currentScore++;
                }

                // 5. 최고 기록을 확인하여 갱신해야 한다면 갱신한다.
                System.out.printf("현재 기록: [%d]회\n", currentScore);
                System.out.printf("최고 기록: [%d]회\n", bestScore);
                if (bestScore > currentScore || bestScore == 0) {
                    System.out.println("짝짝짝 새로운 최고 기록입니다 짝짝짝");
                    bestScore = currentScore;
                }

                // 플레이 기능 종료
            } else if (userChoice == 2) {
                // 사용자가 최고 기록 보기를 실행했을 때

                // 만약 사용자가 한번이라도 플레이를 하였으면
                // 최고 기록은 무조건 0보다 큰 수가 된다.
                // 따라서 bestScore가 0보다 크면
                // 최고 기록을 보여주고
                // 그 외는 아직 플레이 한 적이 없음을 알려준다.
                if (bestScore > 0) {
                    System.out.printf("현재 최고 기록: [%d]회\n", bestScore);
                } else {
                    System.out.println("아직 플레이 기록이 존재하지 않습니다.");
                }

                // 최고 기록 보기 기능 종료
            } else if (userChoice == 3) {
                // 사용자가 종료를 실행했을 때
                System.out.println("사용해주셔서 감사합니다.");
                break;

                // 종료하기 기능 종료
            }

            // 메뉴 종료
        }

        scanner.close();
    }
}


package day0705;

// 숙제 2. 숫자 맞추기 게임에서 점수를 총 5개까지 보관하고 
//        점수는 자동으로 오름차순 정렬해서 보여주게 만들어주는 프로그램
import java.util.Random;
import java.util.Scanner;

public class Hw02RANDOM {
    public static void main(String[] args) {
        // 상수
        // 입력 가능 최소값
        final int NUMBER_MIN = 1;
        // 입력 가능 최대값
        final int NUMBER_MAX = 100;
        // 총 보관 점수 갯수
        final int SIZE = 5;

        // 변수
        // Scanner 클래스 변수
        Scanner scanner = new Scanner(System.in);
        // Random 클래스 변수
        Random random = new Random();
        // 점수 배열
        int[] scoreArray = new int[SIZE];
        // 점수 배열의 다음 입력할 인덱스
        int index = 0;

        while (true) {
            System.out.println("1. 플레이 2. 최고기록 보기 3. 종료");
            int userChoice = scanner.nextInt();
            if (userChoice == 1) {
                // 플레이 코드 구현

                // 이번 라운드 점수를 저장할 변수
                int currentScore = 0;

                // 컴퓨터 숫자 뽑는다
                int computerNumber = random.nextInt(NUMBER_MAX) + 1;
                System.out.println("computer 숫자: " + computerNumber);

                // 사용자가 입력한 숫자를 저장할 변수
                int userNumber = 0;

                // 사용자가 컴퓨터 숫자와 다른 숫자를 입력하는 동안
                // 계속 입력을 받는다.
                while (userNumber != computerNumber) {
                    // 사용자로부터 숫자를 하나 입력 받는다.
                    System.out.println("1~100 사이의 숫자를 입력해주세요.");
                    System.out.print("> ");
                    userNumber = scanner.nextInt();
                    // 사용자가 입력한 숫자가 유효한지 체크한다.
                    while (!(userNumber >= NUMBER_MIN && userNumber <= NUMBER_MAX)) {
                        System.out.println("잘못 입력하셨습니다.");
                        System.out.println("1~100 사이의 숫자를 입력해주세요.");
                        System.out.print("> ");
                        userNumber = scanner.nextInt();
                    }

                    // 현재 점수를 1 증가 시킨다.
                    currentScore++;

                    // 사용자가 입력한 숫자가 컴퓨터의 숫자보다 크거나 작으면
                    // UP 혹은 DOWN을 출력해준다.
                    if (userNumber < computerNumber) {
                        System.out.println("!!! UP !!!");
                    } else if (userNumber > computerNumber) {
                        System.out.println("!!! DOWN !!!");
                    }
                }

                // 사용자의 점수를 점수 배열에
                // 추가해야 '할' 경우 추가한다.
                // 이때에는 index의 값이 5 미만일 경우와
                // 그 외의 경우 2가지 경우에서 생각해봐야 한다.
                if (index < SIZE) {
                    scoreArray[index] = currentScore;
                } else {
                    // 점수 배열에서 현재 점수가 들어갈 위치를 찾는다.
                    // -> 각 배열의 값과 현재 점수를 비교해서
                    // 만약 해당 인덱스의 값이 현재 점수보다 크면
                    // 그 인덱스가 현재 점수가 들어갈 새로운 위치가 된다.

                    // 새로운 점수가 들어갈 위치
                    int newIndex = -1;

                    // 새로운 점수가 들어갈 위치를 찾는다
                    for (int i = 0; i < scoreArray.length; i++) {
                        if (scoreArray[i] > currentScore) {
                            newIndex = i;
                            break;
                        }
                    }

                    // 그 위치가 유효하면
                    // 해당 위치에 있던 점수부터 끝-1까지
                    // 1칸씩 뒤로 민다.
                    if (newIndex != -1) {
                        // 점수 배열에 들어갈 칸을 찾았으므로
                        // newIndex부터 한칸씩 뒤로 민다.
                        for (int i = scoreArray.length - 2; i >= newIndex; i--) {
                            scoreArray[i + 1] = scoreArray[i];
                        }
                        // 해당 위치에 현재 점수를 넣는다.
                        scoreArray[newIndex] = currentScore;
                    }

                }

                index++;

                // index의 현재값에 따라서
                // index-1까지 정렬을 할지
                // 아니면 배열 전체를 정렬을 할지 정해준다.
                int maxIndex = 0;
                if (index < scoreArray.length) {
                    maxIndex = index;
                } else {
                    maxIndex = scoreArray.length;
                }

                // 배열을 오름차순 정렬하되
                // 점수가 들어가지 않은 칸은
                // 정렬에서 제외한다.
                for (int i = 0; i < maxIndex - 1; i++) {
                    if (scoreArray[i] > scoreArray[i + 1]) {
                        int temp = scoreArray[i];
                        scoreArray[i] = scoreArray[i + 1];
                        scoreArray[i + 1] = temp;
                        i = -1;
                    }
                }
                System.out.println();
                System.out.printf("사용자의 이번 라운드 점수: [%3d]회\n", currentScore);
                System.out.println();

            } else if (userChoice == 2) {
                // 최고기록 보기 코드 구현

                // 1. index가 0일 경우 -> 경고 메시지만 출력
                // 2. index가 size보다 작을 경우 -> 0~index-1까지 출력
                // 3. index가 size보다 크거나 같을 경우 -> 배열 전체 출력
                if (index == 0) {
                    // 아직 플레이 기록이 없으므로 경고 메시지만 출력
                    System.out.println();
                    System.out.println("------------------------------");
                    System.out.println("아직 플레이 기록이 없습니다.");
                    System.out.println("------------------------------");
                    System.out.println();
                } else {
                    // index의 현재 값에 따라서
                    // index-1까지 출력할지 혹은
                    // SIZE-1까지 출력할지 결정한다.
                    // 즉, for문의 조건식에 들어갈 변수를 만들어서
                    // index로 초기화 하냐 혹은 SIZE로 초기화하냐만 정해주면
                    // 우리가 for문 하나로
                    // 2가지 경우를 출력해줄수 있게 된다.

                    int printMax = 0;

                    if (index < SIZE) {
                        // 점수가 아직 5개 미만으로 입력됬을 경우
                        printMax = index;
                    } else {
                        // 점수가 5개 이상 입력됬을 경우
                        printMax = SIZE;
                    }

                    for (int i = 0; i < printMax; i++) {
                        System.out.printf("%d등. [%d]회\n", i + 1, scoreArray[i]);
                    }
                }

            } else if (userChoice == 3) {
                // 종료 코드 구현
                System.out.println("플레이해주셔서 감사합니다.");
                break;
            }
        }

        // scanner 변수 닫아주기
        scanner.close();
    }
}

package day0706;

// 사용자로부터 번호, 이름, 국어, 영어, 수학을 입력받아서 
// 출력하는 프로그램을 만드시오.
// 단, 입력과 출력은 분리되어있습니다.
// 또한 입력과 출력은 메소드로 분리되어있는데
// 점수 입력 메소드를 만들어서 
// 그 메소드를 통해서 점수 입력/검증을 끝난 값을
// 각각의 점수에 넣을 수 있고
// 출력의 경우, 출력 메소드가 파라미터로 받은 값을
// 예쁘게 출력합니다.
// 20분까지
import java.util.Scanner;
import util.ScannerUtil;

public class GradeBook01 {
    // 상수
    // 과목 숫자
    static final int SUBJECT_SIZE = 3;
    // 최저 점수
    static final int SCORE_MIN = 0;
    // 최고 점수
    static final int SCORE_MAX = 100;
    // 위 코드에서 static이 붙는 이유는
    // static 메소드가 다른 상수 혹은 메소드를 호출하기 위해서는
    // 그 다른 상수나 메소드들도 static 이 붙어있어야 하기 때문이다.

    public static void main(String[] args) {
        // 변수
        Scanner scanner = new Scanner(System.in);
        int id = 0;
        String name = "";
        int korean = 0;
        int english = 0;
        int math = 0;
        boolean inputSwitch = false;

        while (true) {
            System.out.println("1. 입력 2. 출력 3. 종료");
            System.out.print("> ");
            int userChoice = scanner.nextInt();
            if (userChoice == 1) {
                // 입력 코드 구현

                // 번호 입력
                System.out.println("번호를 입력해주세요.");
                System.out.print("> ");
                id = scanner.nextInt();

                // 이름 입력
                name = ScannerUtil.nextLine(scanner, "이름");

                // 국어 입력
                korean = setScore("국어", scanner);

                // 영어 입력
                english = setScore("영어", scanner);

                // 수학 입력
                math = setScore("수학", scanner);

                // inputSwitch 값 변경
                inputSwitch = true;

            } else if (userChoice == 2) {
                // 출력 코드 구현
                if (inputSwitch) {
                    // 출력 메소드 실행
                    printInfo(id, name, korean, english, math);
                } else {
                    // 경고 메시지만 출력
                    System.out.println();
                    System.out.println("---------------------");
                    System.out.println("아직 입력된 정보가 없습니다.");
                    System.out.println("---------------------");
                    System.out.println();
                }

            } else if (userChoice == 3) {
                System.out.println("사용해주셔서 감사합니다.");
                break;
            }
        }

        scanner.close();
    }

    public static void printInfo(int id, String name, int korean, int english, int math) {
        // 총점 계산
        int sum = korean + english + math;

        // 평균 계산
        double average = (double) sum / SUBJECT_SIZE;

        // 출력
        System.out.printf("번호: %03d번 이름: %s\n", id, name);
        System.out.printf("국어: %03d점 영어: %03d점 수학: %03d점\n", korean, english, math);
        System.out.printf("총점: %03d점 평균: %06.2f점\n", sum, average);
    }

    // 점수를 입력받는 메소드
    public static int setScore(String message, Scanner scanner) {
        int score = 0;
        System.out.println(message);
        System.out.print("> ");
        score = scanner.nextInt();

        while (!(score >= SCORE_MIN && score <= SCORE_MAX)) {
            System.out.println("잘못 입력하셨습니다.");
            System.out.println(message);
            System.out.print("> ");
            score = scanner.nextInt();
        }

        return score;
    }
}









package day0709;

// 전역 변수를 사용하여 
// 로또 예제를 풀어보자
import java.util.Scanner;
import java.util.Random;
import util.ArrayUtil;
import util.ScannerUtil;

public class Lotto01 {
    // 상수
    static final int SIZE = 6;
    static final int NUMBER_MIN = 1;
    static final int NUMBER_MAX = 45;
    static final int OPTION_COM = 1;
    static final int OPTION_USER = 2;
    // 전역 변수
    static Scanner scanner = new Scanner(System.in);
    static int[] computerNumbers = new int[0];
    static int[][] userNumbers;

    public static void main(String[] args) {
        // 사용자로부터 몇게임 할지 입력 받아
        // userNumbers 배열을 초기화 하는 메소드 호출
        setUserGames();

        // 컴퓨터 숫자를 지정하는 메소드 호출
        setComputer();

        // 사용자 숫자를 지정하는 메소드 호출
        setUser();

        // 결과 출력 메소드 호출
        printResult();
    }

    public static void setUserGames() {
        // 사용자로부터 총 몇게임 할지 입력 받는다.
        String message = "총 몇게임을 하시겠습니까?";
        int userChoice = ScannerUtil.nextInt(scanner, message);

        // 입력받은 숫자로 2차원 배열 userNumbers의
        // 크기를 초기화한다.
        userNumbers = new int[userChoice][0];
    }

    public static void setComputer() {
        computerNumbers = insertAuto();
    }

    public static int[] insertAuto() {
        int[] arr = new int[0];
        Random random = new Random();
        while (ArrayUtil.size(arr) < SIZE) {
            int number = random.nextInt(NUMBER_MAX) + 1;
            if (!ArrayUtil.contains(arr, number)) {
                arr = ArrayUtil.add(arr, number);
            }
        }

        return arr;
    }

    public static void setUser() {
        String message = "1. 자동 2. 수동";
        for (int i = 0; i < userNumbers.length; i++) {
            System.out.printf("%d번 게임\n", i + 1);
            int userChoice = ScannerUtil.nextInt(scanner, message);
            if (userChoice == 1) {
                // 자동으로 i번째 배열에 숫자를 넣는다.
                userNumbers[i] = insertAuto();
            } else {
                // 입력으로 i번째 배열에 숫자를 넣는다.
                userNumbers[i] = insertManual();
            }
        }
    }

    public static int[] insertManual() {
        int[] arr = new int[0];
        String message = "1~45 사이의 숫자를 입력해주세요.";
        while (ArrayUtil.size(arr) < SIZE) {
            System.out.printf("%d번 숫자\n", ArrayUtil.size(arr) + 1);
            int number = ScannerUtil.nextInt(scanner, message, NUMBER_MIN, NUMBER_MAX);
            if (ArrayUtil.contains(arr, number)) {
                System.out.println("중복된 숫자입니다.");
            } else {
                arr = ArrayUtil.add(arr, number);
            }
        }

        return arr;
    }

    public static void printResult() {
        // 컴퓨터 숫자 출력
        printNumbers(computerNumbers, OPTION_COM);

        // 사용자 숫자 + 맞은 갯수 출력
        for (int i = 0; i < userNumbers.length; i++) {
            System.out.printf("%d번 게임\n", i + 1);
            printNumbers(userNumbers[i], OPTION_USER);
        }
    }

    public static void printNumbers(int[] arr, int option) {
        System.out.println("----------------------");
        for (int i = 0; i < arr.length; i++) {
            System.out.printf("%2d ", arr[i]);
        }
        if (option == OPTION_USER) {
            System.out.printf("맞은 갯수: %2d개", compare(arr));
        }
        System.out.println();
        System.out.println("----------------------");
    }

    public static int compare(int[] arr) {
        int count = 0;
        for (int i = 0; i < computerNumbers.length; i++) {
            for (int j = 0; j < arr.length; j++) {
                if (computerNumbers[i] == arr[j]) {
                    count++;
                }
            }
        }
        return count;
    }
}

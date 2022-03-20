package day0708;

//사용자가 로또번호 6개를 입력받는 프로그램
//단, 이제는 여러분들이 call by value,call by reference를 배웠으므로 
//좀 더 메소드 분리를 적극적으로 해보게 될 것이다.
import java.util.Scanner;
import java.util.Random;
import util.ArrayUtil;
import util.ScannerUtil;

public class Ex_LottoGame02 {
    static final int SIZE = 6;
    static final int NUMBER_MAX = 45;
    static final int NUMBER_MIN = 0;

    public static void main(String[] args) {
        // 상수
        Random random = new Random();
        Scanner scanner = new Scanner(System.in);
        int[] numbers = new int[0];

        // number에 숫자를 넣는 메소드 호출
        // 단, 해당 메소드가 새로운 주소값을 부여할 것이므로
        // numbers에 메소드의 리턴값을 할당한다.
        numbers = setNumbers(numbers, scanner);
        // numbers를 정렬하는 메소드 호출
        sort(numbers);
        // 이때에는 새로운 조소갑이 부여되지 않으므로
        // 다시 할당할 필요가 없다.

        // numbers를 출력하는 메소드 호출.
        print(numbers);
        scanner.close();
    }

    public static int[] setNumbers(int[] arr, Scanner scanner) {
        String message = "1~45 사이의 숫자를 입력해주세요.";
        while (ArrayUtil.size(arr) < SIZE) {
            // 1. 사용자로부터 숫자를 입력받는다.
            System.out.println();
            System.out.println("==========================");
            System.out.printf("[%d번 숫자", ArrayUtil.size(arr) + 1);
            System.out.println("==========================");
            System.out.println();
            int number = ScannerUtil.nextInt(scanner, message, NUMBER_MIN, NUMBER_MAX);
            // 2. 해당 숫자가 배열에 존재하는지 체크한다.
            if (!ArrayUtil.contains(arr, number)) {
                // 3. 만약 존재하지 않는다면 arr에 추가해준다.
                arr = ArrayUtil.add(arr, number);
            } else {
                // 4. 존재하면 경고메세지만 출력한다.
                System.out.println("중복된 숫자입니다.");
            }
        }
        return arr;
    }

    // 정렬하는 메소드
    public static void sort(int[] arr) {
        for (int i = 0; i < ArrayUtil.size(arr) - 1; i++) {
            if (arr[i] > arr[i + 1]) {
                int temp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = temp;
                i = -1;
            }
        }
    }

    // 출력하는 메소드
    public static void print(int[] arr) {
        for (int i = 0; i < ArrayUtil.size(arr); i++) {
            System.out.printf("%d번 숫자: [%2d]\n", i + 1, arr[i]);
        }
    }
}

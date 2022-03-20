package day0708;
//ArrayUtil을 사용한 로또번호 제작기

//첫번째 버전: 컴퓨터의 숫자만 뽑아주는 제작기

import java.util.Random;
import util.ArrayUtil;
import util.ScannerUtil;
import java.util.Scanner;

public class mineLotto {
    // 상수
    static final int NUMBER_MIN = 1;
    static final int NUMBER_MAX = 45;
    static final int SIZE = 6;

    public static void main(String[] args) {
        // 변수
        int[] numbers = new int[0];
        Scanner scanner = new Scanner(System.in);

        // 숫자입력받는 메소드호출
        numbers = setNumber(numbers, scanner);
        // 정렬하는 메소드호출
        sort(numbers);
        // 출력하는 메소드호출
        print(numbers);
        scanner.close();
    }

    // 숫자를 입력받는 메소드
    public static int[] setNumber(int[] arr, Scanner scanner) {
        String message = "1~45사이의 숫자를 입력해 주세요";
        while (ArrayUtil.size(arr) < SIZE) {
            System.out.println();
            System.out.println("====================");
            System.out.printf("%d번 숫자:", ArrayUtil.size(arr) + 1);
            System.out.println("====================");
            System.out.println();
            int number = ScannerUtil.nextInt(scanner, message, NUMBER_MIN, NUMBER_MAX);
            // 입력된 숫자를 중복검사한다.
            if (!ArrayUtil.contains(arr, number)) {
                arr = ArrayUtil.add(arr, number);
            } else {
                System.out.println("중복된 숫자입니다.");
            }

        }

        return arr;
    }

    // 정렬하는 메소드
    public static void sort(int[] arr) {
        for (int i = 0; i < ArrayUtil.size(arr)-1; i++) {
            if (arr[i]>arr[i+1]) {
                int temp = ArrayUtil.set(arr,i,i+1);
                    arr[i+1] = temp;
                 i=-1;
            }
        }
    }

    // 출력하는 메소드
    public static void print(int[] arr) {
        for (int i = 0; i < ArrayUtil.size(arr); i++) {
            System.out.printf("%d번 숫자 :[%d]\n", i + 1, ArrayUtil.get(arr, i));

        }

    }

}

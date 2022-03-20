package day0630;
//숙제1.

//2가지 검증방법을 각각 사용하여 사용자의 나이에 따른 
//영유아, 어린이,청소년,성인을 출력하는 프로그램을 작성하시오 
//기네스북에 따르면, 세상에서 가장 나이가 많았던 사람의 나이는 122세였습니다.

import java.util.Scanner;

import javax.naming.PartialResultException;

public class AgeChecker2 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("나이를 입력해 주세요");
        System.out.print(">");

        int a = scanner.nextInt();
        System.out.println("빡빡한 조건식");// 빡빡한 검증
        String result;
        if (a >= 0 && a <6) {
            result = "영유아";
        } else if (a >= 6 && a <= 13) {
            result = "어린이";
        } else if (a >= 14 && a <= 18) {
            result = "청소년";
        } else if (a >= 20 && a <= 122) {
            result = "성인";
        } else {
            result = "잘못 입력하셨습니다.";
        }
        System.out.printf("나이:%d세 %s\n", a, result);

        System.out.println("올바른 범위 선검사");// 올바른 범위의 선검증

        if (0 <= a && a <= 122) {// 올바른 범위를 선검증 한다.중첩if문을 사용한다.

            if (a >= 0 && a < 6) {
                result = "영유아";
            } else if (a >= 6 && a <= 13) {
                result = "어린이";
            } else if (a >= 14 && a <= 18) {
                result = "청소년";
            } else {
                result = "성인";
            }
            System.out.printf("나이:%d세 %s\n", a, result);
        } else {
            System.out.println("잘못 입력하셨습니다.");
        }
        scanner.close();
    }
}

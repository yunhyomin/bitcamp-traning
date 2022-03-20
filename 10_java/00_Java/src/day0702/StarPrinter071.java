package day0702;

import java.util.Scanner;

public class StarPrinter071 {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        System.out.println("7번 별찍기 if else if문 넣어서 만들기");
        System.out.println("출력할 줄 수를 입력해주세요.");
        System.out.print(">");

        int userNumber = scanner.nextInt();

        int iStart = 1;
        int iEnd = userNumber * 2 - 1;
        // userNumber에 5를 넣어도 9줄이 되게 만들어야된다.
        for (int i = iStart; i <= iEnd; i++) {
            String stars = "";

            // i가<=userNumber때의 j문들을 만든다.
            if (i <= userNumber) {
                // 별을 담당하는 j for문을 만든다.
                for (int j = 1; j <= i; j++) {
                    stars += "*";
                }
                // 공백을 담당하는 j for문을 만든다.
                for (int j = 1; j <= userNumber-i; j++) {
                    stars += " ";
                }
            } // i>userNumber일때의 j for문들을 만든다.
            else if (i > userNumber) {
                // 별을담당하는 j for문을 만든다
                for (int j = i-userNumber; j <= userNumber-1; j++) {
                    stars += "*";
                }
                // 공백을 담당하는 j for문을 만든다.
                for (int j = 1; j <= i-userNumber; j++) {
                    stars += " ";
                }

            }
            System.out.println(stars);
        }
        scanner.close();
    }
}

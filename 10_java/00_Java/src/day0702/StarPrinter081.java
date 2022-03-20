package day0702;

import java.util.Scanner;

public class StarPrinter081 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("별찍기 8번 for문 나눠서만들기.");
        System.out.println("출력할 줄 수를 입력해주세요.");
        System.out.print(">");
        int userNumber = scanner.nextInt();

        int iStart = 1;
        int iEnd = userNumber;
        //위의 5줄의 i for문
        for (int i = iStart; i <= iEnd; i++) {
            // i번째 줄에 어떤내용이 출력될지를
            // 담을 String 변수 stars
            String stars = "";

            // 공백을 위한 j for문
            int jStart = 1;
            int jEnd = userNumber - i;
            for (int j = jStart; j <= jEnd; j++) {
                stars += " ";
            }
            // 별을 위한 j for 문
            jStart = 1;
            jEnd = i;
            for (int j = jStart; j <= jEnd; j++) {
                stars += "*";
            }
            System.out.println(stars);
        }
        // 아래 4줄의 i for문

        iEnd= 1;
        iStart = userNumber - 1;
        for (int i = iStart; i >= iEnd; i--) {
            // i번째 줄에 어떤내용이 출력될지를
            // 담을 String 변수 stars
            String stars = "";

            // 공백을 위한 j for문
            int jStart = 1;
            int jEnd = userNumber - i;
            for (int j = jStart; j <= jEnd; j++) {
                stars += " ";
            }
            // 별을 위한 j for 문
            jStart = 1;
            jEnd = i;
            for (int j = jStart; j <= jEnd; j++) {
                stars += "*";
            }
            System.out.println(stars);
        }
        scanner.close();
    }

}

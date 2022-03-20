package day0702;

// 별찍기 10번
import java.util.Scanner;

public class StarPrinter10 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("별찍기 10번");
        System.out.println("출력할 줄 수");
        System.out.print("> ");
        int lineNumber = scanner.nextInt();

        for (int i = 1; i <= 2 * lineNumber - 1; i++) {
            String stars = "";

            if (i == 1 || i == 2 * lineNumber - 1) {
                // 맨 첫번째 줄 or 맨 마지막 줄
                for (int j = 1; j <= 2 * lineNumber - 1; j++) {
                    stars += "*";
                }
            } else {
                int starWidth;
                int spaceWidth;

                if (i < lineNumber) {
                    // 윗부분
                    // 윗부분에서 사용할 i
                    int upperI = i - 1;
                    starWidth = lineNumber - upperI;
                    spaceWidth = 2 * upperI - 1;

                } else {
                    // 아랫부분
                    // 아랫부분에서 사용할 i
                    int lowerI = i - lineNumber + 1;
                    starWidth = lowerI;
                    spaceWidth = 2 * lineNumber - 1 - 2 * starWidth;

                }

                // 왼쪽 별을 담당하는 j for 문
                for (int j = 1; j <= starWidth; j++) {
                    stars += "*";
                }

                // 가운데 공백을 담당하는 j for 문
                for (int j = 1; j <= spaceWidth; j++) {
                    stars += " ";
                }

                // 오른쪽 별을 담당하는 j for 문
                for (int j = 1; j <= starWidth; j++) {
                    stars += "*";
                }

            }

            System.out.println(stars);
        }

        scanner.close();
    }
}

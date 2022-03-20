package day0707;
// 별찍기 1번, 5번, 10번을

// char의 2차원 배열을 사용하여
// 만드시오.
// 단, 사용자가 5라면 입력하면 각각 5줄, 5줄, 9줄이 출력되고
// 각 줄의 칸은 5, 9, 9 가 됩니다.
// 공백은 아무것도 넣지 않으면 공백이 나오게 됩니다.

// 12시 5분까지
import java.util.Scanner;
import util.ScannerUtil;

public class StarPrinter01 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // 사용자로부터 출력할 줄 수를 입력 받는다.
        int lineNumber = ScannerUtil.nextInt(scanner, "출력할 줄 수를 입력해주세요.");

        // 사용자로부터 입력받은 줄 수에 맞춰서
        // 2차원 배열을 만든다.
        char[][] stars = new char[lineNumber][lineNumber];

        // 2차원 배열에
        // 각각 알맞는 값들을 입력한다.
        for (int i = 0; i < stars.length; i++) {
            int starWidth = i + 1;
            for (int j = 0; j < starWidth; j++) {
                stars[i][j] = '*';
            }
        }

        // 2차원 배열을 출력한다.
        for (int i = 0; i < stars.length; i++) {
            for (int j = 0; j < stars[i].length; j++) {
                System.out.print(stars[i][j]);
            }

            System.out.println();
        }
    }
}

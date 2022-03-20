package day0707;

import java.util.Scanner;
import util.ScannerUtil;

public class StarPrinter10 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int lineNumber = ScannerUtil.nextInt(scanner, "출력할 줄 수");

        // 총 세로 줄 수
        int totalHeight = 2 * lineNumber - 1;

        // 총 가로 칸 수
        int totalWidth = 2 * lineNumber - 1;

        // 값을 저장할 2차원 배열
        char[][] stars = new char[totalHeight][totalWidth];

        // 각 칸의 값을 저장할 for 문
        for (int i = 0; i < stars.length; i++) {
            if (i == 0 || i == stars.length - 1) {
                for (int j = 0; j < stars[i].length; j++) {
                    stars[i][j] = '*';
                }
            } else {
                // 별의 갯수를 결정한다.
                int starWidth;
                if (i < lineNumber) {
                    // i가 1부터 시작
                    starWidth = lineNumber - i;
                } else {
                    // i가 lineNumber부터 여기로
                    int lowerI = i - lineNumber + 2;
                    starWidth = lowerI;
                }

                // 왼쪽 별을 추가하는 j for 문
                for (int j = 0; j < starWidth; j++) {
                    stars[i][j] = '*';
                }

                // 오른쪽 별을 추가하는 j for 문
                // 가장 마지막 칸의 인덱스를 저장할
                // int 변수
                int lastIndex = stars[i].length - 1;
                for (int j = lastIndex; j > lastIndex - starWidth; j--) {
                    stars[i][j] = '*';
                }
            }
        }

        // 출력용 for 문
        for (int i = 0; i < stars.length; i++) {
            for (int j = 0; j < stars[i].length; j++) {
                System.out.print(stars[i][j]);
            }

            System.out.println();
        }

        scanner.close();
    }
}

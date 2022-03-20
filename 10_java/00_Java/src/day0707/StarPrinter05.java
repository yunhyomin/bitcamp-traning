package day0707;
// 별찍기 5번
import java.util.Scanner;
import util.ScannerUtil;
public class StarPrinter05 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int lineNumber = ScannerUtil.nextInt(scanner, "출력할 줄 수");
        
        // 각 줄의 가로 칸 수
        int totalWidth = 2 * lineNumber - 1;
        
        // 2차원 배열 선언
        char[][] stars = new char[lineNumber][totalWidth];
        
        // 2차원 배열의 각 칸의 값 결정
        for(int i = 0; i < stars.length; i++) {
            // 우리가 계산하기 쉽게
            // i를 1부터 시작하게 저장하는 변수
            int newI = i + 1;
            
            // 공백의 갯수
            int spaceWidth = lineNumber - newI;
            
            // 별의 갯수
            int starWidth = newI * 2 - 1;
     
            // 별을 담당하는 j for 문
            for(int j = spaceWidth; j < spaceWidth + starWidth; j++) {
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
        
        
        
        scanner.close();
    }
}







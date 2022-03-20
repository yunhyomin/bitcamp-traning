
package day0702;
//별찍기 6번

import java.util.Scanner;

public class StarPrinter06 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("별찍기 6번");
        System.out.println("출력할 줄 수를 입력해주세요");
        System.out.print(">");
        int userNumber = scanner.nextInt();

//5번과 반대의 경우로 i for문에서 제어변수 i의 선언을 바꾸고 
        //i의 반복범위를 바꾸고 i의 변화식을 --로 바꾸면 5와 반대의 모양이 된다
        for (int i = userNumber; i >= 1; i--) {
            String stars = "";
            // 공백을 갯수를 저장한 int 변수
            int spaceWidth =  userNumber-i;
            // 별의 갯수를 저장한 int 변수
            int starsWidth = i * 2 - 1;
            // 공백을 담당하는 j for문
            for (int j = 1; j <= spaceWidth; j++) {
                stars += " ";
            }
            // 별을 담당하는 j for문
            for (int j = 1; j <= starsWidth; j++) {
                stars += "*";
            }
            System.out.println(stars);
        }

        scanner.close();
    }
}

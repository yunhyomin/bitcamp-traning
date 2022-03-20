package day0702;
//별찍기 10번

import java.util.Scanner;

public class StarPrinter10_2 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("별찍기 10번");
        System.out.println("출력할 줄 수를 입력해주세요");
        System.out.print(">");
        int userNumber = scanner.nextInt();

        // i for문은 총 몇줄이 출력될지를 결정한다.
        // 그렇다면 i의 최소값은? 1
        // 그렇다면 i의 최대값은? userNumber

        int iStart = 1;
        int iEnd = userNumber * 2 - 1;

        for (int i = iStart; i <= iEnd; i++) {
            // i번째 줄에 어떤내용이 출력될지를
            // 담을 String 변수 stars
            String stars = "";
            // 가장 첫줄과 마직막줄을 모두 별로 채운다.
            if (i == 1 && i == iEnd) {
                for (int j = 1; j <= iEnd; j++) {
                    stars += "*";
                }
            } // i가 userNumber보다 작거나 같을때
            else if (i <= userNumber) {
                // 왼쪽 별을 담당하는 j for문
                int starWidth = userNumber; // 별의 갯수를 저장할 int 변수
                for (int j = i; j <= starWidth; j++) {
                    stars += "*";
                }
                // 중간 공백을 담당하는 j for문
                int spaceWidth = i * 2 - 3;// 공백의 갯수를 나타내는 int 변수
                for (int j = 1; j <= spaceWidth; j++) {
                    stars += " ";
                }
                // 오른쪽 별을 담당하는 j for문
                for (int j = i; j <= starWidth; j++) {
                    stars += "*";
                }
            } // i가 userNumber보다 클때
            else  {
                // 왼쪽 별을 담당하는 j for문
                int starWidth = i;// 왼쪽 별의 갯수를 저장하는 int변수
                for (int j = userNumber; j <= starWidth; j++) {
                    stars += "*";
                }
                // 중간 공백을 담당하는 j for문
                int spaceWidth = userNumber * 2 - 2;// 중간공백의 갯수를 저장하는 int변수
                for (int j = i * 2 - userNumber * 2; j <= spaceWidth; j++) {
                    stars += " ";
                }
                // 오른쪽 별을 담당하는 j for문
                for (int j = userNumber; j <= starWidth; j++) {
                    stars += "*";
                }
            }
            System.out.println(stars);

        }

        scanner.close();
    }
}

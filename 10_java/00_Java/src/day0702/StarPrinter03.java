package day0702;
//별찍기 3번

import java.util.Scanner;

public class StarPrinter03 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("별찍기3번");
        System.out.println("출력할 줄 수를 입력해주세요");
        System.out.print(">");
        int userNumber = scanner.nextInt();
        int iStart = 1;
        int iEnd = userNumber;
        
        for(int i = iStart; i<=iEnd; i++) {
            //i줄에 넣은 내용을 string 값으로 저장
            String stars = "";
           
            int jStart = i;
            int jEnd = userNumber;
            
            //공백을 담당하는 j for문
            for(int j = jStart; j<=jEnd; j++) {
                stars = " ";
            }
            jStart = userNumber-i;
            jEnd = userNumber;
            //별을 담당하는 j for문
            for(int j =jStart; j<=jEnd; j++) {
                stars = "*";
            }
            System.out.println(stars);
        }
        
        scanner.close();
    }
}
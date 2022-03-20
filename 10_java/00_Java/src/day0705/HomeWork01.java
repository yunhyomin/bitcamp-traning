package day0705;
//숙제1. 5명의 키와 몸무게를 토대로 해서 bmi결과를 입력한 사람까지만 출력하는 프로그램
//숙제2. 숫자 맞추기 게임에서 점수를 총 5개까지 보관하고
//점수는 자동으로 오름차순 정렬해서 보여주게 만들어주는 프로그램

import java.util.Scanner;
public class HomeWork01 {
    public static void main(String[]args) {
        Scanner scanner = new Scanner(System.in);
        
        //상수 
        final int SIZE = 5;
        final double H_MAX = 2.72;
        final int W_MAX = 635;
        
        //배열
        int[] idArray = new int[SIZE];
        String[] nameArray = new String[SIZE];
        int[] hArray = new int[SIZE];
        int[] wArray = new int[SIZE];
        
        while(true) {
           
            System.out.println("1.입력 2.출력");
            int userChoice = scanner.nextInt();
            while(!(userChoice >= 1 && userChoice <=2)) {
                System.out.println("잘못입력하셨습니다.");
                System.out.println("1.입력 2.출력");
                userChoice = scanner.nextInt();
            }
            if(userChoice == 1) {
                
                
            }else if(userChoice == 2) {
                
                
            }
            
        }
        
    }
}

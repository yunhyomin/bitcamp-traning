package day0705;
//사용자로부터 숫자5개를 입력받아서 
//차례대로 출력하는 크로그램을 작성하시오

import java.util.Scanner;
public class Ex02Array2 {
    public static void main(String[]args) {
        Scanner scanner = new Scanner(System.in);
       //int 배열선언
        int[] arr = new int[5];
        
        //배열의 각 인덱스번 칸에 숫자를 입력받는다.
        for(int i = 0; i<arr.length; i++) {
            System.out.printf("%d번 칸의 값을 입력해주세요:",i+1);//i+1을 하는건 칸수를 쓰려고함.
            arr[i] = scanner.nextInt();//사용자가 입력하는 숫자를 배열 arr의 i칸에 저장한다.
        }
        
         //for문을 사용하여 
        //배열 전체를 출력한다.
        for(int i =0; i<arr.length; i++) {
            System.out.printf("arr[%d]: %d\n", i, arr[i]);
        }
        scanner.close();
    }
}

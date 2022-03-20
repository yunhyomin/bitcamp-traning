package day0714;

import java.util.Scanner;

import util.ScannerUtil;
//사용자가 입력한 숫자가 몇자리 숫자인지 확인하고 
//만약 4자리 숫자일 경우 천의 자리 백의자리 십의 자리 일의자리가 각각 얼마인지 출력하는 코드를 작성
public class TestReview0714_2 {
    public static void main(String[] agrs) {
        Scanner scanner = new Scanner(System.in);
       //사용자로 부터 숫자를 입력받는다.
        String message = "숫자를 입력하세요";
       int userNumber = ScannerUtil.nextInt(scanner, message);
       //4자리숫자가 맞는지 확인한다.
       //   4자리 숫자이려면 1000이상 9999이하의 범위에 속하면 된다.
        if(userNumber <= 9999 && userNumber >=1000) {
       //4자리 숫자일 경우, 각자리를 분리해낸다.
       //   먼저 임시변수에 사용자가 입력한 숫자를 할당한다.
            int temp = userNumber;
       //   사용자가 입력한 값/1000을 변수 1에 저장한다.
            int num1 = userNumber/1000;
       //   임시변수에 %= 연산자를 사용하여 1000으로 나눈 나머지를 저장한다.
            temp %= 1000;
       //   임시변수/100을 변수2에 저장한다.
            int num2 = temp/100;
       //   임시변수에 %=연산자를 사용하여100으로 나눈 나머지를 저장한다.
            temp %= 100;
       //   임시변수/10을 변수3에 저장한다.
            int num3 = temp/10;
       //   임시변수에 %= 연산자를 사용하여 10으로 나눈나머지를 변수3에 저장한다.
            temp %= 10;
            int num4 = temp;
      
           System.out.printf("천의자리:%d 백의자리:%d\n 십의자리:%d 일의자리:%d",
                   num1,num2,num3,num4);
        }
           
       }
       
                
    }


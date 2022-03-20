package day0630;
//1.number를 5로 초기화 하고 
//0보다 큰지 확인해서 0보다 크면"양의 정수입니다"라고 출력되는 프로그램을 작성하시오.

//2.사용자로부터 나이를 입력받아서 19세 미만일경우 "미성년자 입니다"라고 출력되게 코드를 만드시오

//3.사용자로부터 숫자를 하나 입력받아서 그 숫가다 홀수이면 "홀수입니다"가 출려고디게 코드를 만드시오

//4.사용자로부터 숫자를 입력받아서 해당 숫자가 10부터 99사이의 두자리 숫자이면 
//"두자리 숫자입니다" 라고 출력되게 코드를 만드시오

//5.사용자가 숫자를 입력하면 그 숫자가 음수이거나 1000보다 크면
//"잘못 입력하셨습니다."라고 출력되게 코드를 만드시오

import java.util.Scanner;
public class Ex02If2 {
    public static void main(String[]arg) {

        //1
        System.out.println("1번");
        int number = 5;
        if(number>0) {
            System.out.println("양의 정수입니다");
        }
        System.out.println("---------------------");
        //2
        System.out.println("2번");
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("나이를 입력해주세요");
        System.out.print(">");//사용자에게 나이입력받기
        int age = scanner.nextInt();//변수에 저장
        
        if(age<19) {
            System.out.println("미성년자입니다"); 
            }//if문을 통해 미성년자인지 확인하여 출력
        System.out.println("---------------------");
        //3
        System.out.println("3번");
        System.out.println("숫자를 입력해주세요");
        System.out.print(">");//사용자에게 숫자입력받기
        number = scanner.nextInt();//변수에 저장
        
        if(number%2==1) {// %는 앞의숫자 나누기 뒤의숫자를하고 남은 나머지를 구해준다.
                         //==는 두개가 같으면 true, 다르면 false
            System.out.println("홀수입니다");
        }//사용자가 입력한 숫자와 2를 나머지 연산한 결과값을 확인하여 출력
        System.out.println("---------------------");
        //4
        System.out.println("4번");
        System.out.println("숫자를 입력해주세요");
        System.out.print(">");//사용자에게 숫자입력받기
        number = scanner.nextInt();
        
        if(10<=number&&number<=99) {//10보다 크거나 같'고'99보다 작거나 같으면 출력
            System.out.println("두자리 숫자입니다");
        }//&&는 AND연산자 
        System.out.println("---------------------");
        //5
        System.out.println("5번");
        System.out.println("숫자를 입력해주세요");
        System.out.print(">");//사용자에게 숫자입력받기
        int k = scanner.nextInt();//숫자를 변수에 저장
        
        if(k<0||k>1000) {//0보다 작거'나' 1000보다 크면 출력
            System.out.println("잘못입력하셨습니다.");
        }//||는 OR연산자
        
        scanner.close();
        
    }
}
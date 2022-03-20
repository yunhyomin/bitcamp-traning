package day0630;
//if - else구조
//민약 if의 조건식이 false가 나오는 경우에는 else의 코드블락이 실행되는 구조로써
//if조건식이 false가 나올 경우를 대비하여 해당경우에 실행할 코드를 else가 담당하게 된다.

//단, if -else구조에서는 if 코드블락만 실행되거나 else 코드블락만 실행하게 된다.

public class Ex03IfElse {
    public static void main(String[]args) {
        //int 변수 number를 선언하고 8을 초기화한다.
        int number = 8;
        if(number<10) {
            System.out.println("10보다 작습니다");
        }else {
            System.out.println("10보다 크거나 같습니다");
        }
            System.out.println("프로그램 종료");
    }
}

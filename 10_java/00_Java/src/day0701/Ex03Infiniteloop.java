package day0701;
//무한루프 
//반복문의 조건식이 항상 참이 나오는 조건식이여서 해당 반복문이 끝나지 않고 영원히(무한하게) 반복되는 반복문을 무한루프라고 한다.

//무한루프를 만드는 반법은 다양하게 있지만 우리는 여기서 while을 사용한 3가지방법을 알아보자.

public class Ex03Infiniteloop {
    public static void main(String[]args) {
        //무한루프 1. 
        //조건식안의 변수의 값이 변동이 없는 경우
        int number = 1;
        
//        while(number<4) {
//            System.out.println(number);
//        }
    
        //2.항상 참이 나오는 조건식을 사용한 while문
        //while(0 != 1) {
        //    System.out.println("무한루프 2번");
        //}
        
        //2번 이후로는 무한 루프가 다음줄에 코드를 작성하면 반드시 에러가 발생한다.
        //System.out.println("무한루프 2번");->에러
        
        //3. true
        while(true) {
            System.out.println("무한루프 3번");
        }
    }
    
}

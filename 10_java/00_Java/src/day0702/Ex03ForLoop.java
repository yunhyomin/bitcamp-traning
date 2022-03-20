package day0702;
//for반복문은 while반복문과는 다르게 좀 더 명확하게 횟수가 표현이 된다.

//for반복문의 기본구조
//for(제어변수의 선언; 반복조건식; 제어변수의 변화식{
//    반복할코드
//}

public class Ex03ForLoop {
    public static void main(String[]args) {
        //for반복문
        System.out.println("for문 기본형태");
        for(int i = 1; i <= 3; i++) {
            System.out.printf("i의 현재값: [%d]\n",i);
        }
            //위의 for 문은 다음과 같은 순서를 가진다.
            //1.int i = 1;->i현재값: 1
            //2.i <= 3; ->true
            //3.System.out.printf("i의 현재값: [%d]\n",i);
            //4.i++; -> i의 현재값:2
            //5.i <= 3;-> true
            //6.System.out.printf("");
            //7.i++;->i의 현재값:3
            //8.i<3;->true
            //9.System.out.printf("");
            //10. i++;->i의 현재값:4 
            //11.i<=3;->false->for문 종료
        
        System.out.println("\n===============================\n");
        
        //for문에 관한 팁
        //1. 제어변수의 이름은 우리가 원하는대로 지어도 되지만 
        //  정통적으로 i 부터 시작해서 중첩레벨에 따라 j,k,l...순으로 들어간다.
        
        
        //2.만약 조건식이 맨처음부터 false가 나올때에는 아무것도 실행되지 않는다.
        System.out.println("2.false조건식");
        for(int i=10; i<=3; i++) {
            System.out.println("i");
        }
        System.out.println("\n=============================\n");
        
        //3.변화식은 ++이외에도 변수의 값을 변화시킬수있는 할당연산자면 뭐든 사용가능
        System.out.println("3.변화식");
       for(int i = 10000000; i>0; i/=10) {
           System.out.println(i);
       }
        System.out.println("\n=============================\n");
        
        //4.만약 변화식이 생략되면?
        //무한루프가 된다
        System.out.println("4.변화식생략");
//        for(int i=1; i<3;) {
//            System.out.println(i);
//        }
        System.out.println("\n=============================\n");
        
        //5.제어변수의 초기화나 조건식에는 다른 변수가 들어갈 수 있다.
        int start = 3;
        int end = 7;
        System.out.println("5.다른변수 사용한 if문");
        for(int i=start; i<end; i++) {
            System.out.println(i);  
        }
        System.out.println("\n=============================\n");
    }
}

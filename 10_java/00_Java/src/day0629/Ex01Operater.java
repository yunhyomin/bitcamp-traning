package day0629;
//연산자 (Operator)
//수학적 기호에 프로그래밍 기능이 정의 되어있어서 
//해당코드를 컴파일하게 되면 해당기능이 자동으로 실행되는 특수문자들

//산술,할당,비교,논리,비트 5가지 연산자가 있다.

public class Ex01Operater {
    public static void main(String[] args) {
        //int 변수 num1, num2를 선언해서 각각3과 7로 초기화
        int num1 = 3;
        int num2 = 7;
        //1. +
        System.out.println("1.+");
        System.out.println("num1+num2");
        //아래코드의 의미는 
        //num1의 현재 저장된 값과 num2d의현재 저장된 값을 더한 
        //결과값을 화면에 출력해라~라는 의미.
        System.out.println(num1+num2);
        
        //2. -
        System.out.println("2.-");
        System.out.println("num1-num2");
        System.out.println(num1-num2);
        
        //3.*
        System.out.println("3.*");
        System.out.println("num1*num2");
        System.out.println(num1*num2);
        
        //4./
        System.out.println("4./");
        System.out.println("num1/num2");
        System.out.println(num1/num2);
//        프로그래밍 언어에서 /표시는 몫만 구한다. 
//        따라서 3/7의 몫은 0이기 떄문에 0만 출력.
        
        //5.%
        //%연산자는 앞의 숫자 나누기 뒤의 숫자의 나머지를 구해준다.
        //즉 3%7은 3나누기7의 나머지인 3이 나오게 되는 것이다.
        System.out.println("5.%");
        System.out.println("num1%num2");
        System.out.println(num1%num2);
        
        //실수형 데이터타입끼리의 연산
        //1. double변수 mydouble1과 mydouble2를 선언하고 각각5.0 3.0으로 초기화
        double mydouble1 = 5.0;
        double mydouble2 = 7.0;
        System.out.println(mydouble1+mydouble2);
        System.out.println(mydouble1-mydouble2);
        System.out.println(mydouble1*mydouble2);
        System.out.println(mydouble1/mydouble2);
        System.out.println(mydouble1%mydouble2);
        
        //정수와 실수를 연산해보자
        System.out.println(num1+mydouble1);
        System.out.println(num1-mydouble1);
        System.out.println(num1*mydouble1);
        System.out.println(num1/mydouble1);
        System.out.println(num1%mydouble1);
                
        //주의할점:
        //아래의 코드는 문제가 있다.
        double average = 5/2;
        //위의 double변수 average의 값은 2.5가 아닌 2.0이 들어간다
        //왜냐면, 먼저 int/int인 5/2가 실행되어서
        //결과값 int 2가 나오게 되고 (* /표시는 몫만 구하기 때문에 2만 출력)
        //그 int값 2를 double로 바꾸게 되면 2.0이 되기때문이다!
        System.out.println("everage");
        System.out.println(average);
//        따라서 우리가 만약 정확한 결과값을 얻기 위해서는 
//        int/int가 아닌 int/double혹은double/int의 형태로 바꿔주어야한다.
//        그러므로 명시적 형변환을 둘 중 한곳에 해주어야한다
        average  = (double)5/2;//5에다가 명시적 현변환 해줌.
        System.out.println(average);
        
        /*String
         * 스트링이란 한국말로는 "문자열"이라고 표현되는 개념으로써 여러개의 글자를 모아둔 한개의 값이다.
         * 예를들어 우리가 ""로 묶어서 화면에 출력하는 여러글자들은 모두 하나의 스트링 값이다.
         * 
         * String도 하나의 데이터타입이기 떄문에 우리가 변수로 만들 수 있는데 여러가지 방법이 있지만 지금은 다은과 같은 방법을 사용
         * String 변수이름 = "저장한 글자들";
         */
        //String변수 name에 각자 이름을 저장하기!
        String name = "윤효민";
        System.out.println(name);
        
//        특이하게도 String값에는 +연산이 가능하다!
//        String값의+연산은 앞과 뒤를 String값으로 변환하여 한개의 커다란 String으로 연결해라 라는 의미가 된다.
        //예시1. 스트링+스트링
        System.out.println(name+"입니다");//출력: "name"+"입니다"->"name입니다"
        //예시2. 스트링+다른데이터타입 or다른 데이터타입+스트링
//        이때에는 다른 데이어타입의 값이 스트링으로 변환되고 2개가 이어져서 커다란 스트링값이 나온다.
        System.out.println("12"+345);//출력: "12"+"345"->"12345"
       
    }
}

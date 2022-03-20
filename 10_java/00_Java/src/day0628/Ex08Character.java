package day0628;
// 기본형 데이터타입 03

// 문자형(Character)

// 기본형 데이터타입 중 문자형 데이터타입은 
// char이라는 데이터타입이 담당한다.
// 맨처음 프로그램 언어에서 char는 7비트의 크기를 가지고 있었지만
// 이제는 64비트이다.

// char는 알파벳의 경우, ASCII 테이블 이라는 특수한 문자표를 사용하여
// 값을 저장하거나 출력할때 2진법 값을 자동으로 문자로 변환한다.
// 우리가 char 공간에 값을 저장할 때에는
// 문자 1개를 '로 감싸서 저장하거나 혹은 해당 글자의 10진법 값을 저장하는 방법을
// 사용 가능하다!

// 하지만 char 데이터타입은 사용되지 않는데, 왜냐하면
// 한번에 한개의 글자만 저장가능하기 때문이다!

public class Ex08Character {
    public static void main(String[] args) {
        // 1. char 변수 myChar를 선언해보자
        char myChar;
        // 2. myChar에 대문자 A를 저장해보자
        myChar = 'A';
        // 3. 화면에 myChar를 출력해보자
        System.out.println(myChar);
        // 4. myChar에 10진법 97을 저장해보자
        myChar = 97;
        // 5. 화면에 myChar를 출력해보자
        System.out.println(myChar);
    }
}

package day0628;
// 형변환(type casting)

// 형변환이란, 특정 데이터타입의 값을 다른 데이터타입의 값으로 변경하는 것을
// 형변환이라고 한다!

// 형변환에는 크게 암시적 형변환과 명시적 형변환 2가지 종류가 있다.
// 
//암시적 형변환(implicit type casting)
// 암시적 형변환이란, 우리가 특별히 형변환을 해달라고 말을 하지 않더라도
// 자바 내부적으로 값을 형변환해주는 것을 말한다.
// 좀더 명확하게 표현하자면, 더 작은 데이터타입의 값을 
// 더 큰 데이터타입의 변수 혹은 상수에 저장할때 암시적 형변환이 발생하여
// 더 작은 데이터타입의 값을 더 큰 데이터타입의 값으로 바꾸고 
// 저장이 실행된다.

// 명시적 형변환(explicit type casting)
// 명시적 형변환은 더 큰 데이터타입의 값을 더 작은 데이터타입의 공간에 할당할 때
// 오버플로우나 언더플로우로 대표되는 데이터손실을 무시하고 값을 저장하라는 의미가 된다.
// 이때에는 우리가 반드시 코드 상으로 "해당 데이터타입으로 바꿔!" 라고 명령해야한다!
// 바꾸는 방법은
// (바꿀 데이터타입)값; 으로 한다.
// 예시: myInt를 byte 값으로 바꿀려면?
// (byte)myInt;

// 만약 바꿀 값이 해당 데이터타입의 공간이 표시 가능한 값이면 문제가 없지만
// 만약 범위를 벗어나면? 언더플로우 혹은 오버플로우가 발생하게 된다!

public class Ex10TypeCasting {
    public static void main(String[] args) {
        // 암시적 형변환의 경우
        // 1. byte 변수 myByte 선언하고 3으로 초기화
        byte myByte = 3;
        // 2. int 변수 myInt 선언하고 myByte로 초기화
        int myInt = myByte;
        // 3. 화면에 myInt의 현재값 출력
        System.out.println(myInt);

        // 명시적 형변환의 경우
        // 1. myInt에 20을 할당한다.
        myInt = 20;
        // 2. myByte에 myInt의 현재값을 할당한다.
        myByte = (byte) myInt;
        // 3. 화면에 myByte의 현재값을 출력한다.
        System.out.println(myByte);

        // 오버플로우 체험해보기
        // 1. myByte에 127을 할당한다.
        myByte = 127;
        // 2. myByte의 현재값을 출력한다.
        System.out.println(myByte);
        // 3. myByte에 128을 할당한다.
        myByte = (byte) 128;
        // 4. myByte의 현재값을 출력한다.
        System.out.println(myByte);//출력값: -128
        // 5. myByte에 129를 할당한다.
        myByte = (byte) 256;
        // 6. myByte의 현재값을 출력한다.
        System.out.println(myByte);//출력값: 0

        // 언더플로우 체험해보기
        // 1. myByte에 -128을 할당한다.
        myByte = -128;
        // 2. myByte의 현재값을 출력한다.
        System.out.println(myByte);
        // 3. myByte에 -129를 할당한다.
        myByte = (byte) -129;
        // 4. myByte의 현재값을 출력한다.
        System.out.println(myByte);//출력값: 127

        // 예전처럼 리소스에 제한을 심하게 둘 필요가 없으므로
        // 편하게 int/double을 쓰면 된다!
    }
}

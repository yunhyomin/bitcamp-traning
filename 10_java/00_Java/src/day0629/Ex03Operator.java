package day0629;
//연산자 03
//비교연산자
/* 왼쪽의 값과 오른쪽의 값을 크거나 작거나 등으로 비교하여 
 * true/false의 boolean 값으로 나타낸다.
 */
public class Ex03Operator {
    public static void main(String[]args) {
        //1.int 변수 number1과 number2를 선언하고 초기화 한다.
        int number1 = 5;
        int number2 = 7;
        //A.<
        System.out.println("A.<");
        System.out.println("number1<number2:"+(number1<number2));
        System.out.println("number1<0:"+(number1<0));
        System.out.println("number1<5:"+(number1<5));
        System.out.println();

        //B.<=
        System.out.println("B.<=");
        System.out.println("number1<=number2:"+(number1<=number2));
        System.out.println("number1<=0"+(number1<=0));
        System.out.println("number1<=5"+(number1<=5));
        System.out.println();
        
        
        //C.==
        //2개의 값이 같으면 true, 다르면false가 리턴된다.
        System.out.println("C.==");
        System.out.println("number1==number2"+(number1==number2));
        System.out.println("number1==5"+(number1==5));
        System.out.println();
        
        //D.!=
        //2개의 값이 다르면 true, 같으면 false가 리턴된다.
        System.out.println("D.!=");
        System.out.println("number1!=number2"+(number1!=number2));
        System.out.println("number1!=5"+(number1!=5));
        System.out.println();
        
        //단,==이나 !=의 비교연산자는 기본형데이터타입에 대해서만 정확한 결과값을 연산한다.
        //참조형 데이터타입에 대해서는 부정확한 결과값을 연산할 수 있다.
        
        //String 변수를 만드는 3가지 방법
//        1. 변수="";
//        2. 변수= new String("");
//        3. 변수= 다른변수;
        //위의 방법을 사용하여 
        //"abc"라는 3글자가 등러간 3개의 String변수를 만들어보자
        
        String str1 = "abc";
        String str2 = new String("abc");
        String str3 = str1;
        
        //str1,2,3를 출력
        //단 출력할 내용을 []로 감싸서 명확하게 글자가 같은지도 보자
       System.out.println("str1:["+str1+"]");
       System.out.println("str2:["+str2+"]");
       System.out.println("str3:["+str3+"]");
       System.out.println(); 
       
       //str1,2,3,를 비교연산자를 통해서 같은 값을 가지고 있는지 비교해보자
      System.out.println("str1==str2:" + (str1==str2));//false
      System.out.println("str1==str3:" + (str1==str3));//true
      System.out.println("str2==str3:" + (str2==str3));//false
        
      //JVM에는 크게 
      /*stack,heap,method 3가지 메모리영역이 존재한다
       * stack:변수과 그 값을 저장
       * heap:참조형 데이터타입의 값과 세부내용을 저장
       * method:해당 자바프로그램이 실행시킬 코드를 저장*/
      
      //기본형 데이터타입의 겨우 stack영역의 변수과 2진법으로 변환된 현재 값이 저장된다.
      //즉, 해당변수의 실제값 자체가 stack에 저장되는것이다.
      
      //참조형 데이터타입의 경우 stack영역에 변수과 실제값이 저장된 heap영역으로 향하는
      //메모리주소값이 저장된다.
      //즉, 해당변수의 실제값은 heap에 저장이 되고, 그 실제 값을 확인하기 위해 stack영역에 
//      저장된 메모리 주소값을 "참조"해야 실제값을 알수있게 되는 구조가 되는것이다.
      
      //위의 String변수 str1,2,3은 String이라는 클래스의 변수
      //즉, 참조형 데이터 타입을 가진 변수이기 때문에 해당 변수들은 stack영역에
      //주소값만 저장이 되어있고, 실제값인 "abc"라는 글자는 heap영역에 
      //해당 주소값을 들어가야 찾을 수 있다.
      
      //하지만 비교연산자의 경우, 친절하게heap영역으로 들어가서 
      //실제글자가 뭐가 저장되어 있는지 확인해서 개별적으로 비교하는 것이 아니라
      //stack영역에 저장된 값만 기준으로 해서 비교를 하게 된다.
          
      //위의 str1,2,3의 초기화식을 보면
      //str1과 str3은 같은 주소값을 가지는 초기화 식이지만 
      //str2는 heap영역에 아예 새로운 공간을 만들어서 해당 공간의 주소값을 
      //저장하는 코드로 되어있다.
      
      //그렇기 때문에 같은 주소값을 가지고 있는 str1과 str3을 비교할떄에는 
      //비교연산자가 (==)가 true라는 값을 연산하지만
      //str1과 str2 혹은 str2과 str3을 비교연산하게 되면 
      //false라는 부정확한 값을 연산하게 된다.

      //따라서 참조형 데이터 타입의 변수의 값을 비교할때에는 
      //비교연산자를 사용하지 말아야한다!!
      
      //참조형 데이터타입의 값들은 비교연산자가 아닌 
      //equals()라는 메소드를 통해서 비교를 해야한다!!
      
     //str1의 현재 저장된 값이 str2의 현재 저장된 값과 같습니까?
     System.out.println("str1.equals(str2)"+ str1.equals(str2));//true
     
     //str1의 현재 저장된 값이 str3의 현재 저장된 값과 같습니까?
     System.out.println("str1.equals(str3)"+ str1.equals(str3));//true
     
     //str2의 현재 저장된 값이 str3의 현재 저장된 값과 같습니까?
     System.out.println("str2.equals(str3)"+ str1.equals(str3));//true
     
    }

}

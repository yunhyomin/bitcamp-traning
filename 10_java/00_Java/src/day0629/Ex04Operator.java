package day0629;

//연산자 04 
//논리연산자
/* boolean값에 대한 연산을 하게 되는데 
 * && : 두개의 blooean값이 모두 true일때에만 결과값이  true로 나온다.
 * || : 두개의 blooean값 중 하나라도 true이면 결과값이 true가 나온다.
 * ! : true는 false로, false는 true로 연산한다.
 * 3가지 연산자가 있다.
 */
public class Ex04Operator {

    public static void main(String[] args) {
        // TODO Auto-generated method stub
            //1. AND연산자 (&&)
       System.out.println("1.AND연산자");
      System.out.println("true && true:"+ (true && true));
      System.out.println("true && false:"+ (true && false));
      //아래의 두줄은 뒤의 true와 false에 노란줄이 가는데 
      //왜냐하면 앞이 false이고 AND 연산자가 붙으면 
      //뒤의 값은 실행하지 않더라도 무조건 결과값이 false이기 때문이다
      //->이럴경우 귀의 코드는 아예 실행이 되지 않는다.
      System.out.println("false && true:"+ (false && true));
      System.out.println("false && false:"+ (false && false));
      System.out.println("-------------------------");
      
      //2. OR 연산자(||)
       System.out.println("2.OR연산자");
       //OR연산자의 경우 둘 중 하나라도 true이면 true이기때문에 
       //연산자 앞에가 true일 경우 뒤의 코드는 아예 실행되지 않는다.
      System.out.println("true||true:"+(true||true));
      System.out.println("true||false:"+(true||false));
      System.out.println("false||true:"+(false||true));
      System.out.println("false||false:"+(false||false));
      System.out.println("-------------------------");
      
      //3. NOT연산자(!)
      boolean bool = true;
      System.out.println("!bool:"+!bool);
      System.out.println("bool의 현재값:"+bool);
     
      bool = false;
      System.out.println("!bool:"+!bool);
      System.out.println("bool의현재값:"+bool);
      System.out.println("-------------------------");
      
      //논리연산자의 현실적인 예
      //int변수의 값이 특정범위에 속하는지 체크하여 속하면 true,안속하면 false가 출력되는 코드
      
      //int변수 number의 값이 0~10사이면 true, 그 외에는 false가 리턴되는 코드
      int number = 14;
      System.out.println("0<number<10?"+(0<number&&number<10));//AND연산자사용
      
    }

}

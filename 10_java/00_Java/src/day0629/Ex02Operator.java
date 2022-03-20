package src.day0629;
//연산자 02
//할당연산자

//할당연산자는 오른쪽값을 연산하여 왼쪽 공간에 할당한다.

//할당연산자에는 =,=+,-=,*=,%=,++,--
public class Ex02Operator {
    public static void main(String[]args ) {
        //int변수 number선언
        int number ;
        //1. =
        //오른쪽값을 왼쪽 공간에 할당한다.
        System.out.println("1.=");
        
        number = 4; //4를 number에 할당
        System.out.println("number의현재값:"+number);//4
        
        //2. +=
        //왼쪽공간의 현재값에 오른쪽 값을 더한 경과값을 다시 왼쪽공간에 할당한다.
        System.out.println("2.+=");
        
        number += 1;//number의 현재값이 4에 오른쪽 값1을 더한 결과값인 
                    //5를 다시 number에 할당하라
        System.out.println("number의 현재값:"+number);//5
        System.out.println();
        
        //3. -= 
        //왼쪽공간의 현재값에 오른쪽 값을 뺸 결과값을 다시 왼쪽공간에 할당한다.
        System.out.println("3.-=");
        number -= 7;
        System.out.println("number의 현재값:"+number);//-2
        System.out.println();
        //4. *= 
        //왼쪽공간의 현재값에 오른쪽 값을 곱한 결과값을 다시 왼쪽공간에 할당
        System.out.println("4. *=");
        number *= 4;
        System.out.println("number의 현재값:"+number);//-8
        
        //5. /= 
        //왼쪽공간의 현재값에 오른쪽 값을 나눈 경과값을 다시 왼쪽공간에 할당.
        System.out.println("5. /=");
        number /= 2;
        System.out.println("number의 현재값:"+number);//-4
        
        //6. %=
        //왼쪽공간의 현재값에 오른쪽 값을 나눈 나머지를 다시 왼쪽공간에 할당.
        System.out.println("6.%=");
        number %= 2;
        System.out.println("number의 현재값:"+number);//0
        
        //+=의 경우,String 공간에도 사용가능한데 
//        오른쪽값을 왼쪽공간의 현재값에 뒤에 이어붙여서 하나의 커다란 String으로 만들어서 
//        왼쪽공간에 결과값을 저장해라
        String str = "1"; //1
        str +=2;//"12"
        str +="3";//"123"
        str +=4.5;//"1234.5"
        System.out.println("str의 현재값:"+str);//str의 현재값:"1234.5"
        
        //++,--는 좀 특이한 연산자로써 해당 변수의 값을 정확히 1씩 증가(감소)시킨다.
        //단, 변수의 앞에 붙냐 뒤에 붙냐에 따라서 의미가 달라지게 된다!
        
        //++혹은 --가 앞에 붙는경우 
        //전위증가(감소)연산자라고 부른다
        //<전위증감연산자>의 경우,해당 줄에서 가장 높은 우선순위
        //즉,가장빨리 실행되는 코드로 지정이 된다.
        
        System.out.println("1.전위증감연산자");
        System.out.println("number의 현재값:"+number);//0
        System.out.println("++numvber:"+ ++number);//0+1=1 ++number부터실행.
        //위 코드는 한줄로 되어있는것처럼 보이지만 
        //다음과 같은 과정을 거친다.
        //1.++number가 실행이 되어 number의 현재값인 0이1증가하여
        //  number의 현재값은 1이 된다.
        //2."++number:"뒤에 number의 현재값인 1이 이어져서
        //  "++number:1"이라는 String 값이 만들어진다.
        //3.System.out.println()이 해당 String값을 화면에 출력한다.
        
        System.out.println("number의 현재값:"+number);//1
        System.out.println();
        
        //++혹은 --가 변수의 뒤에 붙는 경우에는 <후위증감연산자>라고 부르며 해당줄에서 가장 마지막 
        //우선순위를 가진다. 즉, 가장 마지막에 실행이 된다.
        System.out.println("2.후위증감연산자");
        System.out.println("number의 현재값:"+number);//1
        System.out.println("number++:"+ number++);//"number++:1"이라는 String먼저 만들어짐.
        //위 코드는 다음과 같은 과정을 가진다.
        /*1."number++:"String값 뒤에 number의 현재값인 1이 이어져서 
         *  "number++:1"이라는 String값이 만들어진다.
         *2.System.out.println()이 해당 String 값을 화면에 출력한다.
         *3.number++이 실행되서 number의 현재값이 1에서 2로 증가한다.
         */
        System.out.println("number의 현재값:"+number);//2
        System.out.println();
     
       
    }
}

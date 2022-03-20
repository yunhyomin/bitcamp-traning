package day0629;
//Scanner
//자바에서 다양한 입력을 처리해주는 클래스인 Scanner 클래스는 
//단순한 키보드 입력뿐만이 아니라 고급 내용인 파일 입력,스트림 입력 등에서도 사용된다!

//Scanner의 경우 우리가 프로그램을 실행기키는데 반드시 필요로 하는 자동차옵션처럼
//우리가 사용하려면 우리 클래스에 스캐너 클래스를 사용하겠다고 "수입"해와야 한다.
//스캐너 클래스 뿐만이 아니라 다른 퍄시지 안의 클래스를 데이터 타입으로 만들어야 하는 경우에는 
//매번 우리가 수입해야한다.
//수입은 다음과 같이 이루어진다.
//import패키지이름.클래스이름;
//단, 수입은 public class~~~~이전에 나와야 한다.

import java.util.Scanner;//수입
public class Ex07Scanner {
    public static void main(String[] args) {
        //Scanner클래스 변수 선언하기
        Scanner/*클래스*/ scanner;/*변수*/
        
        //Scanner클래스 변수 초기화하기
        //Scanner클래스 변수를 초기화 할때에는 다음과 같은 형식을 가져야함.
        //변수이름 = new Scanner(입력받을 위치);
        //키보드 입력을 받아야 할때에는 입력받을 위치를 System.in으로 지정!!
        scanner = new Scanner(System.in);
        
        //1. int 입력받기 
        System.out.println("1.int 입력받기");
       //사용자로부터 int값을 입력받을 때에는 Scanner클래스 변수의 nextInt()메소드실행
        System.out.println("정수를 입력해주세요");
        System.out.print("> ");
        int number = scanner.nextInt();
        
        System.out.println("사용자가 입력한 정수:"+number);
        
        //2. double 입력받기
        System.out.println("2.double 입력받기");
        //사용자로부터 double의 값을 입력받을때에는 scanner클래스 변수의 nextDouble()메소드를 실행
        System.out.println("실수를 입력해주세요");
        System.out.print(">");
        double d = scanner.nextDouble();
        
        System.out.println("사용자가 입력한 실수:"+d);
        
        //3. String 입력받기
        System.out.println("3. String입력받기");
 //     사용자로부터 String을 입력받을때에는 next()혹은 nextLine()을 쓰게되는데
        //next()의 경우 스페이스 같은 일반적인 공백을 쓰면 그 공백 이전까지의 내용만 입력이 되지만
        //nextLine()은 반드시 엔터키를 입력해야 입력이 종료된다.
        System.out.println("이름을 입력해주세요.");
        System.out.print(">");
        String name;
        //next()의 경우
//        name = scanner.next();
        
        //nextLine()의 경우
        //nextLine()을 사용할때 주의 할점.
        //nextInt(),nextDouble()등의 숫자를 입력받는 메소드 이후에 nextLine()을 사용하게 되면, 
        //Scanner클래스의 버퍼메모리를 읽어오는 방식에서
        //발생하는 버그때문에 실제론 아무런값도 입력해줄 수 없는 상태가 된다.
        //이런한 버그를 해결하는 방법은 매우 간단하다.
        //실제값을 저장하는 nextLine() 이전에 nextLine()을 한번 더 적어주면 해결!
        
        //단,nextLine()이 실행된 이후거나 프로그램의 맨 처음일 경우,
        //즉 버퍼메모리에 아무것도 없을 경우에는 다음 방법을 쓰면 안된다.
        //왜냐면 버퍼메모리의 남아있는 엔터키를 제거하기 위해 적은 
        //scanner.nextLine()도 입력을 받기 위해 대기하는 상태가 되어버리기 때문!!!
        
        scanner.nextLine();//버그를 해결하기 위해 한번 더 적어줌!@
        name = scanner.nextLine();

        System.out.println("사용자의 이름:"+name);
        
        //Scanner클래스 변수와 같이 
        //버퍼메모리 등의 외부 메모리를 읽어오는 클래스 변수는 
        //반드시 프로그램 제일 마지막에 close()메소드를 실행시켜주는 것이 좋다.
        
        scanner.close();
        
        

        
    }

}

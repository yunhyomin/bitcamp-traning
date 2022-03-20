package day0701;
//사원의 정보를 저장하고 출력하는 프로그램을 작성하시오 

import java.lang.System.Logger.Level;
import java.lang.invoke.MethodHandles.Lookup.ClassOption;
import java.net.SocketTimeoutException;
import java.security.MessageDigest;

//단 사원의 정보를 입력할때에는 메뉴에서 "입력"이라는 글자를 입력해야 입력 기능이 실행 되고 
//출력할때에는 마찬가지 "출력"이라고 입력해야 출력기능이 실행되게 츠로그램을 작성하시오
//(힌트:참조형 데이터타입의 비교는?)
//또한 아무런 정보가 입력되지 않은상태에서는 사용자가 출력을 선택하면, 입력된 정보가 없음을 알려야 합니다.

//사원의 정보에는 다음과 같은 것이 있어야한다.
//1.사원번호
//2.사원이름
//3.사원직급
//4.사원부서
//5.사원월급

import java.util.Scanner;

import javax.swing.SortingFocusTraversalPolicy;

public class EmployeeBook {
    public static void main(String[]args) {
        Scanner scanner = new Scanner(System.in);
        //변수선언
        int id = 0;
        String name= "";
        String level= "";
        String dep= "";
        int sal = 0;
        boolean inputSwitch = false;//아직 값이 입력되지 않았기 때문에 
        
        while(true) {
            System.out.println("입력/출력/종료");
            System.out.print(">");
           String userChoice  = scanner.nextLine();
           
           if(userChoice.equals("입력")) {
               
               System.out.println("입력시작");
               //번호입력
               System.out.println("번호를 입력하세요");
               System.out.print(">");
               id = scanner.nextInt();
               //이름입력
               System.out.println("이름을 입력하세요");
               System.out.print(">");
               name = scanner.nextLine();
               //직급입력
               System.out.println("직급을 입력하세요");
               System.out.print(">");
               level = scanner.nextLine();
               //부서입력
               System.out.println("부서를 입력하세요");
               System.out.print(">");
               dep = scanner.nextLine();
               //월급입력
               System.out.println("월급을 입력하세요");
               System.out.print(">"); 
               sal= scanner.nextInt();
               
               scanner.nextLine();//다시 반복할때 버퍼메모리를 비워주기 위해 
               inputSwitch = true;//값이 입력되었기 때문에 inpurSwitch를 true로 바꿔준다
           }
               else if(userChoice.equals("출력")) {
               
               if(inputSwitch) {
               
               System.out.printf("1.사원번호: %d번\n 2.사원이름: %s\n 3.사원직급: %s\n "
                       + "4.사원부서: %s\n 5.사원월급: %d원\n",id,name,level,dep,sal);
           }else {
               System.out.println("아직 입력된 정보가 없습니다.");
           }
           }else if(userChoice.equals("종료") ){
               System.out.println("사용해주셔서 감사합니다.");
               break;
        }
        scanner.close();
    }
    }
}

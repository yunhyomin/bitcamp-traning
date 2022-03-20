package day0630;
//사용자로부터 이름,키,몸무게를 입력받아서 
//다음과 같은 형식으로 출력되는 프로그램을 작성

//출력결과)
///이름:김땡땡 키:#.##m 몸무게:##.##kg
//BMI:##.### 비만도:과체중

import java.util.Scanner;

public class BmiChecker {
 public static void main(String[]agrs) {
      Scanner scanner = new Scanner(System.in);
      //각 비만도의 기준점이 될 상수
              final double STANDARD_I=18.5;//소프트코딩을 하기위해 상수를 선언
              final double STANDARD_II=23;
              final double STANDARD_III=25;
      
      System.out.println("이름을 입력하세요");//이름 입력받음 
      System.out.print(">");
      String name = scanner.nextLine();
      
      System.out.println("키를 입력하세요");//키 입력받음
      System.out.println(">");
      double h = scanner.nextDouble();
            
      System.out.println("몸무게를 입력하세요");//몸무게 입력받음
      System.out.println(">");
      double k = scanner.nextDouble();

      double BMI = k/h/h;///BMI계산
      
      String result;//if-else if구조를 통하여 비만도를 'result'로 String에 저장
      if(BMI<STANDARD_I) {
          result = ("저체중");
      }else if(BMI<STANDARD_II){
          result = ("정상체중");
      }else if(BMI<STANDARD_III) {
          result = ("과체중");
      }else {
          result = ("비만");
          
      }
      //출력
      System.out.printf("이름:%s 키:%.2fm 몸무게:%.2fkg\n",name,h,k);
      System.out.printf("BMI:%.3f 비만도:%s\n",BMI,result);
      System.out.println(result);        
      scanner.close();
      
 }
}

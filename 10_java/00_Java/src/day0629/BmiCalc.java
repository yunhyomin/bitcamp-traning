package day0629;

//사용자로부터 이름,키, 몸무게를 입력받아서 
//이름:### 키:#.##m 몸무게:##.##kg
//BMI수치: ##.###
//의 형식으로 출력되는 프로그래믕ㄹ 작성하시오
//단, 키는 m단위이고 몸무게는 kg단위입니다.
//BMI공식은 몸무게/키/키 입니다.
import java.util.Scanner;
public class BmiCalc {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        
        System.out.println("이름입력");//이름입력받아 변수에 저장
        System.out.print(">");
        String name = scanner.nextLine();
        
        System.out.println("키를 m단위로 입력");//키입력받아 변수에저장
        System.out.print(">");

        double h = scanner.nextDouble();

        System.out.println("몸무게를 kg단위로 입력");//몸무게입력받아 변수에 저장
        System.out.print(">");

        double K = scanner.nextDouble();

        
        double BMI = K / h / h;//BMI를 변수에 저장
        //출력
        System.out.printf("이름: %s 키: %.2f m 몸무게: %.2f kg\n",name,h,K);
        System.out.printf("BMI수치:%.3f\n", BMI);
    
        scanner.close();
    }
    

}
